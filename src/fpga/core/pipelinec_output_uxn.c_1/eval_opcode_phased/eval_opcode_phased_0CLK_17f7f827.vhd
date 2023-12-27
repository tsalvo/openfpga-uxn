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
-- BIN_OP_AND[uxn_opcodes_h_l2863_c14_52f8]
signal BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2864_c14_13c8]
signal BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2864_c14_a5da]
signal BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2864_c14_8c9e]
signal UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2864_c14_8d11]
signal BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2864_c14_5363]
signal MUX_uxn_opcodes_h_l2864_c14_5363_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2864_c14_5363_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2864_c14_5363_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2864_c14_5363_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2865_c8_624e]
signal MUX_uxn_opcodes_h_l2865_c8_624e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2865_c8_624e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2865_c8_624e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2865_c8_624e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2871_c6_a0ed]
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c7_6f58]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output : unsigned(0 downto 0);

-- is_wait_MUX[uxn_opcodes_h_l2871_c2_c9b2]
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2871_c2_c9b2]
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output : opcode_result_t;

-- brk[uxn_opcodes_h_l2871_c48_6413]
signal brk_uxn_opcodes_h_l2871_c48_6413_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2871_c48_6413_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2872_c11_c4d4]
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c1_6644]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_030f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2872_c7_6f58]
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2872_c40_bc32]
signal jci_uxn_opcodes_h_l2872_c40_bc32_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_bc32_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_bc32_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_bc32_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_bc32_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2872_c40_bc32_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_cdd8]
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_5f75]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_83cf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2873_c7_030f]
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2873_c40_0376]
signal jmi_uxn_opcodes_h_l2873_c40_0376_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_0376_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_0376_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_0376_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2873_c40_0376_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_60b3]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_bf60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_744b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2874_c7_83cf]
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2874_c40_2fb2]
signal jsi_uxn_opcodes_h_l2874_c40_2fb2_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_2fb2_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_2fb2_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_2fb2_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2874_c40_2fb2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_09c1]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_db0f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_0cd9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2875_c7_744b]
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2875_c40_8775]
signal lit_uxn_opcodes_h_l2875_c40_8775_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_8775_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_8775_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_8775_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2875_c40_8775_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_ae39]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_ef32]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_7ad0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2876_c7_0cd9]
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2876_c40_9f70]
signal lit2_uxn_opcodes_h_l2876_c40_9f70_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_9f70_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_9f70_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_9f70_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2876_c40_9f70_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_5fed]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_dbb1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_87be]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2877_c7_7ad0]
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2877_c40_2981]
signal lit_uxn_opcodes_h_l2877_c40_2981_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_2981_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_2981_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_2981_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2877_c40_2981_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_22a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_f497]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_a653]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2878_c7_87be]
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2878_c40_71a1]
signal lit2_uxn_opcodes_h_l2878_c40_71a1_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_71a1_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_71a1_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_71a1_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2878_c40_71a1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_782d]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_e2b2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_361a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2879_c7_a653]
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2879_c40_f4c6]
signal inc_uxn_opcodes_h_l2879_c40_f4c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_f4c6_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_f4c6_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_f4c6_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2879_c40_f4c6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_9783]
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_2f67]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_17e4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2880_c7_361a]
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2880_c40_0ad1]
signal inc2_uxn_opcodes_h_l2880_c40_0ad1_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_0ad1_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_0ad1_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_0ad1_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2880_c40_0ad1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_802e]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_56c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_b6c6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2881_c7_17e4]
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2881_c40_467d]
signal pop_uxn_opcodes_h_l2881_c40_467d_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2881_c40_467d_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2881_c40_467d_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2881_c40_467d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_33ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_8178]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_f454]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2882_c7_b6c6]
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2882_c40_2b42]
signal pop2_uxn_opcodes_h_l2882_c40_2b42_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2882_c40_2b42_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2882_c40_2b42_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2882_c40_2b42_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_dae5]
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_f13d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_cbc2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2883_c7_f454]
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2883_c40_4447]
signal nip_uxn_opcodes_h_l2883_c40_4447_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_4447_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_4447_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_4447_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2883_c40_4447_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_b011]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_2709]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_43db]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2884_c7_cbc2]
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2884_c40_1226]
signal nip2_uxn_opcodes_h_l2884_c40_1226_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_1226_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_1226_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_1226_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2884_c40_1226_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_abfa]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_659e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_1506]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2885_c7_43db]
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2885_c40_ac09]
signal swp_uxn_opcodes_h_l2885_c40_ac09_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_ac09_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_ac09_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_ac09_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2885_c40_ac09_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_f2fd]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_473d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_d306]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2886_c7_1506]
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2886_c40_e578]
signal swp2_uxn_opcodes_h_l2886_c40_e578_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_e578_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_e578_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_e578_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2886_c40_e578_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_edda]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_8d3f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_c4a7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2887_c7_d306]
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2887_c40_22af]
signal rot_uxn_opcodes_h_l2887_c40_22af_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_22af_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_22af_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_22af_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2887_c40_22af_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_07d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_2f7d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_2753]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c7_c4a7]
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2888_c40_852a]
signal rot2_uxn_opcodes_h_l2888_c40_852a_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_852a_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_852a_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_852a_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2888_c40_852a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_742b]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_aef7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_c056]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c7_2753]
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2889_c40_eb5e]
signal dup_uxn_opcodes_h_l2889_c40_eb5e_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_eb5e_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_eb5e_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_eb5e_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2889_c40_eb5e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_dc83]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_9863]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_df72]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_c056]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2890_c40_9063]
signal dup2_uxn_opcodes_h_l2890_c40_9063_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_9063_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_9063_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_9063_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2890_c40_9063_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_edaf]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_88d9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_708a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_df72]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2891_c40_8669]
signal ovr_uxn_opcodes_h_l2891_c40_8669_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_8669_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_8669_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_8669_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2891_c40_8669_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_24df]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_3f67]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_f4b1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_708a]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2892_c40_eac0]
signal ovr2_uxn_opcodes_h_l2892_c40_eac0_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_eac0_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_eac0_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_eac0_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2892_c40_eac0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_99c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_8b07]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_b415]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_f4b1]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2893_c40_0a91]
signal equ_uxn_opcodes_h_l2893_c40_0a91_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_0a91_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_0a91_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_0a91_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2893_c40_0a91_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_f14b]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_2f3a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_5385]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_b415]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2894_c40_259d]
signal equ2_uxn_opcodes_h_l2894_c40_259d_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_259d_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_259d_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_259d_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2894_c40_259d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_ac0a]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_5fb0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_0c17]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_5385]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2895_c40_7fda]
signal neq_uxn_opcodes_h_l2895_c40_7fda_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_7fda_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_7fda_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_7fda_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2895_c40_7fda_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_4400]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_cd22]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_0883]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_0c17]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2896_c40_cdab]
signal neq2_uxn_opcodes_h_l2896_c40_cdab_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_cdab_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_cdab_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_cdab_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2896_c40_cdab_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_c76f]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_02f6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_6db7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_0883]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2897_c40_2bd8]
signal gth_uxn_opcodes_h_l2897_c40_2bd8_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_2bd8_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_2bd8_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_2bd8_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2897_c40_2bd8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_6565]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_3deb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_75b0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_6db7]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2898_c40_bb4d]
signal gth2_uxn_opcodes_h_l2898_c40_bb4d_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_bb4d_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_bb4d_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_bb4d_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2898_c40_bb4d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_2448]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_2e7a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_6cea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_75b0]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2899_c40_ca58]
signal lth_uxn_opcodes_h_l2899_c40_ca58_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_ca58_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_ca58_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_ca58_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2899_c40_ca58_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_349d]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_d637]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_fc1f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_6cea]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2900_c40_57a7]
signal lth2_uxn_opcodes_h_l2900_c40_57a7_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_57a7_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_57a7_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_57a7_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2900_c40_57a7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_c0cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_c6a4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_8f83]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_fc1f]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2901_c40_407e]
signal jmp_uxn_opcodes_h_l2901_c40_407e_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_407e_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_407e_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_407e_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_407e_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2901_c40_407e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_c845]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_ef67]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_aa81]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_8f83]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2902_c40_c4f8]
signal jmp2_uxn_opcodes_h_l2902_c40_c4f8_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_c4f8_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_c4f8_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_c4f8_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2902_c40_c4f8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_7c2b]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_1b17]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_f22b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_aa81]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2903_c40_a7d1]
signal jcn_uxn_opcodes_h_l2903_c40_a7d1_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_a7d1_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_a7d1_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_a7d1_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_a7d1_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2903_c40_a7d1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_5514]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_1070]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_b5da]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_f22b]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2904_c40_5466]
signal jcn2_uxn_opcodes_h_l2904_c40_5466_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_5466_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_5466_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_5466_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2904_c40_5466_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_e455]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_00a1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_e627]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_b5da]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2905_c40_3732]
signal jsr_uxn_opcodes_h_l2905_c40_3732_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_3732_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_3732_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_3732_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_3732_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2905_c40_3732_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_1f07]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_b8b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_d450]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_e627]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2906_c40_18dd]
signal jsr2_uxn_opcodes_h_l2906_c40_18dd_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_18dd_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_18dd_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_18dd_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_18dd_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2906_c40_18dd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_9119]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_8875]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_4775]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_d450]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2907_c40_407a]
signal sth_uxn_opcodes_h_l2907_c40_407a_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_407a_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_407a_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_407a_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2907_c40_407a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_4d30]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_f0ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_9a5e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_4775]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2908_c40_db30]
signal sth2_uxn_opcodes_h_l2908_c40_db30_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_db30_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_db30_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_db30_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2908_c40_db30_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_6a92]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_3e1f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_d1f4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_9a5e]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2909_c40_0717]
signal ldz_uxn_opcodes_h_l2909_c40_0717_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_0717_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_0717_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_0717_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_0717_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2909_c40_0717_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_67e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_3216]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_ff52]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_d1f4]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2910_c40_1f1d]
signal ldz2_uxn_opcodes_h_l2910_c40_1f1d_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_1f1d_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_1f1d_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_1f1d_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_1f1d_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2910_c40_1f1d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_ac2a]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_42d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_e0cf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_ff52]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2911_c40_fa75]
signal stz_uxn_opcodes_h_l2911_c40_fa75_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_fa75_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_fa75_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_fa75_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2911_c40_fa75_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_b41c]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_ae23]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_eefe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_e0cf]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2912_c40_b0af]
signal stz2_uxn_opcodes_h_l2912_c40_b0af_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_b0af_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_b0af_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_b0af_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2912_c40_b0af_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_762c]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_75a6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_1523]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_eefe]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2913_c40_6d89]
signal ldr_uxn_opcodes_h_l2913_c40_6d89_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_6d89_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_6d89_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_6d89_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_6d89_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_6d89_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2913_c40_6d89_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_e95e]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_6321]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_f169]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_1523]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2914_c40_014f]
signal ldr2_uxn_opcodes_h_l2914_c40_014f_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_014f_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_014f_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_014f_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_014f_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_014f_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2914_c40_014f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_9298]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_8f93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_e7e0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_f169]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2915_c40_50f4]
signal str1_uxn_opcodes_h_l2915_c40_50f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_50f4_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_50f4_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_50f4_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_50f4_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2915_c40_50f4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_e0f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_07a4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_8222]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_e7e0]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2916_c40_a429]
signal str2_uxn_opcodes_h_l2916_c40_a429_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_a429_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_a429_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_a429_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_a429_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2916_c40_a429_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_2878]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_88cf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_96cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_8222]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2917_c40_cac1]
signal lda_uxn_opcodes_h_l2917_c40_cac1_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_cac1_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_cac1_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_cac1_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_cac1_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2917_c40_cac1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_d136]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_04ab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_a603]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_96cc]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2918_c40_8a4b]
signal lda2_uxn_opcodes_h_l2918_c40_8a4b_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_8a4b_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_8a4b_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_8a4b_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_8a4b_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2918_c40_8a4b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_f516]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_69b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_0012]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_a603]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2919_c40_3ec7]
signal sta_uxn_opcodes_h_l2919_c40_3ec7_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_3ec7_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_3ec7_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_3ec7_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2919_c40_3ec7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_3df8]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_0872]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_2fce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_0012]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2920_c40_aee4]
signal sta2_uxn_opcodes_h_l2920_c40_aee4_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_aee4_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_aee4_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_aee4_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2920_c40_aee4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_a0e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_2c27]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_77c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_2fce]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2921_c40_35ae]
signal dei_uxn_opcodes_h_l2921_c40_35ae_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_35ae_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_35ae_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_35ae_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_35ae_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2921_c40_35ae_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_9826]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_ffc9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_53b0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_77c5]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2922_c40_6712]
signal dei2_uxn_opcodes_h_l2922_c40_6712_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_6712_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_6712_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_6712_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_6712_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2922_c40_6712_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_b54b]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_ffe2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_2748]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_53b0]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2923_c40_63e4]
signal deo_uxn_opcodes_h_l2923_c40_63e4_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_63e4_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_63e4_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_63e4_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_63e4_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_63e4_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2923_c40_63e4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_0cdc]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_2f1a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_32fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_2748]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2924_c40_6340]
signal deo2_uxn_opcodes_h_l2924_c40_6340_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_6340_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_6340_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_6340_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_6340_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_6340_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2924_c40_6340_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_facf]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_ff76]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_354f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_32fd]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2925_c40_faf5]
signal add_uxn_opcodes_h_l2925_c40_faf5_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2925_c40_faf5_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2925_c40_faf5_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2925_c40_faf5_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2925_c40_faf5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_14ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_289e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_4d8a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_354f]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2926_c40_f11a]
signal add2_uxn_opcodes_h_l2926_c40_f11a_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_f11a_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_f11a_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_f11a_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2926_c40_f11a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_ac4a]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_3e0c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_0a1a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_4d8a]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2927_c40_f1ef]
signal sub_uxn_opcodes_h_l2927_c40_f1ef_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_f1ef_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_f1ef_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_f1ef_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2927_c40_f1ef_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_dce8]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_adeb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_5524]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_0a1a]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2928_c40_54df]
signal sub2_uxn_opcodes_h_l2928_c40_54df_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_54df_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_54df_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_54df_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2928_c40_54df_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_254c]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_1e9e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_d8f2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_5524]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2929_c40_3115]
signal mul_uxn_opcodes_h_l2929_c40_3115_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_3115_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_3115_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_3115_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2929_c40_3115_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_c5dc]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_52a3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_b1f3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_d8f2]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2930_c40_1f7c]
signal mul2_uxn_opcodes_h_l2930_c40_1f7c_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_1f7c_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_1f7c_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_1f7c_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2930_c40_1f7c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_477b]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_b8bc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_b07d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_b1f3]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2931_c40_6e1b]
signal div_uxn_opcodes_h_l2931_c40_6e1b_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2931_c40_6e1b_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2931_c40_6e1b_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2931_c40_6e1b_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2931_c40_6e1b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_66d3]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_ec4a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_1fbc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_b07d]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2932_c40_c1fc]
signal div2_uxn_opcodes_h_l2932_c40_c1fc_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_c1fc_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_c1fc_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_c1fc_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2932_c40_c1fc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_63fd]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_abef]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_a5c8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_1fbc]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2933_c40_bb5c]
signal and_uxn_opcodes_h_l2933_c40_bb5c_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2933_c40_bb5c_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2933_c40_bb5c_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2933_c40_bb5c_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2933_c40_bb5c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_1ddd]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_6a87]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_f617]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_a5c8]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2934_c40_5a3a]
signal and2_uxn_opcodes_h_l2934_c40_5a3a_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_5a3a_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_5a3a_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_5a3a_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2934_c40_5a3a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_66de]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_7d0a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_7554]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_f617]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2935_c40_e267]
signal ora_uxn_opcodes_h_l2935_c40_e267_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_e267_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_e267_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_e267_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2935_c40_e267_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_8f03]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_54f6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_d719]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_7554]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2936_c40_7d24]
signal ora2_uxn_opcodes_h_l2936_c40_7d24_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_7d24_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_7d24_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_7d24_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2936_c40_7d24_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_4aec]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_1461]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_4806]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_d719]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2937_c40_3900]
signal eor_uxn_opcodes_h_l2937_c40_3900_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_3900_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_3900_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_3900_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2937_c40_3900_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_ecdc]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_53e4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_e247]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_4806]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2938_c40_b1e0]
signal eor2_uxn_opcodes_h_l2938_c40_b1e0_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_b1e0_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_b1e0_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_b1e0_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2938_c40_b1e0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_75f3]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_9683]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_4709]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_e247]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2939_c40_a141]
signal sft_uxn_opcodes_h_l2939_c40_a141_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_a141_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_a141_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_a141_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2939_c40_a141_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_4c70]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_53a3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_4709]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2940_c40_84ae]
signal sft2_uxn_opcodes_h_l2940_c40_84ae_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_84ae_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_84ae_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_84ae_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2940_c40_84ae_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2942_c16_f64c]
signal CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2943_c2_7a90]
signal BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2945_c2_0942]
signal sp0_MUX_uxn_opcodes_h_l2945_c2_0942_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2945_c2_0942_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2945_c2_0942_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2945_c2_0942_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2945_c2_0942]
signal sp1_MUX_uxn_opcodes_h_l2945_c2_0942_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2945_c2_0942_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2945_c2_0942_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2945_c2_0942_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2946_c3_05ae]
signal BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2948_c3_0a1f]
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2951_c29_26f4]
signal MUX_uxn_opcodes_h_l2951_c29_26f4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2951_c29_26f4_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2951_c29_26f4_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2951_c29_26f4_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2951_c19_fb6c]
signal BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2952_c20_ea05]
signal MUX_uxn_opcodes_h_l2952_c20_ea05_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2952_c20_ea05_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2952_c20_ea05_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2952_c20_ea05_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2952_c2_6fea]
signal BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_left : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_return_output : unsigned(9 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2954_c24_83b2]
signal stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8
BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_left,
BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_right,
BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_left,
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_right,
BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da
BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_left,
BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_right,
BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e
UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_left,
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_right,
BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_return_output);

-- MUX_uxn_opcodes_h_l2864_c14_5363
MUX_uxn_opcodes_h_l2864_c14_5363 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2864_c14_5363_cond,
MUX_uxn_opcodes_h_l2864_c14_5363_iftrue,
MUX_uxn_opcodes_h_l2864_c14_5363_iffalse,
MUX_uxn_opcodes_h_l2864_c14_5363_return_output);

-- MUX_uxn_opcodes_h_l2865_c8_624e
MUX_uxn_opcodes_h_l2865_c8_624e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2865_c8_624e_cond,
MUX_uxn_opcodes_h_l2865_c8_624e_iftrue,
MUX_uxn_opcodes_h_l2865_c8_624e_iffalse,
MUX_uxn_opcodes_h_l2865_c8_624e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_left,
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_right,
BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2
is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_cond,
is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_iftrue,
is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_iffalse,
is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2
opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_cond,
opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output);

-- brk_uxn_opcodes_h_l2871_c48_6413
brk_uxn_opcodes_h_l2871_c48_6413 : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2871_c48_6413_phase,
brk_uxn_opcodes_h_l2871_c48_6413_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_left,
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_right,
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58
opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_cond,
opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_iftrue,
opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_iffalse,
opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output);

-- jci_uxn_opcodes_h_l2872_c40_bc32
jci_uxn_opcodes_h_l2872_c40_bc32 : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2872_c40_bc32_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2872_c40_bc32_phase,
jci_uxn_opcodes_h_l2872_c40_bc32_pc,
jci_uxn_opcodes_h_l2872_c40_bc32_previous_stack_read,
jci_uxn_opcodes_h_l2872_c40_bc32_previous_ram_read,
jci_uxn_opcodes_h_l2872_c40_bc32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_left,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_right,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2873_c7_030f
opc_result_MUX_uxn_opcodes_h_l2873_c7_030f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_cond,
opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_return_output);

-- jmi_uxn_opcodes_h_l2873_c40_0376
jmi_uxn_opcodes_h_l2873_c40_0376 : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2873_c40_0376_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2873_c40_0376_phase,
jmi_uxn_opcodes_h_l2873_c40_0376_pc,
jmi_uxn_opcodes_h_l2873_c40_0376_previous_ram_read,
jmi_uxn_opcodes_h_l2873_c40_0376_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf
opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_cond,
opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output);

-- jsi_uxn_opcodes_h_l2874_c40_2fb2
jsi_uxn_opcodes_h_l2874_c40_2fb2 : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2874_c40_2fb2_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2874_c40_2fb2_phase,
jsi_uxn_opcodes_h_l2874_c40_2fb2_pc,
jsi_uxn_opcodes_h_l2874_c40_2fb2_previous_ram_read,
jsi_uxn_opcodes_h_l2874_c40_2fb2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2875_c7_744b
opc_result_MUX_uxn_opcodes_h_l2875_c7_744b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_cond,
opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_return_output);

-- lit_uxn_opcodes_h_l2875_c40_8775
lit_uxn_opcodes_h_l2875_c40_8775 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2875_c40_8775_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2875_c40_8775_phase,
lit_uxn_opcodes_h_l2875_c40_8775_pc,
lit_uxn_opcodes_h_l2875_c40_8775_previous_ram_read,
lit_uxn_opcodes_h_l2875_c40_8775_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9
opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_cond,
opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output);

-- lit2_uxn_opcodes_h_l2876_c40_9f70
lit2_uxn_opcodes_h_l2876_c40_9f70 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2876_c40_9f70_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2876_c40_9f70_phase,
lit2_uxn_opcodes_h_l2876_c40_9f70_pc,
lit2_uxn_opcodes_h_l2876_c40_9f70_previous_ram_read,
lit2_uxn_opcodes_h_l2876_c40_9f70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0
opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_cond,
opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output);

-- lit_uxn_opcodes_h_l2877_c40_2981
lit_uxn_opcodes_h_l2877_c40_2981 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2877_c40_2981_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2877_c40_2981_phase,
lit_uxn_opcodes_h_l2877_c40_2981_pc,
lit_uxn_opcodes_h_l2877_c40_2981_previous_ram_read,
lit_uxn_opcodes_h_l2877_c40_2981_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2878_c7_87be
opc_result_MUX_uxn_opcodes_h_l2878_c7_87be : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_cond,
opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_iftrue,
opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_iffalse,
opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_return_output);

-- lit2_uxn_opcodes_h_l2878_c40_71a1
lit2_uxn_opcodes_h_l2878_c40_71a1 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2878_c40_71a1_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2878_c40_71a1_phase,
lit2_uxn_opcodes_h_l2878_c40_71a1_pc,
lit2_uxn_opcodes_h_l2878_c40_71a1_previous_ram_read,
lit2_uxn_opcodes_h_l2878_c40_71a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2879_c7_a653
opc_result_MUX_uxn_opcodes_h_l2879_c7_a653 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_cond,
opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_iftrue,
opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_iffalse,
opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_return_output);

-- inc_uxn_opcodes_h_l2879_c40_f4c6
inc_uxn_opcodes_h_l2879_c40_f4c6 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2879_c40_f4c6_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2879_c40_f4c6_phase,
inc_uxn_opcodes_h_l2879_c40_f4c6_ins,
inc_uxn_opcodes_h_l2879_c40_f4c6_previous_stack_read,
inc_uxn_opcodes_h_l2879_c40_f4c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_left,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_right,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2880_c7_361a
opc_result_MUX_uxn_opcodes_h_l2880_c7_361a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_cond,
opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_return_output);

-- inc2_uxn_opcodes_h_l2880_c40_0ad1
inc2_uxn_opcodes_h_l2880_c40_0ad1 : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2880_c40_0ad1_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2880_c40_0ad1_phase,
inc2_uxn_opcodes_h_l2880_c40_0ad1_ins,
inc2_uxn_opcodes_h_l2880_c40_0ad1_previous_stack_read,
inc2_uxn_opcodes_h_l2880_c40_0ad1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4
opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_cond,
opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output);

-- pop_uxn_opcodes_h_l2881_c40_467d
pop_uxn_opcodes_h_l2881_c40_467d : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2881_c40_467d_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2881_c40_467d_phase,
pop_uxn_opcodes_h_l2881_c40_467d_ins,
pop_uxn_opcodes_h_l2881_c40_467d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6
opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_cond,
opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output);

-- pop2_uxn_opcodes_h_l2882_c40_2b42
pop2_uxn_opcodes_h_l2882_c40_2b42 : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2882_c40_2b42_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2882_c40_2b42_phase,
pop2_uxn_opcodes_h_l2882_c40_2b42_ins,
pop2_uxn_opcodes_h_l2882_c40_2b42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_left,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_right,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2883_c7_f454
opc_result_MUX_uxn_opcodes_h_l2883_c7_f454 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_cond,
opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_iftrue,
opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_iffalse,
opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_return_output);

-- nip_uxn_opcodes_h_l2883_c40_4447
nip_uxn_opcodes_h_l2883_c40_4447 : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2883_c40_4447_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2883_c40_4447_phase,
nip_uxn_opcodes_h_l2883_c40_4447_ins,
nip_uxn_opcodes_h_l2883_c40_4447_previous_stack_read,
nip_uxn_opcodes_h_l2883_c40_4447_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2
opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_cond,
opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output);

-- nip2_uxn_opcodes_h_l2884_c40_1226
nip2_uxn_opcodes_h_l2884_c40_1226 : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2884_c40_1226_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2884_c40_1226_phase,
nip2_uxn_opcodes_h_l2884_c40_1226_ins,
nip2_uxn_opcodes_h_l2884_c40_1226_previous_stack_read,
nip2_uxn_opcodes_h_l2884_c40_1226_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2885_c7_43db
opc_result_MUX_uxn_opcodes_h_l2885_c7_43db : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_cond,
opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_iftrue,
opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_iffalse,
opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_return_output);

-- swp_uxn_opcodes_h_l2885_c40_ac09
swp_uxn_opcodes_h_l2885_c40_ac09 : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2885_c40_ac09_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2885_c40_ac09_phase,
swp_uxn_opcodes_h_l2885_c40_ac09_ins,
swp_uxn_opcodes_h_l2885_c40_ac09_previous_stack_read,
swp_uxn_opcodes_h_l2885_c40_ac09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2886_c7_1506
opc_result_MUX_uxn_opcodes_h_l2886_c7_1506 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_cond,
opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_iftrue,
opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_iffalse,
opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_return_output);

-- swp2_uxn_opcodes_h_l2886_c40_e578
swp2_uxn_opcodes_h_l2886_c40_e578 : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2886_c40_e578_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2886_c40_e578_phase,
swp2_uxn_opcodes_h_l2886_c40_e578_ins,
swp2_uxn_opcodes_h_l2886_c40_e578_previous_stack_read,
swp2_uxn_opcodes_h_l2886_c40_e578_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2887_c7_d306
opc_result_MUX_uxn_opcodes_h_l2887_c7_d306 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_cond,
opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_iftrue,
opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_iffalse,
opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_return_output);

-- rot_uxn_opcodes_h_l2887_c40_22af
rot_uxn_opcodes_h_l2887_c40_22af : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2887_c40_22af_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2887_c40_22af_phase,
rot_uxn_opcodes_h_l2887_c40_22af_ins,
rot_uxn_opcodes_h_l2887_c40_22af_previous_stack_read,
rot_uxn_opcodes_h_l2887_c40_22af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7
opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output);

-- rot2_uxn_opcodes_h_l2888_c40_852a
rot2_uxn_opcodes_h_l2888_c40_852a : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2888_c40_852a_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2888_c40_852a_phase,
rot2_uxn_opcodes_h_l2888_c40_852a_ins,
rot2_uxn_opcodes_h_l2888_c40_852a_previous_stack_read,
rot2_uxn_opcodes_h_l2888_c40_852a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c7_2753
opc_result_MUX_uxn_opcodes_h_l2889_c7_2753 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_return_output);

-- dup_uxn_opcodes_h_l2889_c40_eb5e
dup_uxn_opcodes_h_l2889_c40_eb5e : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2889_c40_eb5e_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2889_c40_eb5e_phase,
dup_uxn_opcodes_h_l2889_c40_eb5e_ins,
dup_uxn_opcodes_h_l2889_c40_eb5e_previous_stack_read,
dup_uxn_opcodes_h_l2889_c40_eb5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_c056
opc_result_MUX_uxn_opcodes_h_l2890_c7_c056 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_return_output);

-- dup2_uxn_opcodes_h_l2890_c40_9063
dup2_uxn_opcodes_h_l2890_c40_9063 : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2890_c40_9063_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2890_c40_9063_phase,
dup2_uxn_opcodes_h_l2890_c40_9063_ins,
dup2_uxn_opcodes_h_l2890_c40_9063_previous_stack_read,
dup2_uxn_opcodes_h_l2890_c40_9063_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_df72
opc_result_MUX_uxn_opcodes_h_l2891_c7_df72 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_return_output);

-- ovr_uxn_opcodes_h_l2891_c40_8669
ovr_uxn_opcodes_h_l2891_c40_8669 : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2891_c40_8669_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2891_c40_8669_phase,
ovr_uxn_opcodes_h_l2891_c40_8669_ins,
ovr_uxn_opcodes_h_l2891_c40_8669_previous_stack_read,
ovr_uxn_opcodes_h_l2891_c40_8669_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_708a
opc_result_MUX_uxn_opcodes_h_l2892_c7_708a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_return_output);

-- ovr2_uxn_opcodes_h_l2892_c40_eac0
ovr2_uxn_opcodes_h_l2892_c40_eac0 : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2892_c40_eac0_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2892_c40_eac0_phase,
ovr2_uxn_opcodes_h_l2892_c40_eac0_ins,
ovr2_uxn_opcodes_h_l2892_c40_eac0_previous_stack_read,
ovr2_uxn_opcodes_h_l2892_c40_eac0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1
opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output);

-- equ_uxn_opcodes_h_l2893_c40_0a91
equ_uxn_opcodes_h_l2893_c40_0a91 : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2893_c40_0a91_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2893_c40_0a91_phase,
equ_uxn_opcodes_h_l2893_c40_0a91_ins,
equ_uxn_opcodes_h_l2893_c40_0a91_previous_stack_read,
equ_uxn_opcodes_h_l2893_c40_0a91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_b415
opc_result_MUX_uxn_opcodes_h_l2894_c7_b415 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_return_output);

-- equ2_uxn_opcodes_h_l2894_c40_259d
equ2_uxn_opcodes_h_l2894_c40_259d : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2894_c40_259d_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2894_c40_259d_phase,
equ2_uxn_opcodes_h_l2894_c40_259d_ins,
equ2_uxn_opcodes_h_l2894_c40_259d_previous_stack_read,
equ2_uxn_opcodes_h_l2894_c40_259d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_5385
opc_result_MUX_uxn_opcodes_h_l2895_c7_5385 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_return_output);

-- neq_uxn_opcodes_h_l2895_c40_7fda
neq_uxn_opcodes_h_l2895_c40_7fda : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2895_c40_7fda_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2895_c40_7fda_phase,
neq_uxn_opcodes_h_l2895_c40_7fda_ins,
neq_uxn_opcodes_h_l2895_c40_7fda_previous_stack_read,
neq_uxn_opcodes_h_l2895_c40_7fda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17
opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output);

-- neq2_uxn_opcodes_h_l2896_c40_cdab
neq2_uxn_opcodes_h_l2896_c40_cdab : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2896_c40_cdab_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2896_c40_cdab_phase,
neq2_uxn_opcodes_h_l2896_c40_cdab_ins,
neq2_uxn_opcodes_h_l2896_c40_cdab_previous_stack_read,
neq2_uxn_opcodes_h_l2896_c40_cdab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_0883
opc_result_MUX_uxn_opcodes_h_l2897_c7_0883 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_return_output);

-- gth_uxn_opcodes_h_l2897_c40_2bd8
gth_uxn_opcodes_h_l2897_c40_2bd8 : entity work.gth_0CLK_226c8821 port map (
clk,
gth_uxn_opcodes_h_l2897_c40_2bd8_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2897_c40_2bd8_phase,
gth_uxn_opcodes_h_l2897_c40_2bd8_ins,
gth_uxn_opcodes_h_l2897_c40_2bd8_previous_stack_read,
gth_uxn_opcodes_h_l2897_c40_2bd8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7
opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output);

-- gth2_uxn_opcodes_h_l2898_c40_bb4d
gth2_uxn_opcodes_h_l2898_c40_bb4d : entity work.gth2_0CLK_609876da port map (
clk,
gth2_uxn_opcodes_h_l2898_c40_bb4d_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2898_c40_bb4d_phase,
gth2_uxn_opcodes_h_l2898_c40_bb4d_ins,
gth2_uxn_opcodes_h_l2898_c40_bb4d_previous_stack_read,
gth2_uxn_opcodes_h_l2898_c40_bb4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0
opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output);

-- lth_uxn_opcodes_h_l2899_c40_ca58
lth_uxn_opcodes_h_l2899_c40_ca58 : entity work.lth_0CLK_226c8821 port map (
clk,
lth_uxn_opcodes_h_l2899_c40_ca58_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2899_c40_ca58_phase,
lth_uxn_opcodes_h_l2899_c40_ca58_ins,
lth_uxn_opcodes_h_l2899_c40_ca58_previous_stack_read,
lth_uxn_opcodes_h_l2899_c40_ca58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea
opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output);

-- lth2_uxn_opcodes_h_l2900_c40_57a7
lth2_uxn_opcodes_h_l2900_c40_57a7 : entity work.lth2_0CLK_609876da port map (
clk,
lth2_uxn_opcodes_h_l2900_c40_57a7_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2900_c40_57a7_phase,
lth2_uxn_opcodes_h_l2900_c40_57a7_ins,
lth2_uxn_opcodes_h_l2900_c40_57a7_previous_stack_read,
lth2_uxn_opcodes_h_l2900_c40_57a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f
opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output);

-- jmp_uxn_opcodes_h_l2901_c40_407e
jmp_uxn_opcodes_h_l2901_c40_407e : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2901_c40_407e_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2901_c40_407e_phase,
jmp_uxn_opcodes_h_l2901_c40_407e_ins,
jmp_uxn_opcodes_h_l2901_c40_407e_pc,
jmp_uxn_opcodes_h_l2901_c40_407e_previous_stack_read,
jmp_uxn_opcodes_h_l2901_c40_407e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83
opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output);

-- jmp2_uxn_opcodes_h_l2902_c40_c4f8
jmp2_uxn_opcodes_h_l2902_c40_c4f8 : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2902_c40_c4f8_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2902_c40_c4f8_phase,
jmp2_uxn_opcodes_h_l2902_c40_c4f8_ins,
jmp2_uxn_opcodes_h_l2902_c40_c4f8_previous_stack_read,
jmp2_uxn_opcodes_h_l2902_c40_c4f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81
opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output);

-- jcn_uxn_opcodes_h_l2903_c40_a7d1
jcn_uxn_opcodes_h_l2903_c40_a7d1 : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2903_c40_a7d1_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2903_c40_a7d1_phase,
jcn_uxn_opcodes_h_l2903_c40_a7d1_ins,
jcn_uxn_opcodes_h_l2903_c40_a7d1_pc,
jcn_uxn_opcodes_h_l2903_c40_a7d1_previous_stack_read,
jcn_uxn_opcodes_h_l2903_c40_a7d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b
opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output);

-- jcn2_uxn_opcodes_h_l2904_c40_5466
jcn2_uxn_opcodes_h_l2904_c40_5466 : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2904_c40_5466_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2904_c40_5466_phase,
jcn2_uxn_opcodes_h_l2904_c40_5466_ins,
jcn2_uxn_opcodes_h_l2904_c40_5466_previous_stack_read,
jcn2_uxn_opcodes_h_l2904_c40_5466_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da
opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output);

-- jsr_uxn_opcodes_h_l2905_c40_3732
jsr_uxn_opcodes_h_l2905_c40_3732 : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2905_c40_3732_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2905_c40_3732_phase,
jsr_uxn_opcodes_h_l2905_c40_3732_ins,
jsr_uxn_opcodes_h_l2905_c40_3732_pc,
jsr_uxn_opcodes_h_l2905_c40_3732_previous_stack_read,
jsr_uxn_opcodes_h_l2905_c40_3732_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_e627
opc_result_MUX_uxn_opcodes_h_l2906_c7_e627 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_return_output);

-- jsr2_uxn_opcodes_h_l2906_c40_18dd
jsr2_uxn_opcodes_h_l2906_c40_18dd : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2906_c40_18dd_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2906_c40_18dd_phase,
jsr2_uxn_opcodes_h_l2906_c40_18dd_ins,
jsr2_uxn_opcodes_h_l2906_c40_18dd_pc,
jsr2_uxn_opcodes_h_l2906_c40_18dd_previous_stack_read,
jsr2_uxn_opcodes_h_l2906_c40_18dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_d450
opc_result_MUX_uxn_opcodes_h_l2907_c7_d450 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_return_output);

-- sth_uxn_opcodes_h_l2907_c40_407a
sth_uxn_opcodes_h_l2907_c40_407a : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2907_c40_407a_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2907_c40_407a_phase,
sth_uxn_opcodes_h_l2907_c40_407a_ins,
sth_uxn_opcodes_h_l2907_c40_407a_previous_stack_read,
sth_uxn_opcodes_h_l2907_c40_407a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_4775
opc_result_MUX_uxn_opcodes_h_l2908_c7_4775 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_return_output);

-- sth2_uxn_opcodes_h_l2908_c40_db30
sth2_uxn_opcodes_h_l2908_c40_db30 : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2908_c40_db30_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2908_c40_db30_phase,
sth2_uxn_opcodes_h_l2908_c40_db30_ins,
sth2_uxn_opcodes_h_l2908_c40_db30_previous_stack_read,
sth2_uxn_opcodes_h_l2908_c40_db30_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e
opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output);

-- ldz_uxn_opcodes_h_l2909_c40_0717
ldz_uxn_opcodes_h_l2909_c40_0717 : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2909_c40_0717_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2909_c40_0717_phase,
ldz_uxn_opcodes_h_l2909_c40_0717_ins,
ldz_uxn_opcodes_h_l2909_c40_0717_previous_stack_read,
ldz_uxn_opcodes_h_l2909_c40_0717_previous_ram_read,
ldz_uxn_opcodes_h_l2909_c40_0717_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4
opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output);

-- ldz2_uxn_opcodes_h_l2910_c40_1f1d
ldz2_uxn_opcodes_h_l2910_c40_1f1d : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2910_c40_1f1d_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2910_c40_1f1d_phase,
ldz2_uxn_opcodes_h_l2910_c40_1f1d_ins,
ldz2_uxn_opcodes_h_l2910_c40_1f1d_previous_stack_read,
ldz2_uxn_opcodes_h_l2910_c40_1f1d_previous_ram_read,
ldz2_uxn_opcodes_h_l2910_c40_1f1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52
opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output);

-- stz_uxn_opcodes_h_l2911_c40_fa75
stz_uxn_opcodes_h_l2911_c40_fa75 : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2911_c40_fa75_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2911_c40_fa75_phase,
stz_uxn_opcodes_h_l2911_c40_fa75_ins,
stz_uxn_opcodes_h_l2911_c40_fa75_previous_stack_read,
stz_uxn_opcodes_h_l2911_c40_fa75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf
opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output);

-- stz2_uxn_opcodes_h_l2912_c40_b0af
stz2_uxn_opcodes_h_l2912_c40_b0af : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2912_c40_b0af_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2912_c40_b0af_phase,
stz2_uxn_opcodes_h_l2912_c40_b0af_ins,
stz2_uxn_opcodes_h_l2912_c40_b0af_previous_stack_read,
stz2_uxn_opcodes_h_l2912_c40_b0af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe
opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output);

-- ldr_uxn_opcodes_h_l2913_c40_6d89
ldr_uxn_opcodes_h_l2913_c40_6d89 : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2913_c40_6d89_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2913_c40_6d89_phase,
ldr_uxn_opcodes_h_l2913_c40_6d89_ins,
ldr_uxn_opcodes_h_l2913_c40_6d89_pc,
ldr_uxn_opcodes_h_l2913_c40_6d89_previous_stack_read,
ldr_uxn_opcodes_h_l2913_c40_6d89_previous_ram_read,
ldr_uxn_opcodes_h_l2913_c40_6d89_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_1523
opc_result_MUX_uxn_opcodes_h_l2914_c7_1523 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_return_output);

-- ldr2_uxn_opcodes_h_l2914_c40_014f
ldr2_uxn_opcodes_h_l2914_c40_014f : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2914_c40_014f_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2914_c40_014f_phase,
ldr2_uxn_opcodes_h_l2914_c40_014f_ins,
ldr2_uxn_opcodes_h_l2914_c40_014f_pc,
ldr2_uxn_opcodes_h_l2914_c40_014f_previous_stack_read,
ldr2_uxn_opcodes_h_l2914_c40_014f_previous_ram_read,
ldr2_uxn_opcodes_h_l2914_c40_014f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_f169
opc_result_MUX_uxn_opcodes_h_l2915_c7_f169 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_return_output);

-- str1_uxn_opcodes_h_l2915_c40_50f4
str1_uxn_opcodes_h_l2915_c40_50f4 : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2915_c40_50f4_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2915_c40_50f4_phase,
str1_uxn_opcodes_h_l2915_c40_50f4_ins,
str1_uxn_opcodes_h_l2915_c40_50f4_pc,
str1_uxn_opcodes_h_l2915_c40_50f4_previous_stack_read,
str1_uxn_opcodes_h_l2915_c40_50f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0
opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output);

-- str2_uxn_opcodes_h_l2916_c40_a429
str2_uxn_opcodes_h_l2916_c40_a429 : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2916_c40_a429_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2916_c40_a429_phase,
str2_uxn_opcodes_h_l2916_c40_a429_ins,
str2_uxn_opcodes_h_l2916_c40_a429_pc,
str2_uxn_opcodes_h_l2916_c40_a429_previous_stack_read,
str2_uxn_opcodes_h_l2916_c40_a429_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_8222
opc_result_MUX_uxn_opcodes_h_l2917_c7_8222 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_return_output);

-- lda_uxn_opcodes_h_l2917_c40_cac1
lda_uxn_opcodes_h_l2917_c40_cac1 : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2917_c40_cac1_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2917_c40_cac1_phase,
lda_uxn_opcodes_h_l2917_c40_cac1_ins,
lda_uxn_opcodes_h_l2917_c40_cac1_previous_stack_read,
lda_uxn_opcodes_h_l2917_c40_cac1_previous_ram_read,
lda_uxn_opcodes_h_l2917_c40_cac1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc
opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output);

-- lda2_uxn_opcodes_h_l2918_c40_8a4b
lda2_uxn_opcodes_h_l2918_c40_8a4b : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2918_c40_8a4b_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2918_c40_8a4b_phase,
lda2_uxn_opcodes_h_l2918_c40_8a4b_ins,
lda2_uxn_opcodes_h_l2918_c40_8a4b_previous_stack_read,
lda2_uxn_opcodes_h_l2918_c40_8a4b_previous_ram_read,
lda2_uxn_opcodes_h_l2918_c40_8a4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_a603
opc_result_MUX_uxn_opcodes_h_l2919_c7_a603 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_return_output);

-- sta_uxn_opcodes_h_l2919_c40_3ec7
sta_uxn_opcodes_h_l2919_c40_3ec7 : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2919_c40_3ec7_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2919_c40_3ec7_phase,
sta_uxn_opcodes_h_l2919_c40_3ec7_ins,
sta_uxn_opcodes_h_l2919_c40_3ec7_previous_stack_read,
sta_uxn_opcodes_h_l2919_c40_3ec7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_0012
opc_result_MUX_uxn_opcodes_h_l2920_c7_0012 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_return_output);

-- sta2_uxn_opcodes_h_l2920_c40_aee4
sta2_uxn_opcodes_h_l2920_c40_aee4 : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2920_c40_aee4_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2920_c40_aee4_phase,
sta2_uxn_opcodes_h_l2920_c40_aee4_ins,
sta2_uxn_opcodes_h_l2920_c40_aee4_previous_stack_read,
sta2_uxn_opcodes_h_l2920_c40_aee4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce
opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output);

-- dei_uxn_opcodes_h_l2921_c40_35ae
dei_uxn_opcodes_h_l2921_c40_35ae : entity work.dei_0CLK_9bcaee2f port map (
clk,
dei_uxn_opcodes_h_l2921_c40_35ae_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2921_c40_35ae_phase,
dei_uxn_opcodes_h_l2921_c40_35ae_ins,
dei_uxn_opcodes_h_l2921_c40_35ae_previous_stack_read,
dei_uxn_opcodes_h_l2921_c40_35ae_previous_device_ram_read,
dei_uxn_opcodes_h_l2921_c40_35ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5
opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output);

-- dei2_uxn_opcodes_h_l2922_c40_6712
dei2_uxn_opcodes_h_l2922_c40_6712 : entity work.dei2_0CLK_919eceda port map (
clk,
dei2_uxn_opcodes_h_l2922_c40_6712_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2922_c40_6712_phase,
dei2_uxn_opcodes_h_l2922_c40_6712_ins,
dei2_uxn_opcodes_h_l2922_c40_6712_previous_stack_read,
dei2_uxn_opcodes_h_l2922_c40_6712_previous_device_ram_read,
dei2_uxn_opcodes_h_l2922_c40_6712_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0
opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output);

-- deo_uxn_opcodes_h_l2923_c40_63e4
deo_uxn_opcodes_h_l2923_c40_63e4 : entity work.deo_0CLK_ebde644c port map (
clk,
deo_uxn_opcodes_h_l2923_c40_63e4_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2923_c40_63e4_phase,
deo_uxn_opcodes_h_l2923_c40_63e4_ins,
deo_uxn_opcodes_h_l2923_c40_63e4_previous_stack_read,
deo_uxn_opcodes_h_l2923_c40_63e4_previous_device_ram_read,
deo_uxn_opcodes_h_l2923_c40_63e4_previous_ram_read,
deo_uxn_opcodes_h_l2923_c40_63e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_2748
opc_result_MUX_uxn_opcodes_h_l2924_c7_2748 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_return_output);

-- deo2_uxn_opcodes_h_l2924_c40_6340
deo2_uxn_opcodes_h_l2924_c40_6340 : entity work.deo2_0CLK_5952a5d7 port map (
clk,
deo2_uxn_opcodes_h_l2924_c40_6340_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2924_c40_6340_phase,
deo2_uxn_opcodes_h_l2924_c40_6340_ins,
deo2_uxn_opcodes_h_l2924_c40_6340_previous_stack_read,
deo2_uxn_opcodes_h_l2924_c40_6340_previous_device_ram_read,
deo2_uxn_opcodes_h_l2924_c40_6340_previous_ram_read,
deo2_uxn_opcodes_h_l2924_c40_6340_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd
opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output);

-- add_uxn_opcodes_h_l2925_c40_faf5
add_uxn_opcodes_h_l2925_c40_faf5 : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2925_c40_faf5_CLOCK_ENABLE,
add_uxn_opcodes_h_l2925_c40_faf5_phase,
add_uxn_opcodes_h_l2925_c40_faf5_ins,
add_uxn_opcodes_h_l2925_c40_faf5_previous_stack_read,
add_uxn_opcodes_h_l2925_c40_faf5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_354f
opc_result_MUX_uxn_opcodes_h_l2926_c7_354f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_return_output);

-- add2_uxn_opcodes_h_l2926_c40_f11a
add2_uxn_opcodes_h_l2926_c40_f11a : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2926_c40_f11a_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2926_c40_f11a_phase,
add2_uxn_opcodes_h_l2926_c40_f11a_ins,
add2_uxn_opcodes_h_l2926_c40_f11a_previous_stack_read,
add2_uxn_opcodes_h_l2926_c40_f11a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a
opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output);

-- sub_uxn_opcodes_h_l2927_c40_f1ef
sub_uxn_opcodes_h_l2927_c40_f1ef : entity work.sub_0CLK_64d180f1 port map (
clk,
sub_uxn_opcodes_h_l2927_c40_f1ef_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2927_c40_f1ef_phase,
sub_uxn_opcodes_h_l2927_c40_f1ef_ins,
sub_uxn_opcodes_h_l2927_c40_f1ef_previous_stack_read,
sub_uxn_opcodes_h_l2927_c40_f1ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a
opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output);

-- sub2_uxn_opcodes_h_l2928_c40_54df
sub2_uxn_opcodes_h_l2928_c40_54df : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2928_c40_54df_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2928_c40_54df_phase,
sub2_uxn_opcodes_h_l2928_c40_54df_ins,
sub2_uxn_opcodes_h_l2928_c40_54df_previous_stack_read,
sub2_uxn_opcodes_h_l2928_c40_54df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_5524
opc_result_MUX_uxn_opcodes_h_l2929_c7_5524 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_return_output);

-- mul_uxn_opcodes_h_l2929_c40_3115
mul_uxn_opcodes_h_l2929_c40_3115 : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2929_c40_3115_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2929_c40_3115_phase,
mul_uxn_opcodes_h_l2929_c40_3115_ins,
mul_uxn_opcodes_h_l2929_c40_3115_previous_stack_read,
mul_uxn_opcodes_h_l2929_c40_3115_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2
opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output);

-- mul2_uxn_opcodes_h_l2930_c40_1f7c
mul2_uxn_opcodes_h_l2930_c40_1f7c : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2930_c40_1f7c_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2930_c40_1f7c_phase,
mul2_uxn_opcodes_h_l2930_c40_1f7c_ins,
mul2_uxn_opcodes_h_l2930_c40_1f7c_previous_stack_read,
mul2_uxn_opcodes_h_l2930_c40_1f7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3
opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output);

-- div_uxn_opcodes_h_l2931_c40_6e1b
div_uxn_opcodes_h_l2931_c40_6e1b : entity work.div_0CLK_09f6f009 port map (
clk,
div_uxn_opcodes_h_l2931_c40_6e1b_CLOCK_ENABLE,
div_uxn_opcodes_h_l2931_c40_6e1b_phase,
div_uxn_opcodes_h_l2931_c40_6e1b_ins,
div_uxn_opcodes_h_l2931_c40_6e1b_previous_stack_read,
div_uxn_opcodes_h_l2931_c40_6e1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d
opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output);

-- div2_uxn_opcodes_h_l2932_c40_c1fc
div2_uxn_opcodes_h_l2932_c40_c1fc : entity work.div2_0CLK_7cf9dac2 port map (
clk,
div2_uxn_opcodes_h_l2932_c40_c1fc_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2932_c40_c1fc_phase,
div2_uxn_opcodes_h_l2932_c40_c1fc_ins,
div2_uxn_opcodes_h_l2932_c40_c1fc_previous_stack_read,
div2_uxn_opcodes_h_l2932_c40_c1fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc
opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output);

-- and_uxn_opcodes_h_l2933_c40_bb5c
and_uxn_opcodes_h_l2933_c40_bb5c : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2933_c40_bb5c_CLOCK_ENABLE,
and_uxn_opcodes_h_l2933_c40_bb5c_phase,
and_uxn_opcodes_h_l2933_c40_bb5c_ins,
and_uxn_opcodes_h_l2933_c40_bb5c_previous_stack_read,
and_uxn_opcodes_h_l2933_c40_bb5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8
opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output);

-- and2_uxn_opcodes_h_l2934_c40_5a3a
and2_uxn_opcodes_h_l2934_c40_5a3a : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2934_c40_5a3a_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2934_c40_5a3a_phase,
and2_uxn_opcodes_h_l2934_c40_5a3a_ins,
and2_uxn_opcodes_h_l2934_c40_5a3a_previous_stack_read,
and2_uxn_opcodes_h_l2934_c40_5a3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_f617
opc_result_MUX_uxn_opcodes_h_l2935_c7_f617 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_return_output);

-- ora_uxn_opcodes_h_l2935_c40_e267
ora_uxn_opcodes_h_l2935_c40_e267 : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2935_c40_e267_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2935_c40_e267_phase,
ora_uxn_opcodes_h_l2935_c40_e267_ins,
ora_uxn_opcodes_h_l2935_c40_e267_previous_stack_read,
ora_uxn_opcodes_h_l2935_c40_e267_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_7554
opc_result_MUX_uxn_opcodes_h_l2936_c7_7554 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_return_output);

-- ora2_uxn_opcodes_h_l2936_c40_7d24
ora2_uxn_opcodes_h_l2936_c40_7d24 : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2936_c40_7d24_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2936_c40_7d24_phase,
ora2_uxn_opcodes_h_l2936_c40_7d24_ins,
ora2_uxn_opcodes_h_l2936_c40_7d24_previous_stack_read,
ora2_uxn_opcodes_h_l2936_c40_7d24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_d719
opc_result_MUX_uxn_opcodes_h_l2937_c7_d719 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_return_output);

-- eor_uxn_opcodes_h_l2937_c40_3900
eor_uxn_opcodes_h_l2937_c40_3900 : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2937_c40_3900_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2937_c40_3900_phase,
eor_uxn_opcodes_h_l2937_c40_3900_ins,
eor_uxn_opcodes_h_l2937_c40_3900_previous_stack_read,
eor_uxn_opcodes_h_l2937_c40_3900_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_4806
opc_result_MUX_uxn_opcodes_h_l2938_c7_4806 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_return_output);

-- eor2_uxn_opcodes_h_l2938_c40_b1e0
eor2_uxn_opcodes_h_l2938_c40_b1e0 : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2938_c40_b1e0_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2938_c40_b1e0_phase,
eor2_uxn_opcodes_h_l2938_c40_b1e0_ins,
eor2_uxn_opcodes_h_l2938_c40_b1e0_previous_stack_read,
eor2_uxn_opcodes_h_l2938_c40_b1e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_e247
opc_result_MUX_uxn_opcodes_h_l2939_c7_e247 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_return_output);

-- sft_uxn_opcodes_h_l2939_c40_a141
sft_uxn_opcodes_h_l2939_c40_a141 : entity work.sft_0CLK_46cced44 port map (
clk,
sft_uxn_opcodes_h_l2939_c40_a141_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2939_c40_a141_phase,
sft_uxn_opcodes_h_l2939_c40_a141_ins,
sft_uxn_opcodes_h_l2939_c40_a141_previous_stack_read,
sft_uxn_opcodes_h_l2939_c40_a141_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_4709
opc_result_MUX_uxn_opcodes_h_l2940_c7_4709 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_return_output);

-- sft2_uxn_opcodes_h_l2940_c40_84ae
sft2_uxn_opcodes_h_l2940_c40_84ae : entity work.sft2_0CLK_e8b37bfc port map (
clk,
sft2_uxn_opcodes_h_l2940_c40_84ae_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2940_c40_84ae_phase,
sft2_uxn_opcodes_h_l2940_c40_84ae_ins,
sft2_uxn_opcodes_h_l2940_c40_84ae_previous_stack_read,
sft2_uxn_opcodes_h_l2940_c40_84ae_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c
CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c_x,
CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_left,
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_right,
BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_return_output);

-- sp0_MUX_uxn_opcodes_h_l2945_c2_0942
sp0_MUX_uxn_opcodes_h_l2945_c2_0942 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2945_c2_0942_cond,
sp0_MUX_uxn_opcodes_h_l2945_c2_0942_iftrue,
sp0_MUX_uxn_opcodes_h_l2945_c2_0942_iffalse,
sp0_MUX_uxn_opcodes_h_l2945_c2_0942_return_output);

-- sp1_MUX_uxn_opcodes_h_l2945_c2_0942
sp1_MUX_uxn_opcodes_h_l2945_c2_0942 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2945_c2_0942_cond,
sp1_MUX_uxn_opcodes_h_l2945_c2_0942_iftrue,
sp1_MUX_uxn_opcodes_h_l2945_c2_0942_iffalse,
sp1_MUX_uxn_opcodes_h_l2945_c2_0942_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_left,
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_right,
BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_left,
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_right,
BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_return_output);

-- MUX_uxn_opcodes_h_l2951_c29_26f4
MUX_uxn_opcodes_h_l2951_c29_26f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2951_c29_26f4_cond,
MUX_uxn_opcodes_h_l2951_c29_26f4_iftrue,
MUX_uxn_opcodes_h_l2951_c29_26f4_iffalse,
MUX_uxn_opcodes_h_l2951_c29_26f4_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_left,
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_right,
BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_return_output);

-- MUX_uxn_opcodes_h_l2952_c20_ea05
MUX_uxn_opcodes_h_l2952_c20_ea05 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2952_c20_ea05_cond,
MUX_uxn_opcodes_h_l2952_c20_ea05_iftrue,
MUX_uxn_opcodes_h_l2952_c20_ea05_iffalse,
MUX_uxn_opcodes_h_l2952_c20_ea05_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea
BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea : entity work.BIN_OP_PLUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_left,
BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_right,
BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_return_output);

-- stack_ram_update_uxn_opcodes_h_l2954_c24_83b2
stack_ram_update_uxn_opcodes_h_l2954_c24_83b2 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_stack_address,
stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_value,
stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_write_enable,
stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_return_output,
 MUX_uxn_opcodes_h_l2864_c14_5363_return_output,
 MUX_uxn_opcodes_h_l2865_c8_624e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output,
 is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output,
 brk_uxn_opcodes_h_l2871_c48_6413_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output,
 jci_uxn_opcodes_h_l2872_c40_bc32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_return_output,
 jmi_uxn_opcodes_h_l2873_c40_0376_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output,
 jsi_uxn_opcodes_h_l2874_c40_2fb2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_return_output,
 lit_uxn_opcodes_h_l2875_c40_8775_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output,
 lit2_uxn_opcodes_h_l2876_c40_9f70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_return_output,
 opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output,
 lit_uxn_opcodes_h_l2877_c40_2981_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_return_output,
 opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_return_output,
 lit2_uxn_opcodes_h_l2878_c40_71a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_return_output,
 inc_uxn_opcodes_h_l2879_c40_f4c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_return_output,
 inc2_uxn_opcodes_h_l2880_c40_0ad1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output,
 pop_uxn_opcodes_h_l2881_c40_467d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_return_output,
 opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output,
 pop2_uxn_opcodes_h_l2882_c40_2b42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_return_output,
 nip_uxn_opcodes_h_l2883_c40_4447_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_return_output,
 opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output,
 nip2_uxn_opcodes_h_l2884_c40_1226_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_return_output,
 opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_return_output,
 swp_uxn_opcodes_h_l2885_c40_ac09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_return_output,
 opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_return_output,
 swp2_uxn_opcodes_h_l2886_c40_e578_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_return_output,
 rot_uxn_opcodes_h_l2887_c40_22af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output,
 rot2_uxn_opcodes_h_l2888_c40_852a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_return_output,
 dup_uxn_opcodes_h_l2889_c40_eb5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_return_output,
 dup2_uxn_opcodes_h_l2890_c40_9063_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_return_output,
 ovr_uxn_opcodes_h_l2891_c40_8669_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_return_output,
 ovr2_uxn_opcodes_h_l2892_c40_eac0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output,
 equ_uxn_opcodes_h_l2893_c40_0a91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_return_output,
 equ2_uxn_opcodes_h_l2894_c40_259d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_return_output,
 neq_uxn_opcodes_h_l2895_c40_7fda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output,
 neq2_uxn_opcodes_h_l2896_c40_cdab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_return_output,
 gth_uxn_opcodes_h_l2897_c40_2bd8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output,
 gth2_uxn_opcodes_h_l2898_c40_bb4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output,
 lth_uxn_opcodes_h_l2899_c40_ca58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output,
 lth2_uxn_opcodes_h_l2900_c40_57a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output,
 jmp_uxn_opcodes_h_l2901_c40_407e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output,
 jmp2_uxn_opcodes_h_l2902_c40_c4f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output,
 jcn_uxn_opcodes_h_l2903_c40_a7d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output,
 jcn2_uxn_opcodes_h_l2904_c40_5466_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output,
 jsr_uxn_opcodes_h_l2905_c40_3732_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_return_output,
 jsr2_uxn_opcodes_h_l2906_c40_18dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_return_output,
 sth_uxn_opcodes_h_l2907_c40_407a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_return_output,
 sth2_uxn_opcodes_h_l2908_c40_db30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output,
 ldz_uxn_opcodes_h_l2909_c40_0717_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output,
 ldz2_uxn_opcodes_h_l2910_c40_1f1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output,
 stz_uxn_opcodes_h_l2911_c40_fa75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output,
 stz2_uxn_opcodes_h_l2912_c40_b0af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output,
 ldr_uxn_opcodes_h_l2913_c40_6d89_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_return_output,
 ldr2_uxn_opcodes_h_l2914_c40_014f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_return_output,
 str1_uxn_opcodes_h_l2915_c40_50f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output,
 str2_uxn_opcodes_h_l2916_c40_a429_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_return_output,
 lda_uxn_opcodes_h_l2917_c40_cac1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output,
 lda2_uxn_opcodes_h_l2918_c40_8a4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_return_output,
 sta_uxn_opcodes_h_l2919_c40_3ec7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_return_output,
 sta2_uxn_opcodes_h_l2920_c40_aee4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output,
 dei_uxn_opcodes_h_l2921_c40_35ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output,
 dei2_uxn_opcodes_h_l2922_c40_6712_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output,
 deo_uxn_opcodes_h_l2923_c40_63e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_return_output,
 deo2_uxn_opcodes_h_l2924_c40_6340_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output,
 add_uxn_opcodes_h_l2925_c40_faf5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_return_output,
 add2_uxn_opcodes_h_l2926_c40_f11a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output,
 sub_uxn_opcodes_h_l2927_c40_f1ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output,
 sub2_uxn_opcodes_h_l2928_c40_54df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_return_output,
 mul_uxn_opcodes_h_l2929_c40_3115_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output,
 mul2_uxn_opcodes_h_l2930_c40_1f7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output,
 div_uxn_opcodes_h_l2931_c40_6e1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output,
 div2_uxn_opcodes_h_l2932_c40_c1fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output,
 and_uxn_opcodes_h_l2933_c40_bb5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output,
 and2_uxn_opcodes_h_l2934_c40_5a3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_return_output,
 ora_uxn_opcodes_h_l2935_c40_e267_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_return_output,
 ora2_uxn_opcodes_h_l2936_c40_7d24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_return_output,
 eor_uxn_opcodes_h_l2937_c40_3900_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_return_output,
 eor2_uxn_opcodes_h_l2938_c40_b1e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_return_output,
 sft_uxn_opcodes_h_l2939_c40_a141_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_return_output,
 sft2_uxn_opcodes_h_l2940_c40_84ae_return_output,
 CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_return_output,
 sp0_MUX_uxn_opcodes_h_l2945_c2_0942_return_output,
 sp1_MUX_uxn_opcodes_h_l2945_c2_0942_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_return_output,
 MUX_uxn_opcodes_h_l2951_c29_26f4_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_return_output,
 MUX_uxn_opcodes_h_l2952_c20_ea05_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_return_output,
 stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_5363_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_5363_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_5363_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2864_c14_5363_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_624e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_624e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_624e_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_cond : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2871_c48_6413_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2871_c48_6413_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_bc32_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_bc32_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_bc32_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_bc32_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_bc32_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2872_c40_bc32_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_0376_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_0376_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_0376_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_0376_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2873_c40_0376_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_8775_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_8775_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_8775_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_8775_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2875_c40_8775_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_2981_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_2981_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_2981_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_2981_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2877_c40_2981_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_467d_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_467d_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_467d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2881_c40_467d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_2b42_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_2b42_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_2b42_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2882_c40_2b42_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_4447_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_4447_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_4447_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_4447_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2883_c40_4447_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_1226_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_1226_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_1226_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_1226_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2884_c40_1226_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_ac09_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_ac09_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_ac09_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_ac09_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2885_c40_ac09_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_e578_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_e578_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_e578_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_e578_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2886_c40_e578_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_22af_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_22af_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_22af_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_22af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2887_c40_22af_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_852a_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_852a_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_852a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_852a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2888_c40_852a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_9063_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_9063_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_9063_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_9063_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2890_c40_9063_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_8669_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_8669_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_8669_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_8669_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2891_c40_8669_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_0a91_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_0a91_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_0a91_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_0a91_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2893_c40_0a91_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_259d_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_259d_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_259d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_259d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2894_c40_259d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_7fda_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_7fda_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_7fda_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_7fda_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2895_c40_7fda_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_ca58_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_ca58_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_ca58_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_ca58_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2899_c40_ca58_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_407e_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_407e_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_407e_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_407e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_407e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2901_c40_407e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_3732_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_3732_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_3732_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_3732_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_3732_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2905_c40_3732_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_407a_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_407a_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_407a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_407a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2907_c40_407a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_db30_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_db30_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_db30_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_db30_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2908_c40_db30_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_0717_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_0717_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_0717_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_0717_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_0717_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2909_c40_0717_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_fa75_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_fa75_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_fa75_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_fa75_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2911_c40_fa75_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_50f4_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_50f4_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_50f4_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_50f4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_50f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2915_c40_50f4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_a429_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_a429_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_a429_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_a429_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_a429_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2916_c40_a429_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_cac1_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_cac1_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_cac1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_cac1_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_cac1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2917_c40_cac1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_35ae_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_35ae_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_35ae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_35ae_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_35ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2921_c40_35ae_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_6712_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_6712_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_6712_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_6712_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_6712_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2922_c40_6712_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_63e4_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_63e4_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_63e4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_63e4_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_63e4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_63e4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2923_c40_63e4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_6340_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_6340_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_6340_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_6340_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_6340_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_6340_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2924_c40_6340_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_faf5_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_faf5_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_faf5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_faf5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2925_c40_faf5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_f11a_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_f11a_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_f11a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_f11a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2926_c40_f11a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_54df_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_54df_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_54df_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_54df_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2928_c40_54df_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_3115_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_3115_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_3115_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_3115_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2929_c40_3115_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_6e1b_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_6e1b_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_6e1b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_6e1b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2931_c40_6e1b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_bb5c_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_bb5c_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_bb5c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_bb5c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2933_c40_bb5c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_e267_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_e267_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_e267_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_e267_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2935_c40_e267_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_3900_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_3900_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_3900_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_3900_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2937_c40_3900_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_a141_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_a141_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_a141_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_a141_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2939_c40_a141_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2942_c2_7a48 : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2943_c17_3fe6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_0942_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_0942_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2948_c3_dab0 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_0942_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_0942_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_0942_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2946_c3_f6b3 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_0942_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_0942_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_0942_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_26f4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_26f4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_26f4_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2951_c29_26f4_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c19_ad66_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2951_c68_45ae_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c58_742f_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_return_output : unsigned(8 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2952_c2_7b2f : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_ea05_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_ea05_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_ea05_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2952_c20_ea05_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_return_output : unsigned(9 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2957_c3_f1b4_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2961_c39_e1ca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2962_c40_b6a5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2963_c34_bd25_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2964_c30_7c60_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2965_c33_63fd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2966_c34_33bd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2967_c37_09a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2969_c32_210e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2946_l2948_DUPLICATE_9565_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_413d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_fcf6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_0e33_return_output : eval_opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_right := to_unsigned(19, 8);
     VAR_MUX_uxn_opcodes_h_l2952_c20_ea05_iftrue := to_unsigned(256, 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_right := to_unsigned(39, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_right := to_unsigned(62, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_right := to_unsigned(59, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_right := to_unsigned(44, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_right := to_unsigned(160, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_right := to_unsigned(28, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_right := to_unsigned(3, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_right := to_unsigned(21, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_right := to_unsigned(23, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_right := to_unsigned(58, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_right := to_unsigned(48, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_right := to_unsigned(7, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_right := to_unsigned(96, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_right := to_unsigned(11, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_right := to_unsigned(24, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_right := to_unsigned(22, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_right := to_unsigned(61, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_right := to_unsigned(34, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_right := to_unsigned(33, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_right := to_unsigned(31, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_right := to_unsigned(26, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_right := to_unsigned(64, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_right := to_unsigned(224, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_iftrue := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_right := to_unsigned(9, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_right := to_unsigned(17, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_right := to_unsigned(29, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_right := to_unsigned(36, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_right := to_unsigned(13, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_right := to_unsigned(5, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_right := to_unsigned(1, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_right := to_unsigned(55, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_right := to_unsigned(25, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_right := to_unsigned(63, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_right := to_unsigned(45, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_right := to_unsigned(40, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_right := to_unsigned(18, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_right := to_unsigned(37, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_right := to_unsigned(51, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_right := to_unsigned(56, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2864_c14_5363_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_right := to_unsigned(192, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_right := to_unsigned(38, 8);
     VAR_MUX_uxn_opcodes_h_l2952_c20_ea05_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_MUX_uxn_opcodes_h_l2864_c14_5363_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_right := to_unsigned(20, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_right := to_unsigned(53, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_right := to_unsigned(14, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_right := to_unsigned(4, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_right := to_unsigned(30, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_right := to_unsigned(10, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_right := to_unsigned(27, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_right := to_unsigned(50, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_right := to_unsigned(41, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_right := to_unsigned(35, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_right := to_unsigned(16, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_right := to_unsigned(54, 8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_right := to_unsigned(43, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_right := to_unsigned(60, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_right := to_unsigned(46, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_right := to_unsigned(42, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_iffalse := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_right := to_unsigned(52, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_right := to_unsigned(47, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_right := to_unsigned(12, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_right := to_unsigned(49, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_right := to_unsigned(223, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_right := to_unsigned(32, 8);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_right := to_unsigned(57, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_right := to_unsigned(6, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c_x := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2865_c8_624e_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2926_c40_f11a_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2925_c40_faf5_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2933_c40_bb5c_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2922_c40_6712_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2921_c40_35ae_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2924_c40_6340_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2923_c40_63e4_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2931_c40_6e1b_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2890_c40_9063_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2937_c40_3900_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2894_c40_259d_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2893_c40_0a91_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2901_c40_407e_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2905_c40_3732_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2917_c40_cac1_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2909_c40_0717_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2899_c40_ca58_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2929_c40_3115_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2895_c40_7fda_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2884_c40_1226_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2883_c40_4447_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2935_c40_e267_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2891_c40_8669_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2882_c40_2b42_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2881_c40_467d_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2888_c40_852a_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2887_c40_22af_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2939_c40_a141_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2908_c40_db30_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2907_c40_407a_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2915_c40_50f4_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2916_c40_a429_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2911_c40_fa75_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2928_c40_54df_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2886_c40_e578_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2885_c40_ac09_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2872_c40_bc32_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2873_c40_0376_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2901_c40_407e_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2905_c40_3732_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2875_c40_8775_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2877_c40_2981_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2915_c40_50f4_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2916_c40_a429_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2926_c40_f11a_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2925_c40_faf5_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2933_c40_bb5c_phase := VAR_phase;
     VAR_brk_uxn_opcodes_h_l2871_c48_6413_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2922_c40_6712_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2921_c40_35ae_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2924_c40_6340_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2923_c40_63e4_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2931_c40_6e1b_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2890_c40_9063_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2937_c40_3900_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2894_c40_259d_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2893_c40_0a91_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2872_c40_bc32_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2873_c40_0376_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2901_c40_407e_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2905_c40_3732_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2917_c40_cac1_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2909_c40_0717_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2875_c40_8775_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2877_c40_2981_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2899_c40_ca58_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2929_c40_3115_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2895_c40_7fda_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2884_c40_1226_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2883_c40_4447_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2935_c40_e267_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2891_c40_8669_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2882_c40_2b42_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2881_c40_467d_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l2888_c40_852a_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2887_c40_22af_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2939_c40_a141_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2908_c40_db30_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2907_c40_407a_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2915_c40_50f4_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2916_c40_a429_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2911_c40_fa75_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2928_c40_54df_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2886_c40_e578_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2885_c40_ac09_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2922_c40_6712_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2921_c40_35ae_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2924_c40_6340_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2923_c40_63e4_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2924_c40_6340_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2923_c40_63e4_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2872_c40_bc32_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2873_c40_0376_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2917_c40_cac1_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2909_c40_0717_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2875_c40_8775_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2877_c40_2981_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2926_c40_f11a_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2925_c40_faf5_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2933_c40_bb5c_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2922_c40_6712_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2921_c40_35ae_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2924_c40_6340_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2923_c40_63e4_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2931_c40_6e1b_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2890_c40_9063_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2937_c40_3900_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2894_c40_259d_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2893_c40_0a91_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2872_c40_bc32_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2901_c40_407e_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2905_c40_3732_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2917_c40_cac1_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2909_c40_0717_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2899_c40_ca58_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2929_c40_3115_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2895_c40_7fda_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2884_c40_1226_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2883_c40_4447_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2935_c40_e267_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2891_c40_8669_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2888_c40_852a_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2887_c40_22af_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2939_c40_a141_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2908_c40_db30_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2907_c40_407a_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2915_c40_50f4_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2916_c40_a429_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2911_c40_fa75_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2928_c40_54df_previous_stack_read := previous_stack_read;
     VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2886_c40_e578_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2885_c40_ac09_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_0942_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_0942_iffalse := sp1;
     -- BIN_OP_AND[uxn_opcodes_h_l2863_c14_52f8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_left;
     BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_return_output := BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_return_output;

     -- brk[uxn_opcodes_h_l2871_c48_6413] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2871_c48_6413_phase <= VAR_brk_uxn_opcodes_h_l2871_c48_6413_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2871_c48_6413_return_output := brk_uxn_opcodes_h_l2871_c48_6413_return_output;

     -- CONST_SR_6[uxn_opcodes_h_l2942_c16_f64c] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c_return_output := CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_return_output;
     VAR_MUX_uxn_opcodes_h_l2865_c8_624e_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2863_c14_52f8_return_output;
     VAR_stack_index_uxn_opcodes_h_l2942_c2_7a48 := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2942_c16_f64c_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_iftrue := VAR_brk_uxn_opcodes_h_l2871_c48_6413_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_left := VAR_stack_index_uxn_opcodes_h_l2942_c2_7a48;
     -- BIN_OP_XOR[uxn_opcodes_h_l2864_c14_13c8] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_left;
     BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_return_output := BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2864_c14_13c8_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2864_c14_a5da] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_left;
     BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_return_output := BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2864_c14_a5da_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2864_c14_8c9e] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2864_c14_8c9e_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2864_c14_8d11] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2864_c14_5363_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2864_c14_8d11_return_output;
     -- MUX[uxn_opcodes_h_l2864_c14_5363] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2864_c14_5363_cond <= VAR_MUX_uxn_opcodes_h_l2864_c14_5363_cond;
     MUX_uxn_opcodes_h_l2864_c14_5363_iftrue <= VAR_MUX_uxn_opcodes_h_l2864_c14_5363_iftrue;
     MUX_uxn_opcodes_h_l2864_c14_5363_iffalse <= VAR_MUX_uxn_opcodes_h_l2864_c14_5363_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2864_c14_5363_return_output := MUX_uxn_opcodes_h_l2864_c14_5363_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2865_c8_624e_cond := VAR_MUX_uxn_opcodes_h_l2864_c14_5363_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2864_c14_5363_return_output;
     -- MUX[uxn_opcodes_h_l2865_c8_624e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2865_c8_624e_cond <= VAR_MUX_uxn_opcodes_h_l2865_c8_624e_cond;
     MUX_uxn_opcodes_h_l2865_c8_624e_iftrue <= VAR_MUX_uxn_opcodes_h_l2865_c8_624e_iftrue;
     MUX_uxn_opcodes_h_l2865_c8_624e_iffalse <= VAR_MUX_uxn_opcodes_h_l2865_c8_624e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output := MUX_uxn_opcodes_h_l2865_c8_624e_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_left := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2865_c8_624e_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_1f07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_c76f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_99c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_8f03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_ac2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_09c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_6565] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_4c70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_edda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_ac0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_24df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_cdd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_349d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_9826] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_c845] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2871_c6_a0ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_742b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_4400] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_c0cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_ae39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_477b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_9119] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_1ddd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_a0e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_2878] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_254c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_5fed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_e95e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_b54b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_ecdc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_802e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_d136] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_dc83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_facf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_f14b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_3df8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_4aec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_5514] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_b011] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_f2fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_75f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_14ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2872_c11_c4d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_60b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_4d30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_c5dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_33ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_9783] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_left;
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_return_output := BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_dae5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_edaf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_67e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_e0f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_0cdc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_782d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_66de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_f516] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_9298] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_6a92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_2448] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_66d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_abfa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_762c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_07d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_dce8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_7c2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_63fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_e455] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_b41c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_ac4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_22a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c6_a0ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_c4d4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_cdd8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_60b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_09c1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_ae39_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_5fed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_22a8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_782d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_9783_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_802e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_33ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_dae5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_b011_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_abfa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_f2fd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_edda_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_07d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_742b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_dc83_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_edaf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_24df_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_99c8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_f14b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_ac0a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_4400_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_c76f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_6565_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_2448_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_349d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_c0cd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_c845_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_7c2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_5514_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_e455_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_1f07_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_9119_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_4d30_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_6a92_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_67e7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_ac2a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_b41c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_762c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_e95e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_9298_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_e0f4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_2878_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_d136_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_f516_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_3df8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_a0e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_9826_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_b54b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_0cdc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_facf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_14ca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_ac4a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_dce8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_254c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_c5dc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_477b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_66d3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_63fd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_1ddd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_66de_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_8f03_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_4aec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_ecdc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_75f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_4c70_return_output;
     -- is_wait_MUX[uxn_opcodes_h_l2871_c2_c9b2] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_cond;
     is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output := is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c7_6f58] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c1_6644] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_030f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_030f_return_output;
     VAR_jci_uxn_opcodes_h_l2872_c40_bc32_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_6644_return_output;
     -- jci[uxn_opcodes_h_l2872_c40_bc32] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2872_c40_bc32_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2872_c40_bc32_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2872_c40_bc32_phase <= VAR_jci_uxn_opcodes_h_l2872_c40_bc32_phase;
     jci_uxn_opcodes_h_l2872_c40_bc32_pc <= VAR_jci_uxn_opcodes_h_l2872_c40_bc32_pc;
     jci_uxn_opcodes_h_l2872_c40_bc32_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2872_c40_bc32_previous_stack_read;
     jci_uxn_opcodes_h_l2872_c40_bc32_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2872_c40_bc32_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2872_c40_bc32_return_output := jci_uxn_opcodes_h_l2872_c40_bc32_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_83cf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_5f75] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output;
     VAR_jmi_uxn_opcodes_h_l2873_c40_0376_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_5f75_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_iftrue := VAR_jci_uxn_opcodes_h_l2872_c40_bc32_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_744b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_return_output;

     -- jmi[uxn_opcodes_h_l2873_c40_0376] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2873_c40_0376_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2873_c40_0376_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2873_c40_0376_phase <= VAR_jmi_uxn_opcodes_h_l2873_c40_0376_phase;
     jmi_uxn_opcodes_h_l2873_c40_0376_pc <= VAR_jmi_uxn_opcodes_h_l2873_c40_0376_pc;
     jmi_uxn_opcodes_h_l2873_c40_0376_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2873_c40_0376_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2873_c40_0376_return_output := jmi_uxn_opcodes_h_l2873_c40_0376_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_bf60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_744b_return_output;
     VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_bf60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_iftrue := VAR_jmi_uxn_opcodes_h_l2873_c40_0376_return_output;
     -- jsi[uxn_opcodes_h_l2874_c40_2fb2] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2874_c40_2fb2_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2874_c40_2fb2_phase <= VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_phase;
     jsi_uxn_opcodes_h_l2874_c40_2fb2_pc <= VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_pc;
     jsi_uxn_opcodes_h_l2874_c40_2fb2_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_return_output := jsi_uxn_opcodes_h_l2874_c40_2fb2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_db0f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_0cd9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output;
     VAR_lit_uxn_opcodes_h_l2875_c40_8775_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_db0f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_iftrue := VAR_jsi_uxn_opcodes_h_l2874_c40_2fb2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_7ad0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_ef32] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_return_output;

     -- lit[uxn_opcodes_h_l2875_c40_8775] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2875_c40_8775_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2875_c40_8775_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2875_c40_8775_phase <= VAR_lit_uxn_opcodes_h_l2875_c40_8775_phase;
     lit_uxn_opcodes_h_l2875_c40_8775_pc <= VAR_lit_uxn_opcodes_h_l2875_c40_8775_pc;
     lit_uxn_opcodes_h_l2875_c40_8775_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2875_c40_8775_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2875_c40_8775_return_output := lit_uxn_opcodes_h_l2875_c40_8775_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output;
     VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_ef32_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_iftrue := VAR_lit_uxn_opcodes_h_l2875_c40_8775_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_dbb1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_return_output;

     -- lit2[uxn_opcodes_h_l2876_c40_9f70] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2876_c40_9f70_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2876_c40_9f70_phase <= VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_phase;
     lit2_uxn_opcodes_h_l2876_c40_9f70_pc <= VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_pc;
     lit2_uxn_opcodes_h_l2876_c40_9f70_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_return_output := lit2_uxn_opcodes_h_l2876_c40_9f70_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_87be] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_87be_return_output;
     VAR_lit_uxn_opcodes_h_l2877_c40_2981_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_dbb1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_iftrue := VAR_lit2_uxn_opcodes_h_l2876_c40_9f70_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_f497] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_a653] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_return_output;

     -- lit[uxn_opcodes_h_l2877_c40_2981] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2877_c40_2981_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2877_c40_2981_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2877_c40_2981_phase <= VAR_lit_uxn_opcodes_h_l2877_c40_2981_phase;
     lit_uxn_opcodes_h_l2877_c40_2981_pc <= VAR_lit_uxn_opcodes_h_l2877_c40_2981_pc;
     lit_uxn_opcodes_h_l2877_c40_2981_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2877_c40_2981_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2877_c40_2981_return_output := lit_uxn_opcodes_h_l2877_c40_2981_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_a653_return_output;
     VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_f497_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_iftrue := VAR_lit_uxn_opcodes_h_l2877_c40_2981_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_e2b2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_361a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_return_output;

     -- lit2[uxn_opcodes_h_l2878_c40_71a1] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2878_c40_71a1_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2878_c40_71a1_phase <= VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_phase;
     lit2_uxn_opcodes_h_l2878_c40_71a1_pc <= VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_pc;
     lit2_uxn_opcodes_h_l2878_c40_71a1_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_return_output := lit2_uxn_opcodes_h_l2878_c40_71a1_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_361a_return_output;
     VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e2b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_iftrue := VAR_lit2_uxn_opcodes_h_l2878_c40_71a1_return_output;
     -- inc[uxn_opcodes_h_l2879_c40_f4c6] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2879_c40_f4c6_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2879_c40_f4c6_phase <= VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_phase;
     inc_uxn_opcodes_h_l2879_c40_f4c6_ins <= VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_ins;
     inc_uxn_opcodes_h_l2879_c40_f4c6_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_return_output := inc_uxn_opcodes_h_l2879_c40_f4c6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_2f67] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_17e4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output;
     VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_2f67_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_iftrue := VAR_inc_uxn_opcodes_h_l2879_c40_f4c6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_56c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_return_output;

     -- inc2[uxn_opcodes_h_l2880_c40_0ad1] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2880_c40_0ad1_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2880_c40_0ad1_phase <= VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_phase;
     inc2_uxn_opcodes_h_l2880_c40_0ad1_ins <= VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_ins;
     inc2_uxn_opcodes_h_l2880_c40_0ad1_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_return_output := inc2_uxn_opcodes_h_l2880_c40_0ad1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_b6c6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output;
     VAR_pop_uxn_opcodes_h_l2881_c40_467d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_56c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_iftrue := VAR_inc2_uxn_opcodes_h_l2880_c40_0ad1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_f454] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_8178] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_return_output;

     -- pop[uxn_opcodes_h_l2881_c40_467d] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2881_c40_467d_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2881_c40_467d_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2881_c40_467d_phase <= VAR_pop_uxn_opcodes_h_l2881_c40_467d_phase;
     pop_uxn_opcodes_h_l2881_c40_467d_ins <= VAR_pop_uxn_opcodes_h_l2881_c40_467d_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2881_c40_467d_return_output := pop_uxn_opcodes_h_l2881_c40_467d_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_f454_return_output;
     VAR_pop2_uxn_opcodes_h_l2882_c40_2b42_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_8178_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_iftrue := VAR_pop_uxn_opcodes_h_l2881_c40_467d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_f13d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_cbc2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output;

     -- pop2[uxn_opcodes_h_l2882_c40_2b42] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2882_c40_2b42_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2882_c40_2b42_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2882_c40_2b42_phase <= VAR_pop2_uxn_opcodes_h_l2882_c40_2b42_phase;
     pop2_uxn_opcodes_h_l2882_c40_2b42_ins <= VAR_pop2_uxn_opcodes_h_l2882_c40_2b42_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2882_c40_2b42_return_output := pop2_uxn_opcodes_h_l2882_c40_2b42_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output;
     VAR_nip_uxn_opcodes_h_l2883_c40_4447_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_f13d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_iftrue := VAR_pop2_uxn_opcodes_h_l2882_c40_2b42_return_output;
     -- nip[uxn_opcodes_h_l2883_c40_4447] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2883_c40_4447_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2883_c40_4447_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2883_c40_4447_phase <= VAR_nip_uxn_opcodes_h_l2883_c40_4447_phase;
     nip_uxn_opcodes_h_l2883_c40_4447_ins <= VAR_nip_uxn_opcodes_h_l2883_c40_4447_ins;
     nip_uxn_opcodes_h_l2883_c40_4447_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2883_c40_4447_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2883_c40_4447_return_output := nip_uxn_opcodes_h_l2883_c40_4447_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_43db] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_2709] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_43db_return_output;
     VAR_nip2_uxn_opcodes_h_l2884_c40_1226_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_2709_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_iftrue := VAR_nip_uxn_opcodes_h_l2883_c40_4447_return_output;
     -- nip2[uxn_opcodes_h_l2884_c40_1226] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2884_c40_1226_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2884_c40_1226_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2884_c40_1226_phase <= VAR_nip2_uxn_opcodes_h_l2884_c40_1226_phase;
     nip2_uxn_opcodes_h_l2884_c40_1226_ins <= VAR_nip2_uxn_opcodes_h_l2884_c40_1226_ins;
     nip2_uxn_opcodes_h_l2884_c40_1226_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2884_c40_1226_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2884_c40_1226_return_output := nip2_uxn_opcodes_h_l2884_c40_1226_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_1506] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_659e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_1506_return_output;
     VAR_swp_uxn_opcodes_h_l2885_c40_ac09_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_659e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_iftrue := VAR_nip2_uxn_opcodes_h_l2884_c40_1226_return_output;
     -- swp[uxn_opcodes_h_l2885_c40_ac09] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2885_c40_ac09_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2885_c40_ac09_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2885_c40_ac09_phase <= VAR_swp_uxn_opcodes_h_l2885_c40_ac09_phase;
     swp_uxn_opcodes_h_l2885_c40_ac09_ins <= VAR_swp_uxn_opcodes_h_l2885_c40_ac09_ins;
     swp_uxn_opcodes_h_l2885_c40_ac09_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2885_c40_ac09_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2885_c40_ac09_return_output := swp_uxn_opcodes_h_l2885_c40_ac09_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_d306] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_473d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_d306_return_output;
     VAR_swp2_uxn_opcodes_h_l2886_c40_e578_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_473d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_iftrue := VAR_swp_uxn_opcodes_h_l2885_c40_ac09_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_8d3f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_c4a7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output;

     -- swp2[uxn_opcodes_h_l2886_c40_e578] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2886_c40_e578_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2886_c40_e578_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2886_c40_e578_phase <= VAR_swp2_uxn_opcodes_h_l2886_c40_e578_phase;
     swp2_uxn_opcodes_h_l2886_c40_e578_ins <= VAR_swp2_uxn_opcodes_h_l2886_c40_e578_ins;
     swp2_uxn_opcodes_h_l2886_c40_e578_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2886_c40_e578_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2886_c40_e578_return_output := swp2_uxn_opcodes_h_l2886_c40_e578_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output;
     VAR_rot_uxn_opcodes_h_l2887_c40_22af_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_8d3f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_iftrue := VAR_swp2_uxn_opcodes_h_l2886_c40_e578_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_2f7d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_return_output;

     -- rot[uxn_opcodes_h_l2887_c40_22af] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2887_c40_22af_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2887_c40_22af_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2887_c40_22af_phase <= VAR_rot_uxn_opcodes_h_l2887_c40_22af_phase;
     rot_uxn_opcodes_h_l2887_c40_22af_ins <= VAR_rot_uxn_opcodes_h_l2887_c40_22af_ins;
     rot_uxn_opcodes_h_l2887_c40_22af_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2887_c40_22af_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2887_c40_22af_return_output := rot_uxn_opcodes_h_l2887_c40_22af_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_2753] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_2753_return_output;
     VAR_rot2_uxn_opcodes_h_l2888_c40_852a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_2f7d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_iftrue := VAR_rot_uxn_opcodes_h_l2887_c40_22af_return_output;
     -- rot2[uxn_opcodes_h_l2888_c40_852a] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2888_c40_852a_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2888_c40_852a_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2888_c40_852a_phase <= VAR_rot2_uxn_opcodes_h_l2888_c40_852a_phase;
     rot2_uxn_opcodes_h_l2888_c40_852a_ins <= VAR_rot2_uxn_opcodes_h_l2888_c40_852a_ins;
     rot2_uxn_opcodes_h_l2888_c40_852a_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2888_c40_852a_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2888_c40_852a_return_output := rot2_uxn_opcodes_h_l2888_c40_852a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_aef7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_c056] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_c056_return_output;
     VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aef7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_iftrue := VAR_rot2_uxn_opcodes_h_l2888_c40_852a_return_output;
     -- dup[uxn_opcodes_h_l2889_c40_eb5e] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2889_c40_eb5e_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2889_c40_eb5e_phase <= VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_phase;
     dup_uxn_opcodes_h_l2889_c40_eb5e_ins <= VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_ins;
     dup_uxn_opcodes_h_l2889_c40_eb5e_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_return_output := dup_uxn_opcodes_h_l2889_c40_eb5e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_9863] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_df72] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_df72_return_output;
     VAR_dup2_uxn_opcodes_h_l2890_c40_9063_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_9863_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_iftrue := VAR_dup_uxn_opcodes_h_l2889_c40_eb5e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_708a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_88d9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_return_output;

     -- dup2[uxn_opcodes_h_l2890_c40_9063] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2890_c40_9063_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2890_c40_9063_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2890_c40_9063_phase <= VAR_dup2_uxn_opcodes_h_l2890_c40_9063_phase;
     dup2_uxn_opcodes_h_l2890_c40_9063_ins <= VAR_dup2_uxn_opcodes_h_l2890_c40_9063_ins;
     dup2_uxn_opcodes_h_l2890_c40_9063_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2890_c40_9063_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2890_c40_9063_return_output := dup2_uxn_opcodes_h_l2890_c40_9063_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_708a_return_output;
     VAR_ovr_uxn_opcodes_h_l2891_c40_8669_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_88d9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_iftrue := VAR_dup2_uxn_opcodes_h_l2890_c40_9063_return_output;
     -- ovr[uxn_opcodes_h_l2891_c40_8669] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2891_c40_8669_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2891_c40_8669_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2891_c40_8669_phase <= VAR_ovr_uxn_opcodes_h_l2891_c40_8669_phase;
     ovr_uxn_opcodes_h_l2891_c40_8669_ins <= VAR_ovr_uxn_opcodes_h_l2891_c40_8669_ins;
     ovr_uxn_opcodes_h_l2891_c40_8669_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2891_c40_8669_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2891_c40_8669_return_output := ovr_uxn_opcodes_h_l2891_c40_8669_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_f4b1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_3f67] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output;
     VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_3f67_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_iftrue := VAR_ovr_uxn_opcodes_h_l2891_c40_8669_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_8b07] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_b415] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_return_output;

     -- ovr2[uxn_opcodes_h_l2892_c40_eac0] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2892_c40_eac0_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2892_c40_eac0_phase <= VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_phase;
     ovr2_uxn_opcodes_h_l2892_c40_eac0_ins <= VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_ins;
     ovr2_uxn_opcodes_h_l2892_c40_eac0_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_return_output := ovr2_uxn_opcodes_h_l2892_c40_eac0_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_b415_return_output;
     VAR_equ_uxn_opcodes_h_l2893_c40_0a91_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_8b07_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_iftrue := VAR_ovr2_uxn_opcodes_h_l2892_c40_eac0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_5385] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_2f3a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_return_output;

     -- equ[uxn_opcodes_h_l2893_c40_0a91] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2893_c40_0a91_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2893_c40_0a91_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2893_c40_0a91_phase <= VAR_equ_uxn_opcodes_h_l2893_c40_0a91_phase;
     equ_uxn_opcodes_h_l2893_c40_0a91_ins <= VAR_equ_uxn_opcodes_h_l2893_c40_0a91_ins;
     equ_uxn_opcodes_h_l2893_c40_0a91_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2893_c40_0a91_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2893_c40_0a91_return_output := equ_uxn_opcodes_h_l2893_c40_0a91_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_5385_return_output;
     VAR_equ2_uxn_opcodes_h_l2894_c40_259d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_2f3a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_iftrue := VAR_equ_uxn_opcodes_h_l2893_c40_0a91_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_0c17] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output;

     -- equ2[uxn_opcodes_h_l2894_c40_259d] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2894_c40_259d_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2894_c40_259d_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2894_c40_259d_phase <= VAR_equ2_uxn_opcodes_h_l2894_c40_259d_phase;
     equ2_uxn_opcodes_h_l2894_c40_259d_ins <= VAR_equ2_uxn_opcodes_h_l2894_c40_259d_ins;
     equ2_uxn_opcodes_h_l2894_c40_259d_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2894_c40_259d_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2894_c40_259d_return_output := equ2_uxn_opcodes_h_l2894_c40_259d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_5fb0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output;
     VAR_neq_uxn_opcodes_h_l2895_c40_7fda_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_5fb0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_iftrue := VAR_equ2_uxn_opcodes_h_l2894_c40_259d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_0883] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_return_output;

     -- neq[uxn_opcodes_h_l2895_c40_7fda] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2895_c40_7fda_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2895_c40_7fda_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2895_c40_7fda_phase <= VAR_neq_uxn_opcodes_h_l2895_c40_7fda_phase;
     neq_uxn_opcodes_h_l2895_c40_7fda_ins <= VAR_neq_uxn_opcodes_h_l2895_c40_7fda_ins;
     neq_uxn_opcodes_h_l2895_c40_7fda_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2895_c40_7fda_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2895_c40_7fda_return_output := neq_uxn_opcodes_h_l2895_c40_7fda_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_cd22] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_0883_return_output;
     VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_cd22_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_iftrue := VAR_neq_uxn_opcodes_h_l2895_c40_7fda_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_02f6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_return_output;

     -- neq2[uxn_opcodes_h_l2896_c40_cdab] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2896_c40_cdab_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2896_c40_cdab_phase <= VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_phase;
     neq2_uxn_opcodes_h_l2896_c40_cdab_ins <= VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_ins;
     neq2_uxn_opcodes_h_l2896_c40_cdab_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_return_output := neq2_uxn_opcodes_h_l2896_c40_cdab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_6db7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output;
     VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_02f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_iftrue := VAR_neq2_uxn_opcodes_h_l2896_c40_cdab_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_3deb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_75b0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output;

     -- gth[uxn_opcodes_h_l2897_c40_2bd8] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2897_c40_2bd8_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2897_c40_2bd8_phase <= VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_phase;
     gth_uxn_opcodes_h_l2897_c40_2bd8_ins <= VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_ins;
     gth_uxn_opcodes_h_l2897_c40_2bd8_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_return_output := gth_uxn_opcodes_h_l2897_c40_2bd8_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output;
     VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_3deb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_iftrue := VAR_gth_uxn_opcodes_h_l2897_c40_2bd8_return_output;
     -- gth2[uxn_opcodes_h_l2898_c40_bb4d] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2898_c40_bb4d_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2898_c40_bb4d_phase <= VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_phase;
     gth2_uxn_opcodes_h_l2898_c40_bb4d_ins <= VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_ins;
     gth2_uxn_opcodes_h_l2898_c40_bb4d_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_return_output := gth2_uxn_opcodes_h_l2898_c40_bb4d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_2e7a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_6cea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output;
     VAR_lth_uxn_opcodes_h_l2899_c40_ca58_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_2e7a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_iftrue := VAR_gth2_uxn_opcodes_h_l2898_c40_bb4d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_fc1f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_d637] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_return_output;

     -- lth[uxn_opcodes_h_l2899_c40_ca58] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2899_c40_ca58_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2899_c40_ca58_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2899_c40_ca58_phase <= VAR_lth_uxn_opcodes_h_l2899_c40_ca58_phase;
     lth_uxn_opcodes_h_l2899_c40_ca58_ins <= VAR_lth_uxn_opcodes_h_l2899_c40_ca58_ins;
     lth_uxn_opcodes_h_l2899_c40_ca58_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2899_c40_ca58_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2899_c40_ca58_return_output := lth_uxn_opcodes_h_l2899_c40_ca58_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output;
     VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_d637_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_iftrue := VAR_lth_uxn_opcodes_h_l2899_c40_ca58_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_8f83] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output;

     -- lth2[uxn_opcodes_h_l2900_c40_57a7] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2900_c40_57a7_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2900_c40_57a7_phase <= VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_phase;
     lth2_uxn_opcodes_h_l2900_c40_57a7_ins <= VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_ins;
     lth2_uxn_opcodes_h_l2900_c40_57a7_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_return_output := lth2_uxn_opcodes_h_l2900_c40_57a7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_c6a4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output;
     VAR_jmp_uxn_opcodes_h_l2901_c40_407e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_c6a4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_iftrue := VAR_lth2_uxn_opcodes_h_l2900_c40_57a7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_ef67] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_return_output;

     -- jmp[uxn_opcodes_h_l2901_c40_407e] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2901_c40_407e_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2901_c40_407e_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2901_c40_407e_phase <= VAR_jmp_uxn_opcodes_h_l2901_c40_407e_phase;
     jmp_uxn_opcodes_h_l2901_c40_407e_ins <= VAR_jmp_uxn_opcodes_h_l2901_c40_407e_ins;
     jmp_uxn_opcodes_h_l2901_c40_407e_pc <= VAR_jmp_uxn_opcodes_h_l2901_c40_407e_pc;
     jmp_uxn_opcodes_h_l2901_c40_407e_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2901_c40_407e_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2901_c40_407e_return_output := jmp_uxn_opcodes_h_l2901_c40_407e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_aa81] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output;
     VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_ef67_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_iftrue := VAR_jmp_uxn_opcodes_h_l2901_c40_407e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_f22b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_1b17] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_return_output;

     -- jmp2[uxn_opcodes_h_l2902_c40_c4f8] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2902_c40_c4f8_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2902_c40_c4f8_phase <= VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_phase;
     jmp2_uxn_opcodes_h_l2902_c40_c4f8_ins <= VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_ins;
     jmp2_uxn_opcodes_h_l2902_c40_c4f8_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_return_output := jmp2_uxn_opcodes_h_l2902_c40_c4f8_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output;
     VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_1b17_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_iftrue := VAR_jmp2_uxn_opcodes_h_l2902_c40_c4f8_return_output;
     -- jcn[uxn_opcodes_h_l2903_c40_a7d1] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2903_c40_a7d1_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2903_c40_a7d1_phase <= VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_phase;
     jcn_uxn_opcodes_h_l2903_c40_a7d1_ins <= VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_ins;
     jcn_uxn_opcodes_h_l2903_c40_a7d1_pc <= VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_pc;
     jcn_uxn_opcodes_h_l2903_c40_a7d1_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_return_output := jcn_uxn_opcodes_h_l2903_c40_a7d1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_1070] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_b5da] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output;
     VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_1070_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_iftrue := VAR_jcn_uxn_opcodes_h_l2903_c40_a7d1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_00a1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_return_output;

     -- jcn2[uxn_opcodes_h_l2904_c40_5466] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2904_c40_5466_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2904_c40_5466_phase <= VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_phase;
     jcn2_uxn_opcodes_h_l2904_c40_5466_ins <= VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_ins;
     jcn2_uxn_opcodes_h_l2904_c40_5466_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_return_output := jcn2_uxn_opcodes_h_l2904_c40_5466_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_e627] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_e627_return_output;
     VAR_jsr_uxn_opcodes_h_l2905_c40_3732_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_00a1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_iftrue := VAR_jcn2_uxn_opcodes_h_l2904_c40_5466_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_b8b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_d450] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_return_output;

     -- jsr[uxn_opcodes_h_l2905_c40_3732] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2905_c40_3732_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2905_c40_3732_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2905_c40_3732_phase <= VAR_jsr_uxn_opcodes_h_l2905_c40_3732_phase;
     jsr_uxn_opcodes_h_l2905_c40_3732_ins <= VAR_jsr_uxn_opcodes_h_l2905_c40_3732_ins;
     jsr_uxn_opcodes_h_l2905_c40_3732_pc <= VAR_jsr_uxn_opcodes_h_l2905_c40_3732_pc;
     jsr_uxn_opcodes_h_l2905_c40_3732_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2905_c40_3732_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2905_c40_3732_return_output := jsr_uxn_opcodes_h_l2905_c40_3732_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_d450_return_output;
     VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_b8b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_iftrue := VAR_jsr_uxn_opcodes_h_l2905_c40_3732_return_output;
     -- jsr2[uxn_opcodes_h_l2906_c40_18dd] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2906_c40_18dd_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2906_c40_18dd_phase <= VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_phase;
     jsr2_uxn_opcodes_h_l2906_c40_18dd_ins <= VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_ins;
     jsr2_uxn_opcodes_h_l2906_c40_18dd_pc <= VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_pc;
     jsr2_uxn_opcodes_h_l2906_c40_18dd_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_return_output := jsr2_uxn_opcodes_h_l2906_c40_18dd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_4775] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_8875] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_4775_return_output;
     VAR_sth_uxn_opcodes_h_l2907_c40_407a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_8875_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_iftrue := VAR_jsr2_uxn_opcodes_h_l2906_c40_18dd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_f0ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_return_output;

     -- sth[uxn_opcodes_h_l2907_c40_407a] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2907_c40_407a_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2907_c40_407a_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2907_c40_407a_phase <= VAR_sth_uxn_opcodes_h_l2907_c40_407a_phase;
     sth_uxn_opcodes_h_l2907_c40_407a_ins <= VAR_sth_uxn_opcodes_h_l2907_c40_407a_ins;
     sth_uxn_opcodes_h_l2907_c40_407a_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2907_c40_407a_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2907_c40_407a_return_output := sth_uxn_opcodes_h_l2907_c40_407a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_9a5e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output;
     VAR_sth2_uxn_opcodes_h_l2908_c40_db30_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_f0ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_iftrue := VAR_sth_uxn_opcodes_h_l2907_c40_407a_return_output;
     -- sth2[uxn_opcodes_h_l2908_c40_db30] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2908_c40_db30_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2908_c40_db30_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2908_c40_db30_phase <= VAR_sth2_uxn_opcodes_h_l2908_c40_db30_phase;
     sth2_uxn_opcodes_h_l2908_c40_db30_ins <= VAR_sth2_uxn_opcodes_h_l2908_c40_db30_ins;
     sth2_uxn_opcodes_h_l2908_c40_db30_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2908_c40_db30_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2908_c40_db30_return_output := sth2_uxn_opcodes_h_l2908_c40_db30_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_d1f4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_3e1f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output;
     VAR_ldz_uxn_opcodes_h_l2909_c40_0717_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_3e1f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_iftrue := VAR_sth2_uxn_opcodes_h_l2908_c40_db30_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_ff52] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output;

     -- ldz[uxn_opcodes_h_l2909_c40_0717] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2909_c40_0717_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2909_c40_0717_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2909_c40_0717_phase <= VAR_ldz_uxn_opcodes_h_l2909_c40_0717_phase;
     ldz_uxn_opcodes_h_l2909_c40_0717_ins <= VAR_ldz_uxn_opcodes_h_l2909_c40_0717_ins;
     ldz_uxn_opcodes_h_l2909_c40_0717_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2909_c40_0717_previous_stack_read;
     ldz_uxn_opcodes_h_l2909_c40_0717_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2909_c40_0717_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2909_c40_0717_return_output := ldz_uxn_opcodes_h_l2909_c40_0717_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_3216] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output;
     VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_3216_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_iftrue := VAR_ldz_uxn_opcodes_h_l2909_c40_0717_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_e0cf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_42d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_return_output;

     -- ldz2[uxn_opcodes_h_l2910_c40_1f1d] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2910_c40_1f1d_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2910_c40_1f1d_phase <= VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_phase;
     ldz2_uxn_opcodes_h_l2910_c40_1f1d_ins <= VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_ins;
     ldz2_uxn_opcodes_h_l2910_c40_1f1d_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_previous_stack_read;
     ldz2_uxn_opcodes_h_l2910_c40_1f1d_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_return_output := ldz2_uxn_opcodes_h_l2910_c40_1f1d_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output;
     VAR_stz_uxn_opcodes_h_l2911_c40_fa75_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_42d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_iftrue := VAR_ldz2_uxn_opcodes_h_l2910_c40_1f1d_return_output;
     -- stz[uxn_opcodes_h_l2911_c40_fa75] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2911_c40_fa75_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2911_c40_fa75_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2911_c40_fa75_phase <= VAR_stz_uxn_opcodes_h_l2911_c40_fa75_phase;
     stz_uxn_opcodes_h_l2911_c40_fa75_ins <= VAR_stz_uxn_opcodes_h_l2911_c40_fa75_ins;
     stz_uxn_opcodes_h_l2911_c40_fa75_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2911_c40_fa75_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2911_c40_fa75_return_output := stz_uxn_opcodes_h_l2911_c40_fa75_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_ae23] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_eefe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output;
     VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_ae23_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_iftrue := VAR_stz_uxn_opcodes_h_l2911_c40_fa75_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_1523] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_75a6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_return_output;

     -- stz2[uxn_opcodes_h_l2912_c40_b0af] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2912_c40_b0af_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2912_c40_b0af_phase <= VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_phase;
     stz2_uxn_opcodes_h_l2912_c40_b0af_ins <= VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_ins;
     stz2_uxn_opcodes_h_l2912_c40_b0af_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_return_output := stz2_uxn_opcodes_h_l2912_c40_b0af_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_1523_return_output;
     VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_75a6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_iftrue := VAR_stz2_uxn_opcodes_h_l2912_c40_b0af_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_6321] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_return_output;

     -- ldr[uxn_opcodes_h_l2913_c40_6d89] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2913_c40_6d89_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2913_c40_6d89_phase <= VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_phase;
     ldr_uxn_opcodes_h_l2913_c40_6d89_ins <= VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_ins;
     ldr_uxn_opcodes_h_l2913_c40_6d89_pc <= VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_pc;
     ldr_uxn_opcodes_h_l2913_c40_6d89_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_previous_stack_read;
     ldr_uxn_opcodes_h_l2913_c40_6d89_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_return_output := ldr_uxn_opcodes_h_l2913_c40_6d89_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_f169] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_f169_return_output;
     VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_6321_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_iftrue := VAR_ldr_uxn_opcodes_h_l2913_c40_6d89_return_output;
     -- ldr2[uxn_opcodes_h_l2914_c40_014f] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2914_c40_014f_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2914_c40_014f_phase <= VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_phase;
     ldr2_uxn_opcodes_h_l2914_c40_014f_ins <= VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_ins;
     ldr2_uxn_opcodes_h_l2914_c40_014f_pc <= VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_pc;
     ldr2_uxn_opcodes_h_l2914_c40_014f_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_previous_stack_read;
     ldr2_uxn_opcodes_h_l2914_c40_014f_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_return_output := ldr2_uxn_opcodes_h_l2914_c40_014f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_8f93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_e7e0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output;
     VAR_str1_uxn_opcodes_h_l2915_c40_50f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_8f93_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_iftrue := VAR_ldr2_uxn_opcodes_h_l2914_c40_014f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_07a4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_return_output;

     -- str1[uxn_opcodes_h_l2915_c40_50f4] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2915_c40_50f4_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2915_c40_50f4_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2915_c40_50f4_phase <= VAR_str1_uxn_opcodes_h_l2915_c40_50f4_phase;
     str1_uxn_opcodes_h_l2915_c40_50f4_ins <= VAR_str1_uxn_opcodes_h_l2915_c40_50f4_ins;
     str1_uxn_opcodes_h_l2915_c40_50f4_pc <= VAR_str1_uxn_opcodes_h_l2915_c40_50f4_pc;
     str1_uxn_opcodes_h_l2915_c40_50f4_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2915_c40_50f4_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2915_c40_50f4_return_output := str1_uxn_opcodes_h_l2915_c40_50f4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_8222] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_8222_return_output;
     VAR_str2_uxn_opcodes_h_l2916_c40_a429_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_07a4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_iftrue := VAR_str1_uxn_opcodes_h_l2915_c40_50f4_return_output;
     -- str2[uxn_opcodes_h_l2916_c40_a429] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2916_c40_a429_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2916_c40_a429_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2916_c40_a429_phase <= VAR_str2_uxn_opcodes_h_l2916_c40_a429_phase;
     str2_uxn_opcodes_h_l2916_c40_a429_ins <= VAR_str2_uxn_opcodes_h_l2916_c40_a429_ins;
     str2_uxn_opcodes_h_l2916_c40_a429_pc <= VAR_str2_uxn_opcodes_h_l2916_c40_a429_pc;
     str2_uxn_opcodes_h_l2916_c40_a429_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2916_c40_a429_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2916_c40_a429_return_output := str2_uxn_opcodes_h_l2916_c40_a429_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_96cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_88cf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output;
     VAR_lda_uxn_opcodes_h_l2917_c40_cac1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_88cf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_iftrue := VAR_str2_uxn_opcodes_h_l2916_c40_a429_return_output;
     -- lda[uxn_opcodes_h_l2917_c40_cac1] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2917_c40_cac1_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2917_c40_cac1_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2917_c40_cac1_phase <= VAR_lda_uxn_opcodes_h_l2917_c40_cac1_phase;
     lda_uxn_opcodes_h_l2917_c40_cac1_ins <= VAR_lda_uxn_opcodes_h_l2917_c40_cac1_ins;
     lda_uxn_opcodes_h_l2917_c40_cac1_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2917_c40_cac1_previous_stack_read;
     lda_uxn_opcodes_h_l2917_c40_cac1_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2917_c40_cac1_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2917_c40_cac1_return_output := lda_uxn_opcodes_h_l2917_c40_cac1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_04ab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_a603] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_a603_return_output;
     VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_04ab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_iftrue := VAR_lda_uxn_opcodes_h_l2917_c40_cac1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_69b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_0012] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_return_output;

     -- lda2[uxn_opcodes_h_l2918_c40_8a4b] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2918_c40_8a4b_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2918_c40_8a4b_phase <= VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_phase;
     lda2_uxn_opcodes_h_l2918_c40_8a4b_ins <= VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_ins;
     lda2_uxn_opcodes_h_l2918_c40_8a4b_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_previous_stack_read;
     lda2_uxn_opcodes_h_l2918_c40_8a4b_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_return_output := lda2_uxn_opcodes_h_l2918_c40_8a4b_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_0012_return_output;
     VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_69b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_iftrue := VAR_lda2_uxn_opcodes_h_l2918_c40_8a4b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_2fce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output;

     -- sta[uxn_opcodes_h_l2919_c40_3ec7] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2919_c40_3ec7_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2919_c40_3ec7_phase <= VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_phase;
     sta_uxn_opcodes_h_l2919_c40_3ec7_ins <= VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_ins;
     sta_uxn_opcodes_h_l2919_c40_3ec7_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_return_output := sta_uxn_opcodes_h_l2919_c40_3ec7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_0872] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output;
     VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_0872_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_iftrue := VAR_sta_uxn_opcodes_h_l2919_c40_3ec7_return_output;
     -- sta2[uxn_opcodes_h_l2920_c40_aee4] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2920_c40_aee4_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2920_c40_aee4_phase <= VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_phase;
     sta2_uxn_opcodes_h_l2920_c40_aee4_ins <= VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_ins;
     sta2_uxn_opcodes_h_l2920_c40_aee4_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_return_output := sta2_uxn_opcodes_h_l2920_c40_aee4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_77c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_2c27] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output;
     VAR_dei_uxn_opcodes_h_l2921_c40_35ae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_2c27_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_iftrue := VAR_sta2_uxn_opcodes_h_l2920_c40_aee4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_53b0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output;

     -- dei[uxn_opcodes_h_l2921_c40_35ae] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2921_c40_35ae_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2921_c40_35ae_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2921_c40_35ae_phase <= VAR_dei_uxn_opcodes_h_l2921_c40_35ae_phase;
     dei_uxn_opcodes_h_l2921_c40_35ae_ins <= VAR_dei_uxn_opcodes_h_l2921_c40_35ae_ins;
     dei_uxn_opcodes_h_l2921_c40_35ae_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2921_c40_35ae_previous_stack_read;
     dei_uxn_opcodes_h_l2921_c40_35ae_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2921_c40_35ae_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2921_c40_35ae_return_output := dei_uxn_opcodes_h_l2921_c40_35ae_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_ffc9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output;
     VAR_dei2_uxn_opcodes_h_l2922_c40_6712_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_ffc9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_iftrue := VAR_dei_uxn_opcodes_h_l2921_c40_35ae_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_ffe2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_2748] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_return_output;

     -- dei2[uxn_opcodes_h_l2922_c40_6712] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2922_c40_6712_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2922_c40_6712_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2922_c40_6712_phase <= VAR_dei2_uxn_opcodes_h_l2922_c40_6712_phase;
     dei2_uxn_opcodes_h_l2922_c40_6712_ins <= VAR_dei2_uxn_opcodes_h_l2922_c40_6712_ins;
     dei2_uxn_opcodes_h_l2922_c40_6712_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2922_c40_6712_previous_stack_read;
     dei2_uxn_opcodes_h_l2922_c40_6712_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2922_c40_6712_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2922_c40_6712_return_output := dei2_uxn_opcodes_h_l2922_c40_6712_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_2748_return_output;
     VAR_deo_uxn_opcodes_h_l2923_c40_63e4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_ffe2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_iftrue := VAR_dei2_uxn_opcodes_h_l2922_c40_6712_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_2f1a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_32fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output;

     -- deo[uxn_opcodes_h_l2923_c40_63e4] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2923_c40_63e4_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2923_c40_63e4_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2923_c40_63e4_phase <= VAR_deo_uxn_opcodes_h_l2923_c40_63e4_phase;
     deo_uxn_opcodes_h_l2923_c40_63e4_ins <= VAR_deo_uxn_opcodes_h_l2923_c40_63e4_ins;
     deo_uxn_opcodes_h_l2923_c40_63e4_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2923_c40_63e4_previous_stack_read;
     deo_uxn_opcodes_h_l2923_c40_63e4_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2923_c40_63e4_previous_device_ram_read;
     deo_uxn_opcodes_h_l2923_c40_63e4_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2923_c40_63e4_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2923_c40_63e4_return_output := deo_uxn_opcodes_h_l2923_c40_63e4_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output;
     VAR_deo2_uxn_opcodes_h_l2924_c40_6340_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_2f1a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_iftrue := VAR_deo_uxn_opcodes_h_l2923_c40_63e4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_ff76] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_354f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_return_output;

     -- deo2[uxn_opcodes_h_l2924_c40_6340] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2924_c40_6340_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2924_c40_6340_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2924_c40_6340_phase <= VAR_deo2_uxn_opcodes_h_l2924_c40_6340_phase;
     deo2_uxn_opcodes_h_l2924_c40_6340_ins <= VAR_deo2_uxn_opcodes_h_l2924_c40_6340_ins;
     deo2_uxn_opcodes_h_l2924_c40_6340_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2924_c40_6340_previous_stack_read;
     deo2_uxn_opcodes_h_l2924_c40_6340_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2924_c40_6340_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2924_c40_6340_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2924_c40_6340_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2924_c40_6340_return_output := deo2_uxn_opcodes_h_l2924_c40_6340_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_354f_return_output;
     VAR_add_uxn_opcodes_h_l2925_c40_faf5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ff76_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_iftrue := VAR_deo2_uxn_opcodes_h_l2924_c40_6340_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_289e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_4d8a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output;

     -- add[uxn_opcodes_h_l2925_c40_faf5] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2925_c40_faf5_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2925_c40_faf5_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2925_c40_faf5_phase <= VAR_add_uxn_opcodes_h_l2925_c40_faf5_phase;
     add_uxn_opcodes_h_l2925_c40_faf5_ins <= VAR_add_uxn_opcodes_h_l2925_c40_faf5_ins;
     add_uxn_opcodes_h_l2925_c40_faf5_previous_stack_read <= VAR_add_uxn_opcodes_h_l2925_c40_faf5_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2925_c40_faf5_return_output := add_uxn_opcodes_h_l2925_c40_faf5_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output;
     VAR_add2_uxn_opcodes_h_l2926_c40_f11a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_289e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_iftrue := VAR_add_uxn_opcodes_h_l2925_c40_faf5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_0a1a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_3e0c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_return_output;

     -- add2[uxn_opcodes_h_l2926_c40_f11a] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2926_c40_f11a_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2926_c40_f11a_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2926_c40_f11a_phase <= VAR_add2_uxn_opcodes_h_l2926_c40_f11a_phase;
     add2_uxn_opcodes_h_l2926_c40_f11a_ins <= VAR_add2_uxn_opcodes_h_l2926_c40_f11a_ins;
     add2_uxn_opcodes_h_l2926_c40_f11a_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2926_c40_f11a_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2926_c40_f11a_return_output := add2_uxn_opcodes_h_l2926_c40_f11a_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output;
     VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_3e0c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_iftrue := VAR_add2_uxn_opcodes_h_l2926_c40_f11a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_adeb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_5524] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_return_output;

     -- sub[uxn_opcodes_h_l2927_c40_f1ef] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2927_c40_f1ef_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2927_c40_f1ef_phase <= VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_phase;
     sub_uxn_opcodes_h_l2927_c40_f1ef_ins <= VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_ins;
     sub_uxn_opcodes_h_l2927_c40_f1ef_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_return_output := sub_uxn_opcodes_h_l2927_c40_f1ef_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_5524_return_output;
     VAR_sub2_uxn_opcodes_h_l2928_c40_54df_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_adeb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_iftrue := VAR_sub_uxn_opcodes_h_l2927_c40_f1ef_return_output;
     -- sub2[uxn_opcodes_h_l2928_c40_54df] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2928_c40_54df_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2928_c40_54df_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2928_c40_54df_phase <= VAR_sub2_uxn_opcodes_h_l2928_c40_54df_phase;
     sub2_uxn_opcodes_h_l2928_c40_54df_ins <= VAR_sub2_uxn_opcodes_h_l2928_c40_54df_ins;
     sub2_uxn_opcodes_h_l2928_c40_54df_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2928_c40_54df_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2928_c40_54df_return_output := sub2_uxn_opcodes_h_l2928_c40_54df_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_d8f2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_1e9e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output;
     VAR_mul_uxn_opcodes_h_l2929_c40_3115_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_1e9e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_iftrue := VAR_sub2_uxn_opcodes_h_l2928_c40_54df_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_52a3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_return_output;

     -- mul[uxn_opcodes_h_l2929_c40_3115] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2929_c40_3115_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2929_c40_3115_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2929_c40_3115_phase <= VAR_mul_uxn_opcodes_h_l2929_c40_3115_phase;
     mul_uxn_opcodes_h_l2929_c40_3115_ins <= VAR_mul_uxn_opcodes_h_l2929_c40_3115_ins;
     mul_uxn_opcodes_h_l2929_c40_3115_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2929_c40_3115_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2929_c40_3115_return_output := mul_uxn_opcodes_h_l2929_c40_3115_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_b1f3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output;
     VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_52a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_iftrue := VAR_mul_uxn_opcodes_h_l2929_c40_3115_return_output;
     -- mul2[uxn_opcodes_h_l2930_c40_1f7c] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2930_c40_1f7c_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2930_c40_1f7c_phase <= VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_phase;
     mul2_uxn_opcodes_h_l2930_c40_1f7c_ins <= VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_ins;
     mul2_uxn_opcodes_h_l2930_c40_1f7c_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_return_output := mul2_uxn_opcodes_h_l2930_c40_1f7c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_b07d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_b8bc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output;
     VAR_div_uxn_opcodes_h_l2931_c40_6e1b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_b8bc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_iftrue := VAR_mul2_uxn_opcodes_h_l2930_c40_1f7c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_1fbc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_ec4a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_return_output;

     -- div[uxn_opcodes_h_l2931_c40_6e1b] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2931_c40_6e1b_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2931_c40_6e1b_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2931_c40_6e1b_phase <= VAR_div_uxn_opcodes_h_l2931_c40_6e1b_phase;
     div_uxn_opcodes_h_l2931_c40_6e1b_ins <= VAR_div_uxn_opcodes_h_l2931_c40_6e1b_ins;
     div_uxn_opcodes_h_l2931_c40_6e1b_previous_stack_read <= VAR_div_uxn_opcodes_h_l2931_c40_6e1b_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2931_c40_6e1b_return_output := div_uxn_opcodes_h_l2931_c40_6e1b_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output;
     VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_ec4a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_iftrue := VAR_div_uxn_opcodes_h_l2931_c40_6e1b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_abef] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_return_output;

     -- div2[uxn_opcodes_h_l2932_c40_c1fc] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2932_c40_c1fc_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2932_c40_c1fc_phase <= VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_phase;
     div2_uxn_opcodes_h_l2932_c40_c1fc_ins <= VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_ins;
     div2_uxn_opcodes_h_l2932_c40_c1fc_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_return_output := div2_uxn_opcodes_h_l2932_c40_c1fc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_a5c8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output;
     VAR_and_uxn_opcodes_h_l2933_c40_bb5c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_abef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_iftrue := VAR_div2_uxn_opcodes_h_l2932_c40_c1fc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_6a87] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_f617] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_return_output;

     -- and[uxn_opcodes_h_l2933_c40_bb5c] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2933_c40_bb5c_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2933_c40_bb5c_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2933_c40_bb5c_phase <= VAR_and_uxn_opcodes_h_l2933_c40_bb5c_phase;
     and_uxn_opcodes_h_l2933_c40_bb5c_ins <= VAR_and_uxn_opcodes_h_l2933_c40_bb5c_ins;
     and_uxn_opcodes_h_l2933_c40_bb5c_previous_stack_read <= VAR_and_uxn_opcodes_h_l2933_c40_bb5c_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2933_c40_bb5c_return_output := and_uxn_opcodes_h_l2933_c40_bb5c_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_f617_return_output;
     VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_6a87_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_iftrue := VAR_and_uxn_opcodes_h_l2933_c40_bb5c_return_output;
     -- and2[uxn_opcodes_h_l2934_c40_5a3a] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2934_c40_5a3a_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2934_c40_5a3a_phase <= VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_phase;
     and2_uxn_opcodes_h_l2934_c40_5a3a_ins <= VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_ins;
     and2_uxn_opcodes_h_l2934_c40_5a3a_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_return_output := and2_uxn_opcodes_h_l2934_c40_5a3a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_7d0a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_7554] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_7554_return_output;
     VAR_ora_uxn_opcodes_h_l2935_c40_e267_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_7d0a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_iftrue := VAR_and2_uxn_opcodes_h_l2934_c40_5a3a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_54f6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_return_output;

     -- ora[uxn_opcodes_h_l2935_c40_e267] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2935_c40_e267_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2935_c40_e267_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2935_c40_e267_phase <= VAR_ora_uxn_opcodes_h_l2935_c40_e267_phase;
     ora_uxn_opcodes_h_l2935_c40_e267_ins <= VAR_ora_uxn_opcodes_h_l2935_c40_e267_ins;
     ora_uxn_opcodes_h_l2935_c40_e267_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2935_c40_e267_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2935_c40_e267_return_output := ora_uxn_opcodes_h_l2935_c40_e267_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_d719] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_d719_return_output;
     VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_54f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_iftrue := VAR_ora_uxn_opcodes_h_l2935_c40_e267_return_output;
     -- ora2[uxn_opcodes_h_l2936_c40_7d24] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2936_c40_7d24_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2936_c40_7d24_phase <= VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_phase;
     ora2_uxn_opcodes_h_l2936_c40_7d24_ins <= VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_ins;
     ora2_uxn_opcodes_h_l2936_c40_7d24_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_return_output := ora2_uxn_opcodes_h_l2936_c40_7d24_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_4806] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_1461] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_4806_return_output;
     VAR_eor_uxn_opcodes_h_l2937_c40_3900_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_1461_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_iftrue := VAR_ora2_uxn_opcodes_h_l2936_c40_7d24_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_e247] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_return_output;

     -- eor[uxn_opcodes_h_l2937_c40_3900] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2937_c40_3900_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2937_c40_3900_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2937_c40_3900_phase <= VAR_eor_uxn_opcodes_h_l2937_c40_3900_phase;
     eor_uxn_opcodes_h_l2937_c40_3900_ins <= VAR_eor_uxn_opcodes_h_l2937_c40_3900_ins;
     eor_uxn_opcodes_h_l2937_c40_3900_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2937_c40_3900_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2937_c40_3900_return_output := eor_uxn_opcodes_h_l2937_c40_3900_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_53e4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e247_return_output;
     VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_53e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_iftrue := VAR_eor_uxn_opcodes_h_l2937_c40_3900_return_output;
     -- eor2[uxn_opcodes_h_l2938_c40_b1e0] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2938_c40_b1e0_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2938_c40_b1e0_phase <= VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_phase;
     eor2_uxn_opcodes_h_l2938_c40_b1e0_ins <= VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_ins;
     eor2_uxn_opcodes_h_l2938_c40_b1e0_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_return_output := eor2_uxn_opcodes_h_l2938_c40_b1e0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_4709] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_9683] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_4709_return_output;
     VAR_sft_uxn_opcodes_h_l2939_c40_a141_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_9683_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_iftrue := VAR_eor2_uxn_opcodes_h_l2938_c40_b1e0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_53a3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_return_output;

     -- sft[uxn_opcodes_h_l2939_c40_a141] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2939_c40_a141_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2939_c40_a141_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2939_c40_a141_phase <= VAR_sft_uxn_opcodes_h_l2939_c40_a141_phase;
     sft_uxn_opcodes_h_l2939_c40_a141_ins <= VAR_sft_uxn_opcodes_h_l2939_c40_a141_ins;
     sft_uxn_opcodes_h_l2939_c40_a141_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2939_c40_a141_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2939_c40_a141_return_output := sft_uxn_opcodes_h_l2939_c40_a141_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_53a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_iftrue := VAR_sft_uxn_opcodes_h_l2939_c40_a141_return_output;
     -- sft2[uxn_opcodes_h_l2940_c40_84ae] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2940_c40_84ae_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2940_c40_84ae_phase <= VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_phase;
     sft2_uxn_opcodes_h_l2940_c40_84ae_ins <= VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_ins;
     sft2_uxn_opcodes_h_l2940_c40_84ae_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_return_output := sft2_uxn_opcodes_h_l2940_c40_84ae_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_iftrue := VAR_sft2_uxn_opcodes_h_l2940_c40_84ae_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_4709] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_4709_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_e247] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e247_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_4806] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_4806_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_d719] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_d719_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_7554] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_7554_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_f617] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_f617_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_a5c8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_a5c8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_1fbc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1fbc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_b07d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_b07d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_b1f3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_b1f3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_d8f2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_d8f2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_5524] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_5524_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_0a1a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_0a1a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_4d8a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_4d8a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_354f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_354f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_32fd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_32fd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_2748] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_2748_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_53b0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_53b0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_77c5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_77c5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_2fce] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_2fce_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_0012] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_0012_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_a603] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_a603_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_96cc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_96cc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_8222] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_8222_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_e7e0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_e7e0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_f169] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_f169_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_1523] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_1523_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_eefe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_eefe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_e0cf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_e0cf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_ff52] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_ff52_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_d1f4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_d1f4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_9a5e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_9a5e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_4775] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_4775_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_d450] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_d450_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_e627] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_e627_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_b5da] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_b5da_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_f22b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_f22b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_aa81] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_aa81_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_8f83] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_8f83_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_fc1f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_fc1f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_6cea] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_6cea_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_75b0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_75b0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_6db7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_6db7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_0883] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_0883_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_0c17] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_0c17_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_5385] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_5385_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_b415] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_b415_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_f4b1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f4b1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_708a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_708a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_df72] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_df72_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_c056] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_c056_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c7_2753] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_2753_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c7_c4a7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_c4a7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2887_c7_d306] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_cond;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_return_output := opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_d306_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2886_c7_1506] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_cond;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_return_output := opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_1506_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2885_c7_43db] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_cond;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_return_output := opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_43db_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2884_c7_cbc2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_cond;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output := opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_cbc2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2883_c7_f454] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_cond;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_return_output := opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_f454_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2882_c7_b6c6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_cond;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output := opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b6c6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2881_c7_17e4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_cond;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output := opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_17e4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2880_c7_361a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_cond;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_return_output := opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_361a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2879_c7_a653] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_cond;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_return_output := opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_a653_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2878_c7_87be] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_cond;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_return_output := opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_87be_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2877_c7_7ad0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_cond;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output := opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_7ad0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2876_c7_0cd9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_cond;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output := opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_0cd9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2875_c7_744b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_cond;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_return_output := opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_744b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2874_c7_83cf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_cond;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output := opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_83cf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2873_c7_030f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_cond;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_return_output := opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_030f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2872_c7_6f58] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_cond;
     opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output := opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_6f58_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2871_c2_c9b2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_cond;
     opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output := opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output;
     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2961_c39_e1ca] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2961_c39_e1ca_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output.device_ram_address;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2946_l2948_DUPLICATE_9565 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2946_l2948_DUPLICATE_9565_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2957_c3_f1b4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2957_c3_f1b4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_fcf6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_fcf6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2967_c37_09a8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2967_c37_09a8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2962_c40_b6a5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2962_c40_b6a5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2963_c34_bd25] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2963_c34_bd25_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2966_c34_33bd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2966_c34_33bd_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2943_c17_3fe6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2943_c17_3fe6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2965_c33_63fd] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2965_c33_63fd_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2951_c68_45ae] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2951_c68_45ae_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2964_c30_7c60] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2964_c30_7c60_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2969_c32_210e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2969_c32_210e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output.is_opc_done;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2943_c17_3fe6_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2957_c3_f1b4_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_fcf6_return_output;
     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_0e33 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_0e33_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2871_c2_c9b2_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2961_c39_e1ca_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2962_c40_b6a5_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2963_c34_bd25_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2964_c30_7c60_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2965_c33_63fd_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2966_c34_33bd_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2967_c37_09a8_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2968_l2956_DUPLICATE_fcf6_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2969_c32_210e_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_413d LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_413d_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2946_l2948_DUPLICATE_9565_return_output);

     -- CAST_TO_uint9_t[uxn_opcodes_h_l2951_c58_742f] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c58_742f_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2951_c68_45ae_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2943_c2_7a90] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_left;
     BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_return_output := BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_return_output;

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2951_c29_26f4_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_return_output;
     VAR_MUX_uxn_opcodes_h_l2952_c20_ea05_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_0942_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_0942_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2943_c2_7a90_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_413d_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2948_l2946_DUPLICATE_413d_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c58_742f_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_0e33_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2971_l2848_DUPLICATE_0e33_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2946_c3_05ae] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2948_c3_0a1f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_return_output;

     -- MUX[uxn_opcodes_h_l2952_c20_ea05] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2952_c20_ea05_cond <= VAR_MUX_uxn_opcodes_h_l2952_c20_ea05_cond;
     MUX_uxn_opcodes_h_l2952_c20_ea05_iftrue <= VAR_MUX_uxn_opcodes_h_l2952_c20_ea05_iftrue;
     MUX_uxn_opcodes_h_l2952_c20_ea05_iffalse <= VAR_MUX_uxn_opcodes_h_l2952_c20_ea05_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2952_c20_ea05_return_output := MUX_uxn_opcodes_h_l2952_c20_ea05_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2946_c3_f6b3 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2946_c3_05ae_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2948_c3_dab0 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2948_c3_0a1f_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_right := VAR_MUX_uxn_opcodes_h_l2952_c20_ea05_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_0942_iffalse := VAR_sp0_uxn_opcodes_h_l2948_c3_dab0;
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_0942_iftrue := VAR_sp1_uxn_opcodes_h_l2946_c3_f6b3;
     -- sp1_MUX[uxn_opcodes_h_l2945_c2_0942] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2945_c2_0942_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_0942_cond;
     sp1_MUX_uxn_opcodes_h_l2945_c2_0942_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_0942_iftrue;
     sp1_MUX_uxn_opcodes_h_l2945_c2_0942_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_0942_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_0942_return_output := sp1_MUX_uxn_opcodes_h_l2945_c2_0942_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2945_c2_0942] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2945_c2_0942_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_0942_cond;
     sp0_MUX_uxn_opcodes_h_l2945_c2_0942_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_0942_iftrue;
     sp0_MUX_uxn_opcodes_h_l2945_c2_0942_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_0942_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_0942_return_output := sp0_MUX_uxn_opcodes_h_l2945_c2_0942_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2951_c29_26f4_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_0942_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2945_c2_0942_return_output;
     VAR_MUX_uxn_opcodes_h_l2951_c29_26f4_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_0942_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2945_c2_0942_return_output;
     -- MUX[uxn_opcodes_h_l2951_c29_26f4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2951_c29_26f4_cond <= VAR_MUX_uxn_opcodes_h_l2951_c29_26f4_cond;
     MUX_uxn_opcodes_h_l2951_c29_26f4_iftrue <= VAR_MUX_uxn_opcodes_h_l2951_c29_26f4_iftrue;
     MUX_uxn_opcodes_h_l2951_c29_26f4_iffalse <= VAR_MUX_uxn_opcodes_h_l2951_c29_26f4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2951_c29_26f4_return_output := MUX_uxn_opcodes_h_l2951_c29_26f4_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2951_c19_ad66] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c19_ad66_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2951_c29_26f4_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2951_c19_ad66_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2951_c19_fb6c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_return_output;

     -- Submodule level 156
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2951_c19_fb6c_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2952_c2_6fea] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_return_output;

     -- Submodule level 157
     VAR_stack_address_uxn_opcodes_h_l2952_c2_7b2f := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2952_c2_6fea_return_output, 9);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2952_c2_7b2f;
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_stack_address := VAR_stack_address_uxn_opcodes_h_l2952_c2_7b2f;
     -- stack_ram_update[uxn_opcodes_h_l2954_c24_83b2] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_stack_address;
     stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_value <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_value;
     stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_return_output := stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2954_c24_83b2_return_output;
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
