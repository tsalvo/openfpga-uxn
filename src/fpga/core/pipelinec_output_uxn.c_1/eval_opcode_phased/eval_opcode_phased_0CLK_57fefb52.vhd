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
-- Submodules: 373
entity eval_opcode_phased_0CLK_57fefb52 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_57fefb52;
architecture arch of eval_opcode_phased_0CLK_57fefb52 is
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
-- BIN_OP_AND[uxn_opcodes_h_l2890_c14_2ad2]
signal BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2891_c14_a479]
signal BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2891_c14_08bd]
signal BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2891_c14_fb6a]
signal UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2891_c14_383a]
signal BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2891_c14_63b8]
signal MUX_uxn_opcodes_h_l2891_c14_63b8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2891_c14_63b8_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2891_c14_63b8_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2891_c14_63b8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2892_c8_7270]
signal MUX_uxn_opcodes_h_l2892_c8_7270_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2892_c8_7270_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2892_c8_7270_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2892_c8_7270_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c6_5776]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_47f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_42ac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output : unsigned(0 downto 0);

-- is_wait_MUX[uxn_opcodes_h_l2898_c2_8aa4]
signal is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c2_8aa4]
signal opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output : opcode_result_t;

-- brk[uxn_opcodes_h_l2898_c48_8b7c]
signal brk_uxn_opcodes_h_l2898_c48_8b7c_CLOCK_ENABLE : unsigned(0 downto 0);
signal brk_uxn_opcodes_h_l2898_c48_8b7c_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2898_c48_8b7c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_6741]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_e3d2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_a8a6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_42ac]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2899_c40_31a9]
signal jci_uxn_opcodes_h_l2899_c40_31a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2899_c40_31a9_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2899_c40_31a9_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2899_c40_31a9_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2899_c40_31a9_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2899_c40_31a9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_8d82]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_a774]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_3a52]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_a8a6]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2900_c40_10d8]
signal jmi_uxn_opcodes_h_l2900_c40_10d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2900_c40_10d8_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2900_c40_10d8_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2900_c40_10d8_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2900_c40_10d8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_3e8a]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_d585]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_2123]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_3a52]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2901_c40_6acd]
signal jsi_uxn_opcodes_h_l2901_c40_6acd_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2901_c40_6acd_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2901_c40_6acd_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2901_c40_6acd_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2901_c40_6acd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_1ece]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_5c2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_be1c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_2123]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2902_c40_1a75]
signal lit_uxn_opcodes_h_l2902_c40_1a75_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2902_c40_1a75_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2902_c40_1a75_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2902_c40_1a75_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2902_c40_1a75_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_950e]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_a1de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_0a5e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_be1c]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2903_c40_0aac]
signal lit2_uxn_opcodes_h_l2903_c40_0aac_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2903_c40_0aac_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2903_c40_0aac_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2903_c40_0aac_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2903_c40_0aac_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_070b]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_8854]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_0e8c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_0a5e]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2904_c40_bb0d]
signal lit_uxn_opcodes_h_l2904_c40_bb0d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2904_c40_bb0d_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2904_c40_bb0d_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2904_c40_bb0d_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2904_c40_bb0d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_08f7]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_4d4f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_5365]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_0e8c]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2905_c40_3560]
signal lit2_uxn_opcodes_h_l2905_c40_3560_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2905_c40_3560_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2905_c40_3560_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2905_c40_3560_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2905_c40_3560_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_93a9]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_24ce]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_5799]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_5365]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2906_c40_7459]
signal inc_uxn_opcodes_h_l2906_c40_7459_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2906_c40_7459_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2906_c40_7459_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2906_c40_7459_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2906_c40_7459_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_7beb]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_670c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_08a2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_5799]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2907_c40_9b91]
signal inc2_uxn_opcodes_h_l2907_c40_9b91_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2907_c40_9b91_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2907_c40_9b91_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2907_c40_9b91_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2907_c40_9b91_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_162e]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_36e4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_1c68]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_08a2]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2908_c40_178d]
signal pop_uxn_opcodes_h_l2908_c40_178d_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2908_c40_178d_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2908_c40_178d_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2908_c40_178d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_8a9f]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_022b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_f8d3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_1c68]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2909_c40_936e]
signal pop2_uxn_opcodes_h_l2909_c40_936e_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2909_c40_936e_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2909_c40_936e_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2909_c40_936e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_a710]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_dc91]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_858f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_f8d3]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2910_c40_8853]
signal nip_uxn_opcodes_h_l2910_c40_8853_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2910_c40_8853_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2910_c40_8853_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2910_c40_8853_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2910_c40_8853_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_dc61]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_c726]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_bc75]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_858f]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2911_c40_dade]
signal nip2_uxn_opcodes_h_l2911_c40_dade_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2911_c40_dade_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2911_c40_dade_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2911_c40_dade_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2911_c40_dade_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_6853]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_8eea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_7984]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_bc75]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2912_c40_8924]
signal swp_uxn_opcodes_h_l2912_c40_8924_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2912_c40_8924_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2912_c40_8924_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2912_c40_8924_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2912_c40_8924_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_b75a]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_2d2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_0291]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_7984]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2913_c40_e2fe]
signal swp2_uxn_opcodes_h_l2913_c40_e2fe_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2913_c40_e2fe_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2913_c40_e2fe_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2913_c40_e2fe_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2913_c40_e2fe_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_d8ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_3606]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_7955]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_0291]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2914_c40_dbf6]
signal rot_uxn_opcodes_h_l2914_c40_dbf6_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2914_c40_dbf6_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2914_c40_dbf6_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2914_c40_dbf6_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2914_c40_dbf6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_595b]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_6900]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_97d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_7955]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2915_c40_de75]
signal rot2_uxn_opcodes_h_l2915_c40_de75_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2915_c40_de75_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2915_c40_de75_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2915_c40_de75_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2915_c40_de75_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_8a60]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_d876]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_d98d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_97d1]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2916_c40_f52b]
signal dup_uxn_opcodes_h_l2916_c40_f52b_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2916_c40_f52b_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2916_c40_f52b_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2916_c40_f52b_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2916_c40_f52b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_7080]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_7377]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_8b16]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_d98d]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2917_c40_abf0]
signal dup2_uxn_opcodes_h_l2917_c40_abf0_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2917_c40_abf0_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2917_c40_abf0_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2917_c40_abf0_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2917_c40_abf0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_96f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_e662]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_4a47]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_8b16]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2918_c40_63e9]
signal ovr_uxn_opcodes_h_l2918_c40_63e9_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2918_c40_63e9_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2918_c40_63e9_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2918_c40_63e9_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2918_c40_63e9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_5d31]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_c149]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_1fbf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_4a47]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2919_c40_d8a9]
signal ovr2_uxn_opcodes_h_l2919_c40_d8a9_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2919_c40_d8a9_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2919_c40_d8a9_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2919_c40_d8a9_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2919_c40_d8a9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_281e]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_b6c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_4f19]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_1fbf]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2920_c40_0cc5]
signal equ_uxn_opcodes_h_l2920_c40_0cc5_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2920_c40_0cc5_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2920_c40_0cc5_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2920_c40_0cc5_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2920_c40_0cc5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_bf73]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_5dbe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_efc4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_4f19]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2921_c40_42af]
signal equ2_uxn_opcodes_h_l2921_c40_42af_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2921_c40_42af_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2921_c40_42af_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2921_c40_42af_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2921_c40_42af_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_948e]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_6f14]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_611c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_efc4]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2922_c40_e9b6]
signal neq_uxn_opcodes_h_l2922_c40_e9b6_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2922_c40_e9b6_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2922_c40_e9b6_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2922_c40_e9b6_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2922_c40_e9b6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_7549]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_dfd4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_45dd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_611c]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2923_c40_625e]
signal neq2_uxn_opcodes_h_l2923_c40_625e_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2923_c40_625e_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2923_c40_625e_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2923_c40_625e_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2923_c40_625e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_f858]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_22db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_88c5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_45dd]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2924_c40_0b12]
signal gth_uxn_opcodes_h_l2924_c40_0b12_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2924_c40_0b12_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2924_c40_0b12_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2924_c40_0b12_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2924_c40_0b12_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_1b06]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_ae61]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_710b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_88c5]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2925_c40_6441]
signal gth2_uxn_opcodes_h_l2925_c40_6441_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2925_c40_6441_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2925_c40_6441_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2925_c40_6441_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2925_c40_6441_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_f9a9]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_7cec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_8f72]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_710b]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2926_c40_53ad]
signal lth_uxn_opcodes_h_l2926_c40_53ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2926_c40_53ad_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2926_c40_53ad_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2926_c40_53ad_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2926_c40_53ad_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_a0f8]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_d172]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_c00c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_8f72]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2927_c40_cca9]
signal lth2_uxn_opcodes_h_l2927_c40_cca9_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2927_c40_cca9_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2927_c40_cca9_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2927_c40_cca9_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2927_c40_cca9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_df0e]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_61f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_02a6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_c00c]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2928_c40_8508]
signal jmp_uxn_opcodes_h_l2928_c40_8508_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2928_c40_8508_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2928_c40_8508_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2928_c40_8508_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2928_c40_8508_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2928_c40_8508_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_7a9b]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_6b76]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_7e8d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_02a6]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2929_c40_589f]
signal jmp2_uxn_opcodes_h_l2929_c40_589f_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2929_c40_589f_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2929_c40_589f_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2929_c40_589f_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2929_c40_589f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_5ef8]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_e511]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_522d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_7e8d]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2930_c40_d383]
signal jcn_uxn_opcodes_h_l2930_c40_d383_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2930_c40_d383_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2930_c40_d383_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2930_c40_d383_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2930_c40_d383_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2930_c40_d383_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_cfe1]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_a062]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_5530]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_522d]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2931_c40_0032]
signal jcn2_uxn_opcodes_h_l2931_c40_0032_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2931_c40_0032_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2931_c40_0032_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2931_c40_0032_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2931_c40_0032_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_2c7a]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_7fb7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_4281]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_5530]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2932_c40_8038]
signal jsr_uxn_opcodes_h_l2932_c40_8038_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2932_c40_8038_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2932_c40_8038_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2932_c40_8038_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2932_c40_8038_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2932_c40_8038_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_6a6d]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_1136]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_88b6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_4281]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2933_c40_7f03]
signal jsr2_uxn_opcodes_h_l2933_c40_7f03_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2933_c40_7f03_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2933_c40_7f03_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2933_c40_7f03_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2933_c40_7f03_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2933_c40_7f03_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_287f]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_84cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_e4b0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_88b6]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2934_c40_883e]
signal sth_uxn_opcodes_h_l2934_c40_883e_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2934_c40_883e_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2934_c40_883e_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2934_c40_883e_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2934_c40_883e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_686a]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_20a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_cd61]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_e4b0]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2935_c40_7013]
signal sth2_uxn_opcodes_h_l2935_c40_7013_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2935_c40_7013_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2935_c40_7013_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2935_c40_7013_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2935_c40_7013_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_ddc1]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_c6da]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_fb03]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_cd61]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2936_c40_1d9e]
signal ldz_uxn_opcodes_h_l2936_c40_1d9e_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2936_c40_1d9e_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2936_c40_1d9e_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2936_c40_1d9e_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2936_c40_1d9e_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2936_c40_1d9e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_c91b]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_9ef4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_da7d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_fb03]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2937_c40_15c0]
signal ldz2_uxn_opcodes_h_l2937_c40_15c0_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2937_c40_15c0_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2937_c40_15c0_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2937_c40_15c0_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2937_c40_15c0_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2937_c40_15c0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_dcc5]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_9dac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_dc07]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_da7d]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2938_c40_0e71]
signal stz_uxn_opcodes_h_l2938_c40_0e71_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2938_c40_0e71_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2938_c40_0e71_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2938_c40_0e71_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2938_c40_0e71_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_3880]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_bb2b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_d70a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_dc07]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2939_c40_e402]
signal stz2_uxn_opcodes_h_l2939_c40_e402_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2939_c40_e402_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2939_c40_e402_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2939_c40_e402_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2939_c40_e402_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_7f49]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_ae54]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_89eb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_d70a]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2940_c40_af57]
signal ldr_uxn_opcodes_h_l2940_c40_af57_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2940_c40_af57_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2940_c40_af57_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2940_c40_af57_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2940_c40_af57_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2940_c40_af57_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2940_c40_af57_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_6880]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_f726]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_4814]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2941_c7_89eb]
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2941_c40_82b5]
signal ldr2_uxn_opcodes_h_l2941_c40_82b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2941_c40_82b5_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2941_c40_82b5_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2941_c40_82b5_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2941_c40_82b5_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2941_c40_82b5_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2941_c40_82b5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_98a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_4420]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c7_eb37]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2942_c7_4814]
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2942_c40_2146]
signal str1_uxn_opcodes_h_l2942_c40_2146_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2942_c40_2146_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2942_c40_2146_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2942_c40_2146_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2942_c40_2146_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2942_c40_2146_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2943_c11_5f4d]
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c1_5826]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c7_612f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2943_c7_eb37]
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2943_c40_0dd0]
signal str2_uxn_opcodes_h_l2943_c40_0dd0_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2943_c40_0dd0_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2943_c40_0dd0_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2943_c40_0dd0_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2943_c40_0dd0_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2943_c40_0dd0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_9104]
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c1_5a64]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c7_a0ea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2944_c7_612f]
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2944_c40_5345]
signal lda_uxn_opcodes_h_l2944_c40_5345_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2944_c40_5345_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2944_c40_5345_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2944_c40_5345_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2944_c40_5345_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2944_c40_5345_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2945_c11_daa0]
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c1_a706]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c7_6310]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2945_c7_a0ea]
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2945_c40_dea4]
signal lda2_uxn_opcodes_h_l2945_c40_dea4_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2945_c40_dea4_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2945_c40_dea4_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2945_c40_dea4_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2945_c40_dea4_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2945_c40_dea4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2946_c11_83ea]
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c1_ca60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c7_94a1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2946_c7_6310]
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2946_c40_9cbd]
signal sta_uxn_opcodes_h_l2946_c40_9cbd_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2946_c40_9cbd_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2946_c40_9cbd_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2946_c40_9cbd_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2946_c40_9cbd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2947_c11_b3eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c1_c367]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c7_ed1d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2947_c7_94a1]
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2947_c40_af8a]
signal sta2_uxn_opcodes_h_l2947_c40_af8a_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2947_c40_af8a_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2947_c40_af8a_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2947_c40_af8a_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2947_c40_af8a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2948_c11_279c]
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c1_56ad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c7_4fed]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2948_c7_ed1d]
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2948_c40_f9b0]
signal dei_uxn_opcodes_h_l2948_c40_f9b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2948_c40_f9b0_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2948_c40_f9b0_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2948_c40_f9b0_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2948_c40_f9b0_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2948_c40_f9b0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2949_c11_1714]
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c1_2cd7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c7_a05d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2949_c7_4fed]
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2949_c40_1259]
signal dei2_uxn_opcodes_h_l2949_c40_1259_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2949_c40_1259_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2949_c40_1259_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2949_c40_1259_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2949_c40_1259_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2949_c40_1259_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2950_c11_897b]
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c1_c354]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c7_6cd2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2950_c7_a05d]
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2950_c40_110f]
signal deo_uxn_opcodes_h_l2950_c40_110f_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2950_c40_110f_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2950_c40_110f_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2950_c40_110f_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2950_c40_110f_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2950_c40_110f_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2950_c40_110f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2951_c11_b41f]
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c1_c8b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c7_b123]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2951_c7_6cd2]
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2951_c40_585a]
signal deo2_uxn_opcodes_h_l2951_c40_585a_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2951_c40_585a_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2951_c40_585a_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2951_c40_585a_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2951_c40_585a_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2951_c40_585a_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2951_c40_585a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_1086]
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c1_b0a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c7_e574]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2952_c7_b123]
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2952_c40_33e5]
signal add_uxn_opcodes_h_l2952_c40_33e5_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2952_c40_33e5_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2952_c40_33e5_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2952_c40_33e5_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2952_c40_33e5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2953_c11_cde1]
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c1_e0b7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c7_2329]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2953_c7_e574]
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2953_c40_ea20]
signal add2_uxn_opcodes_h_l2953_c40_ea20_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2953_c40_ea20_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2953_c40_ea20_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2953_c40_ea20_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2953_c40_ea20_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2954_c11_a3eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c1_c7d8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c7_c74e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2954_c7_2329]
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2954_c40_905d]
signal sub_uxn_opcodes_h_l2954_c40_905d_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2954_c40_905d_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2954_c40_905d_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2954_c40_905d_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2954_c40_905d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2955_c11_661e]
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c1_5978]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c7_427b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2955_c7_c74e]
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2955_c40_135e]
signal sub2_uxn_opcodes_h_l2955_c40_135e_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2955_c40_135e_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2955_c40_135e_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2955_c40_135e_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2955_c40_135e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2956_c11_9f42]
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c1_b6aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c7_0bdd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2956_c7_427b]
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2956_c40_3647]
signal mul_uxn_opcodes_h_l2956_c40_3647_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2956_c40_3647_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2956_c40_3647_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2956_c40_3647_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2956_c40_3647_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2957_c11_84e3]
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c1_48dd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2958_c7_8538]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2957_c7_0bdd]
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2957_c40_08fb]
signal mul2_uxn_opcodes_h_l2957_c40_08fb_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2957_c40_08fb_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2957_c40_08fb_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2957_c40_08fb_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2957_c40_08fb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2958_c11_35b3]
signal BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2958_c1_21a4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2959_c7_867e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2958_c7_8538]
signal opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2958_c40_bcd6]
signal div_uxn_opcodes_h_l2958_c40_bcd6_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2958_c40_bcd6_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2958_c40_bcd6_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2958_c40_bcd6_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2958_c40_bcd6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2959_c11_a747]
signal BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2959_c1_4402]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2960_c7_57d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2959_c7_867e]
signal opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2959_c40_3093]
signal div2_uxn_opcodes_h_l2959_c40_3093_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2959_c40_3093_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2959_c40_3093_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2959_c40_3093_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2959_c40_3093_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2960_c11_3ffe]
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2960_c1_ea86]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2961_c7_8265]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2960_c7_57d6]
signal opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2960_c40_80e8]
signal and_uxn_opcodes_h_l2960_c40_80e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2960_c40_80e8_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2960_c40_80e8_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2960_c40_80e8_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2960_c40_80e8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2961_c11_3963]
signal BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2961_c1_95f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2962_c7_4594]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2961_c7_8265]
signal opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2961_c40_9182]
signal and2_uxn_opcodes_h_l2961_c40_9182_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2961_c40_9182_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2961_c40_9182_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2961_c40_9182_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2961_c40_9182_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2962_c11_b079]
signal BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2962_c1_4d69]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2963_c7_cb36]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2962_c7_4594]
signal opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2962_c40_2e63]
signal ora_uxn_opcodes_h_l2962_c40_2e63_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2962_c40_2e63_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2962_c40_2e63_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2962_c40_2e63_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2962_c40_2e63_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2963_c11_556a]
signal BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2963_c1_b2ed]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2964_c7_2dfb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2963_c7_cb36]
signal opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2963_c40_9410]
signal ora2_uxn_opcodes_h_l2963_c40_9410_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2963_c40_9410_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2963_c40_9410_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2963_c40_9410_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2963_c40_9410_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2964_c11_11e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2964_c1_daa3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2965_c7_aeb8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2964_c7_2dfb]
signal opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2964_c40_3598]
signal eor_uxn_opcodes_h_l2964_c40_3598_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2964_c40_3598_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2964_c40_3598_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2964_c40_3598_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2964_c40_3598_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2965_c11_9059]
signal BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2965_c1_ac59]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2966_c7_821f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2965_c7_aeb8]
signal opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2965_c40_5e36]
signal eor2_uxn_opcodes_h_l2965_c40_5e36_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2965_c40_5e36_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2965_c40_5e36_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2965_c40_5e36_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2965_c40_5e36_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2966_c11_9c0a]
signal BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2966_c1_e03d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2967_c7_592f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2966_c7_821f]
signal opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2966_c40_0188]
signal sft_uxn_opcodes_h_l2966_c40_0188_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2966_c40_0188_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2966_c40_0188_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2966_c40_0188_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2966_c40_0188_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2967_c11_79f8]
signal BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2967_c1_22d2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2967_c7_592f]
signal opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2967_c40_ddea]
signal sft2_uxn_opcodes_h_l2967_c40_ddea_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2967_c40_ddea_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2967_c40_ddea_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2967_c40_ddea_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2967_c40_ddea_return_output : opcode_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l2970_c17_e192]
signal BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_opcodes_h_l2970_c17_9008]
signal CONST_SR_6_uxn_opcodes_h_l2970_c17_9008_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2970_c17_9008_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2971_c2_e031]
signal BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2973_c2_10c6]
signal sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2973_c2_10c6]
signal sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2974_c3_804f]
signal BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2976_c3_f6ea]
signal BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2979_c29_6a21]
signal MUX_uxn_opcodes_h_l2979_c29_6a21_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2979_c29_6a21_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2979_c29_6a21_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2979_c29_6a21_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2979_c19_e166]
signal BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2980_c20_bbc7]
signal MUX_uxn_opcodes_h_l2980_c20_bbc7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2980_c20_bbc7_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2980_c20_bbc7_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2980_c20_bbc7_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2980_c2_0594]
signal BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_left : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_return_output : unsigned(9 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2982_c24_260d]
signal stack_ram_update_uxn_opcodes_h_l2982_c24_260d_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2982_c24_260d_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2982_c24_260d_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2982_c24_260d_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2982_c24_260d_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2
BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_left,
BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_right,
BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479
BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_left,
BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_right,
BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd
BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_left,
BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_right,
BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a
UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a
BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_left,
BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_right,
BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_return_output);

-- MUX_uxn_opcodes_h_l2891_c14_63b8
MUX_uxn_opcodes_h_l2891_c14_63b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2891_c14_63b8_cond,
MUX_uxn_opcodes_h_l2891_c14_63b8_iftrue,
MUX_uxn_opcodes_h_l2891_c14_63b8_iffalse,
MUX_uxn_opcodes_h_l2891_c14_63b8_return_output);

-- MUX_uxn_opcodes_h_l2892_c8_7270
MUX_uxn_opcodes_h_l2892_c8_7270 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2892_c8_7270_cond,
MUX_uxn_opcodes_h_l2892_c8_7270_iftrue,
MUX_uxn_opcodes_h_l2892_c8_7270_iffalse,
MUX_uxn_opcodes_h_l2892_c8_7270_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776
BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4
is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_cond,
is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_iftrue,
is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_iffalse,
is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4
opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output);

-- brk_uxn_opcodes_h_l2898_c48_8b7c
brk_uxn_opcodes_h_l2898_c48_8b7c : entity work.brk_0CLK_36723c85 port map (
clk,
brk_uxn_opcodes_h_l2898_c48_8b7c_CLOCK_ENABLE,
brk_uxn_opcodes_h_l2898_c48_8b7c_phase,
brk_uxn_opcodes_h_l2898_c48_8b7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac
opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output);

-- jci_uxn_opcodes_h_l2899_c40_31a9
jci_uxn_opcodes_h_l2899_c40_31a9 : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2899_c40_31a9_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2899_c40_31a9_phase,
jci_uxn_opcodes_h_l2899_c40_31a9_pc,
jci_uxn_opcodes_h_l2899_c40_31a9_previous_stack_read,
jci_uxn_opcodes_h_l2899_c40_31a9_previous_ram_read,
jci_uxn_opcodes_h_l2899_c40_31a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6
opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output);

-- jmi_uxn_opcodes_h_l2900_c40_10d8
jmi_uxn_opcodes_h_l2900_c40_10d8 : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2900_c40_10d8_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2900_c40_10d8_phase,
jmi_uxn_opcodes_h_l2900_c40_10d8_pc,
jmi_uxn_opcodes_h_l2900_c40_10d8_previous_ram_read,
jmi_uxn_opcodes_h_l2900_c40_10d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52
opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output);

-- jsi_uxn_opcodes_h_l2901_c40_6acd
jsi_uxn_opcodes_h_l2901_c40_6acd : entity work.jsi_0CLK_1c7b7172 port map (
clk,
jsi_uxn_opcodes_h_l2901_c40_6acd_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2901_c40_6acd_phase,
jsi_uxn_opcodes_h_l2901_c40_6acd_pc,
jsi_uxn_opcodes_h_l2901_c40_6acd_previous_ram_read,
jsi_uxn_opcodes_h_l2901_c40_6acd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_2123
opc_result_MUX_uxn_opcodes_h_l2902_c7_2123 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_return_output);

-- lit_uxn_opcodes_h_l2902_c40_1a75
lit_uxn_opcodes_h_l2902_c40_1a75 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2902_c40_1a75_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2902_c40_1a75_phase,
lit_uxn_opcodes_h_l2902_c40_1a75_pc,
lit_uxn_opcodes_h_l2902_c40_1a75_previous_ram_read,
lit_uxn_opcodes_h_l2902_c40_1a75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c
opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output);

-- lit2_uxn_opcodes_h_l2903_c40_0aac
lit2_uxn_opcodes_h_l2903_c40_0aac : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2903_c40_0aac_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2903_c40_0aac_phase,
lit2_uxn_opcodes_h_l2903_c40_0aac_pc,
lit2_uxn_opcodes_h_l2903_c40_0aac_previous_ram_read,
lit2_uxn_opcodes_h_l2903_c40_0aac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e
opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output);

-- lit_uxn_opcodes_h_l2904_c40_bb0d
lit_uxn_opcodes_h_l2904_c40_bb0d : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2904_c40_bb0d_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2904_c40_bb0d_phase,
lit_uxn_opcodes_h_l2904_c40_bb0d_pc,
lit_uxn_opcodes_h_l2904_c40_bb0d_previous_ram_read,
lit_uxn_opcodes_h_l2904_c40_bb0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c
opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output);

-- lit2_uxn_opcodes_h_l2905_c40_3560
lit2_uxn_opcodes_h_l2905_c40_3560 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2905_c40_3560_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2905_c40_3560_phase,
lit2_uxn_opcodes_h_l2905_c40_3560_pc,
lit2_uxn_opcodes_h_l2905_c40_3560_previous_ram_read,
lit2_uxn_opcodes_h_l2905_c40_3560_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_5365
opc_result_MUX_uxn_opcodes_h_l2906_c7_5365 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_return_output);

-- inc_uxn_opcodes_h_l2906_c40_7459
inc_uxn_opcodes_h_l2906_c40_7459 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2906_c40_7459_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2906_c40_7459_phase,
inc_uxn_opcodes_h_l2906_c40_7459_ins,
inc_uxn_opcodes_h_l2906_c40_7459_previous_stack_read,
inc_uxn_opcodes_h_l2906_c40_7459_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_5799
opc_result_MUX_uxn_opcodes_h_l2907_c7_5799 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_return_output);

-- inc2_uxn_opcodes_h_l2907_c40_9b91
inc2_uxn_opcodes_h_l2907_c40_9b91 : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2907_c40_9b91_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2907_c40_9b91_phase,
inc2_uxn_opcodes_h_l2907_c40_9b91_ins,
inc2_uxn_opcodes_h_l2907_c40_9b91_previous_stack_read,
inc2_uxn_opcodes_h_l2907_c40_9b91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2
opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output);

-- pop_uxn_opcodes_h_l2908_c40_178d
pop_uxn_opcodes_h_l2908_c40_178d : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2908_c40_178d_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2908_c40_178d_phase,
pop_uxn_opcodes_h_l2908_c40_178d_ins,
pop_uxn_opcodes_h_l2908_c40_178d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68
opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output);

-- pop2_uxn_opcodes_h_l2909_c40_936e
pop2_uxn_opcodes_h_l2909_c40_936e : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2909_c40_936e_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2909_c40_936e_phase,
pop2_uxn_opcodes_h_l2909_c40_936e_ins,
pop2_uxn_opcodes_h_l2909_c40_936e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3
opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output);

-- nip_uxn_opcodes_h_l2910_c40_8853
nip_uxn_opcodes_h_l2910_c40_8853 : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2910_c40_8853_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2910_c40_8853_phase,
nip_uxn_opcodes_h_l2910_c40_8853_ins,
nip_uxn_opcodes_h_l2910_c40_8853_previous_stack_read,
nip_uxn_opcodes_h_l2910_c40_8853_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_858f
opc_result_MUX_uxn_opcodes_h_l2911_c7_858f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_return_output);

-- nip2_uxn_opcodes_h_l2911_c40_dade
nip2_uxn_opcodes_h_l2911_c40_dade : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2911_c40_dade_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2911_c40_dade_phase,
nip2_uxn_opcodes_h_l2911_c40_dade_ins,
nip2_uxn_opcodes_h_l2911_c40_dade_previous_stack_read,
nip2_uxn_opcodes_h_l2911_c40_dade_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75
opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output);

-- swp_uxn_opcodes_h_l2912_c40_8924
swp_uxn_opcodes_h_l2912_c40_8924 : entity work.swp_0CLK_85d5529e port map (
clk,
swp_uxn_opcodes_h_l2912_c40_8924_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2912_c40_8924_phase,
swp_uxn_opcodes_h_l2912_c40_8924_ins,
swp_uxn_opcodes_h_l2912_c40_8924_previous_stack_read,
swp_uxn_opcodes_h_l2912_c40_8924_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_7984
opc_result_MUX_uxn_opcodes_h_l2913_c7_7984 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_return_output);

-- swp2_uxn_opcodes_h_l2913_c40_e2fe
swp2_uxn_opcodes_h_l2913_c40_e2fe : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2913_c40_e2fe_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2913_c40_e2fe_phase,
swp2_uxn_opcodes_h_l2913_c40_e2fe_ins,
swp2_uxn_opcodes_h_l2913_c40_e2fe_previous_stack_read,
swp2_uxn_opcodes_h_l2913_c40_e2fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_0291
opc_result_MUX_uxn_opcodes_h_l2914_c7_0291 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_return_output);

-- rot_uxn_opcodes_h_l2914_c40_dbf6
rot_uxn_opcodes_h_l2914_c40_dbf6 : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2914_c40_dbf6_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2914_c40_dbf6_phase,
rot_uxn_opcodes_h_l2914_c40_dbf6_ins,
rot_uxn_opcodes_h_l2914_c40_dbf6_previous_stack_read,
rot_uxn_opcodes_h_l2914_c40_dbf6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_7955
opc_result_MUX_uxn_opcodes_h_l2915_c7_7955 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_return_output);

-- rot2_uxn_opcodes_h_l2915_c40_de75
rot2_uxn_opcodes_h_l2915_c40_de75 : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2915_c40_de75_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2915_c40_de75_phase,
rot2_uxn_opcodes_h_l2915_c40_de75_ins,
rot2_uxn_opcodes_h_l2915_c40_de75_previous_stack_read,
rot2_uxn_opcodes_h_l2915_c40_de75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1
opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output);

-- dup_uxn_opcodes_h_l2916_c40_f52b
dup_uxn_opcodes_h_l2916_c40_f52b : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2916_c40_f52b_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2916_c40_f52b_phase,
dup_uxn_opcodes_h_l2916_c40_f52b_ins,
dup_uxn_opcodes_h_l2916_c40_f52b_previous_stack_read,
dup_uxn_opcodes_h_l2916_c40_f52b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d
opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output);

-- dup2_uxn_opcodes_h_l2917_c40_abf0
dup2_uxn_opcodes_h_l2917_c40_abf0 : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2917_c40_abf0_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2917_c40_abf0_phase,
dup2_uxn_opcodes_h_l2917_c40_abf0_ins,
dup2_uxn_opcodes_h_l2917_c40_abf0_previous_stack_read,
dup2_uxn_opcodes_h_l2917_c40_abf0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16
opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output);

-- ovr_uxn_opcodes_h_l2918_c40_63e9
ovr_uxn_opcodes_h_l2918_c40_63e9 : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2918_c40_63e9_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2918_c40_63e9_phase,
ovr_uxn_opcodes_h_l2918_c40_63e9_ins,
ovr_uxn_opcodes_h_l2918_c40_63e9_previous_stack_read,
ovr_uxn_opcodes_h_l2918_c40_63e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47
opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output);

-- ovr2_uxn_opcodes_h_l2919_c40_d8a9
ovr2_uxn_opcodes_h_l2919_c40_d8a9 : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2919_c40_d8a9_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2919_c40_d8a9_phase,
ovr2_uxn_opcodes_h_l2919_c40_d8a9_ins,
ovr2_uxn_opcodes_h_l2919_c40_d8a9_previous_stack_read,
ovr2_uxn_opcodes_h_l2919_c40_d8a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf
opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output);

-- equ_uxn_opcodes_h_l2920_c40_0cc5
equ_uxn_opcodes_h_l2920_c40_0cc5 : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2920_c40_0cc5_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2920_c40_0cc5_phase,
equ_uxn_opcodes_h_l2920_c40_0cc5_ins,
equ_uxn_opcodes_h_l2920_c40_0cc5_previous_stack_read,
equ_uxn_opcodes_h_l2920_c40_0cc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19
opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output);

-- equ2_uxn_opcodes_h_l2921_c40_42af
equ2_uxn_opcodes_h_l2921_c40_42af : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2921_c40_42af_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2921_c40_42af_phase,
equ2_uxn_opcodes_h_l2921_c40_42af_ins,
equ2_uxn_opcodes_h_l2921_c40_42af_previous_stack_read,
equ2_uxn_opcodes_h_l2921_c40_42af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4
opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output);

-- neq_uxn_opcodes_h_l2922_c40_e9b6
neq_uxn_opcodes_h_l2922_c40_e9b6 : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2922_c40_e9b6_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2922_c40_e9b6_phase,
neq_uxn_opcodes_h_l2922_c40_e9b6_ins,
neq_uxn_opcodes_h_l2922_c40_e9b6_previous_stack_read,
neq_uxn_opcodes_h_l2922_c40_e9b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_611c
opc_result_MUX_uxn_opcodes_h_l2923_c7_611c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_return_output);

-- neq2_uxn_opcodes_h_l2923_c40_625e
neq2_uxn_opcodes_h_l2923_c40_625e : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2923_c40_625e_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2923_c40_625e_phase,
neq2_uxn_opcodes_h_l2923_c40_625e_ins,
neq2_uxn_opcodes_h_l2923_c40_625e_previous_stack_read,
neq2_uxn_opcodes_h_l2923_c40_625e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd
opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output);

-- gth_uxn_opcodes_h_l2924_c40_0b12
gth_uxn_opcodes_h_l2924_c40_0b12 : entity work.gth_0CLK_226c8821 port map (
clk,
gth_uxn_opcodes_h_l2924_c40_0b12_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2924_c40_0b12_phase,
gth_uxn_opcodes_h_l2924_c40_0b12_ins,
gth_uxn_opcodes_h_l2924_c40_0b12_previous_stack_read,
gth_uxn_opcodes_h_l2924_c40_0b12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5
opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output);

-- gth2_uxn_opcodes_h_l2925_c40_6441
gth2_uxn_opcodes_h_l2925_c40_6441 : entity work.gth2_0CLK_609876da port map (
clk,
gth2_uxn_opcodes_h_l2925_c40_6441_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2925_c40_6441_phase,
gth2_uxn_opcodes_h_l2925_c40_6441_ins,
gth2_uxn_opcodes_h_l2925_c40_6441_previous_stack_read,
gth2_uxn_opcodes_h_l2925_c40_6441_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_710b
opc_result_MUX_uxn_opcodes_h_l2926_c7_710b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_return_output);

-- lth_uxn_opcodes_h_l2926_c40_53ad
lth_uxn_opcodes_h_l2926_c40_53ad : entity work.lth_0CLK_226c8821 port map (
clk,
lth_uxn_opcodes_h_l2926_c40_53ad_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2926_c40_53ad_phase,
lth_uxn_opcodes_h_l2926_c40_53ad_ins,
lth_uxn_opcodes_h_l2926_c40_53ad_previous_stack_read,
lth_uxn_opcodes_h_l2926_c40_53ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72
opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output);

-- lth2_uxn_opcodes_h_l2927_c40_cca9
lth2_uxn_opcodes_h_l2927_c40_cca9 : entity work.lth2_0CLK_609876da port map (
clk,
lth2_uxn_opcodes_h_l2927_c40_cca9_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2927_c40_cca9_phase,
lth2_uxn_opcodes_h_l2927_c40_cca9_ins,
lth2_uxn_opcodes_h_l2927_c40_cca9_previous_stack_read,
lth2_uxn_opcodes_h_l2927_c40_cca9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c
opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output);

-- jmp_uxn_opcodes_h_l2928_c40_8508
jmp_uxn_opcodes_h_l2928_c40_8508 : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2928_c40_8508_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2928_c40_8508_phase,
jmp_uxn_opcodes_h_l2928_c40_8508_ins,
jmp_uxn_opcodes_h_l2928_c40_8508_pc,
jmp_uxn_opcodes_h_l2928_c40_8508_previous_stack_read,
jmp_uxn_opcodes_h_l2928_c40_8508_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6
opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output);

-- jmp2_uxn_opcodes_h_l2929_c40_589f
jmp2_uxn_opcodes_h_l2929_c40_589f : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2929_c40_589f_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2929_c40_589f_phase,
jmp2_uxn_opcodes_h_l2929_c40_589f_ins,
jmp2_uxn_opcodes_h_l2929_c40_589f_previous_stack_read,
jmp2_uxn_opcodes_h_l2929_c40_589f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d
opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output);

-- jcn_uxn_opcodes_h_l2930_c40_d383
jcn_uxn_opcodes_h_l2930_c40_d383 : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2930_c40_d383_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2930_c40_d383_phase,
jcn_uxn_opcodes_h_l2930_c40_d383_ins,
jcn_uxn_opcodes_h_l2930_c40_d383_pc,
jcn_uxn_opcodes_h_l2930_c40_d383_previous_stack_read,
jcn_uxn_opcodes_h_l2930_c40_d383_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_522d
opc_result_MUX_uxn_opcodes_h_l2931_c7_522d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_return_output);

-- jcn2_uxn_opcodes_h_l2931_c40_0032
jcn2_uxn_opcodes_h_l2931_c40_0032 : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2931_c40_0032_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2931_c40_0032_phase,
jcn2_uxn_opcodes_h_l2931_c40_0032_ins,
jcn2_uxn_opcodes_h_l2931_c40_0032_previous_stack_read,
jcn2_uxn_opcodes_h_l2931_c40_0032_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_5530
opc_result_MUX_uxn_opcodes_h_l2932_c7_5530 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_return_output);

-- jsr_uxn_opcodes_h_l2932_c40_8038
jsr_uxn_opcodes_h_l2932_c40_8038 : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2932_c40_8038_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2932_c40_8038_phase,
jsr_uxn_opcodes_h_l2932_c40_8038_ins,
jsr_uxn_opcodes_h_l2932_c40_8038_pc,
jsr_uxn_opcodes_h_l2932_c40_8038_previous_stack_read,
jsr_uxn_opcodes_h_l2932_c40_8038_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_4281
opc_result_MUX_uxn_opcodes_h_l2933_c7_4281 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_return_output);

-- jsr2_uxn_opcodes_h_l2933_c40_7f03
jsr2_uxn_opcodes_h_l2933_c40_7f03 : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2933_c40_7f03_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2933_c40_7f03_phase,
jsr2_uxn_opcodes_h_l2933_c40_7f03_ins,
jsr2_uxn_opcodes_h_l2933_c40_7f03_pc,
jsr2_uxn_opcodes_h_l2933_c40_7f03_previous_stack_read,
jsr2_uxn_opcodes_h_l2933_c40_7f03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6
opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output);

-- sth_uxn_opcodes_h_l2934_c40_883e
sth_uxn_opcodes_h_l2934_c40_883e : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2934_c40_883e_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2934_c40_883e_phase,
sth_uxn_opcodes_h_l2934_c40_883e_ins,
sth_uxn_opcodes_h_l2934_c40_883e_previous_stack_read,
sth_uxn_opcodes_h_l2934_c40_883e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0
opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output);

-- sth2_uxn_opcodes_h_l2935_c40_7013
sth2_uxn_opcodes_h_l2935_c40_7013 : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2935_c40_7013_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2935_c40_7013_phase,
sth2_uxn_opcodes_h_l2935_c40_7013_ins,
sth2_uxn_opcodes_h_l2935_c40_7013_previous_stack_read,
sth2_uxn_opcodes_h_l2935_c40_7013_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61
opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output);

-- ldz_uxn_opcodes_h_l2936_c40_1d9e
ldz_uxn_opcodes_h_l2936_c40_1d9e : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2936_c40_1d9e_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2936_c40_1d9e_phase,
ldz_uxn_opcodes_h_l2936_c40_1d9e_ins,
ldz_uxn_opcodes_h_l2936_c40_1d9e_previous_stack_read,
ldz_uxn_opcodes_h_l2936_c40_1d9e_previous_ram_read,
ldz_uxn_opcodes_h_l2936_c40_1d9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03
opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output);

-- ldz2_uxn_opcodes_h_l2937_c40_15c0
ldz2_uxn_opcodes_h_l2937_c40_15c0 : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2937_c40_15c0_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2937_c40_15c0_phase,
ldz2_uxn_opcodes_h_l2937_c40_15c0_ins,
ldz2_uxn_opcodes_h_l2937_c40_15c0_previous_stack_read,
ldz2_uxn_opcodes_h_l2937_c40_15c0_previous_ram_read,
ldz2_uxn_opcodes_h_l2937_c40_15c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d
opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output);

-- stz_uxn_opcodes_h_l2938_c40_0e71
stz_uxn_opcodes_h_l2938_c40_0e71 : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2938_c40_0e71_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2938_c40_0e71_phase,
stz_uxn_opcodes_h_l2938_c40_0e71_ins,
stz_uxn_opcodes_h_l2938_c40_0e71_previous_stack_read,
stz_uxn_opcodes_h_l2938_c40_0e71_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07
opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output);

-- stz2_uxn_opcodes_h_l2939_c40_e402
stz2_uxn_opcodes_h_l2939_c40_e402 : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2939_c40_e402_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2939_c40_e402_phase,
stz2_uxn_opcodes_h_l2939_c40_e402_ins,
stz2_uxn_opcodes_h_l2939_c40_e402_previous_stack_read,
stz2_uxn_opcodes_h_l2939_c40_e402_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a
opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output);

-- ldr_uxn_opcodes_h_l2940_c40_af57
ldr_uxn_opcodes_h_l2940_c40_af57 : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2940_c40_af57_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2940_c40_af57_phase,
ldr_uxn_opcodes_h_l2940_c40_af57_ins,
ldr_uxn_opcodes_h_l2940_c40_af57_pc,
ldr_uxn_opcodes_h_l2940_c40_af57_previous_stack_read,
ldr_uxn_opcodes_h_l2940_c40_af57_previous_ram_read,
ldr_uxn_opcodes_h_l2940_c40_af57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb
opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_cond,
opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output);

-- ldr2_uxn_opcodes_h_l2941_c40_82b5
ldr2_uxn_opcodes_h_l2941_c40_82b5 : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2941_c40_82b5_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2941_c40_82b5_phase,
ldr2_uxn_opcodes_h_l2941_c40_82b5_ins,
ldr2_uxn_opcodes_h_l2941_c40_82b5_pc,
ldr2_uxn_opcodes_h_l2941_c40_82b5_previous_stack_read,
ldr2_uxn_opcodes_h_l2941_c40_82b5_previous_ram_read,
ldr2_uxn_opcodes_h_l2941_c40_82b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2942_c7_4814
opc_result_MUX_uxn_opcodes_h_l2942_c7_4814 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_cond,
opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_iftrue,
opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_iffalse,
opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_return_output);

-- str1_uxn_opcodes_h_l2942_c40_2146
str1_uxn_opcodes_h_l2942_c40_2146 : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2942_c40_2146_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2942_c40_2146_phase,
str1_uxn_opcodes_h_l2942_c40_2146_ins,
str1_uxn_opcodes_h_l2942_c40_2146_pc,
str1_uxn_opcodes_h_l2942_c40_2146_previous_stack_read,
str1_uxn_opcodes_h_l2942_c40_2146_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_left,
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_right,
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37
opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_cond,
opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_iftrue,
opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_iffalse,
opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output);

-- str2_uxn_opcodes_h_l2943_c40_0dd0
str2_uxn_opcodes_h_l2943_c40_0dd0 : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2943_c40_0dd0_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2943_c40_0dd0_phase,
str2_uxn_opcodes_h_l2943_c40_0dd0_ins,
str2_uxn_opcodes_h_l2943_c40_0dd0_pc,
str2_uxn_opcodes_h_l2943_c40_0dd0_previous_stack_read,
str2_uxn_opcodes_h_l2943_c40_0dd0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_left,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_right,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2944_c7_612f
opc_result_MUX_uxn_opcodes_h_l2944_c7_612f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_cond,
opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_return_output);

-- lda_uxn_opcodes_h_l2944_c40_5345
lda_uxn_opcodes_h_l2944_c40_5345 : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2944_c40_5345_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2944_c40_5345_phase,
lda_uxn_opcodes_h_l2944_c40_5345_ins,
lda_uxn_opcodes_h_l2944_c40_5345_previous_stack_read,
lda_uxn_opcodes_h_l2944_c40_5345_previous_ram_read,
lda_uxn_opcodes_h_l2944_c40_5345_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_left,
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_right,
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea
opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_cond,
opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_iftrue,
opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_iffalse,
opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output);

-- lda2_uxn_opcodes_h_l2945_c40_dea4
lda2_uxn_opcodes_h_l2945_c40_dea4 : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2945_c40_dea4_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2945_c40_dea4_phase,
lda2_uxn_opcodes_h_l2945_c40_dea4_ins,
lda2_uxn_opcodes_h_l2945_c40_dea4_previous_stack_read,
lda2_uxn_opcodes_h_l2945_c40_dea4_previous_ram_read,
lda2_uxn_opcodes_h_l2945_c40_dea4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_left,
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_right,
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2946_c7_6310
opc_result_MUX_uxn_opcodes_h_l2946_c7_6310 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_cond,
opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_iftrue,
opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_iffalse,
opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_return_output);

-- sta_uxn_opcodes_h_l2946_c40_9cbd
sta_uxn_opcodes_h_l2946_c40_9cbd : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2946_c40_9cbd_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2946_c40_9cbd_phase,
sta_uxn_opcodes_h_l2946_c40_9cbd_ins,
sta_uxn_opcodes_h_l2946_c40_9cbd_previous_stack_read,
sta_uxn_opcodes_h_l2946_c40_9cbd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1
opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_cond,
opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output);

-- sta2_uxn_opcodes_h_l2947_c40_af8a
sta2_uxn_opcodes_h_l2947_c40_af8a : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2947_c40_af8a_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2947_c40_af8a_phase,
sta2_uxn_opcodes_h_l2947_c40_af8a_ins,
sta2_uxn_opcodes_h_l2947_c40_af8a_previous_stack_read,
sta2_uxn_opcodes_h_l2947_c40_af8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_left,
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_right,
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d
opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_cond,
opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output);

-- dei_uxn_opcodes_h_l2948_c40_f9b0
dei_uxn_opcodes_h_l2948_c40_f9b0 : entity work.dei_0CLK_2a8f2cfd port map (
clk,
dei_uxn_opcodes_h_l2948_c40_f9b0_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2948_c40_f9b0_phase,
dei_uxn_opcodes_h_l2948_c40_f9b0_ins,
dei_uxn_opcodes_h_l2948_c40_f9b0_previous_stack_read,
dei_uxn_opcodes_h_l2948_c40_f9b0_previous_device_ram_read,
dei_uxn_opcodes_h_l2948_c40_f9b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_left,
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_right,
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed
opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_cond,
opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_iftrue,
opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_iffalse,
opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output);

-- dei2_uxn_opcodes_h_l2949_c40_1259
dei2_uxn_opcodes_h_l2949_c40_1259 : entity work.dei2_0CLK_5016892b port map (
clk,
dei2_uxn_opcodes_h_l2949_c40_1259_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2949_c40_1259_phase,
dei2_uxn_opcodes_h_l2949_c40_1259_ins,
dei2_uxn_opcodes_h_l2949_c40_1259_previous_stack_read,
dei2_uxn_opcodes_h_l2949_c40_1259_previous_device_ram_read,
dei2_uxn_opcodes_h_l2949_c40_1259_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_left,
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_right,
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d
opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_cond,
opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output);

-- deo_uxn_opcodes_h_l2950_c40_110f
deo_uxn_opcodes_h_l2950_c40_110f : entity work.deo_0CLK_0e8b4c5e port map (
clk,
deo_uxn_opcodes_h_l2950_c40_110f_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2950_c40_110f_phase,
deo_uxn_opcodes_h_l2950_c40_110f_ins,
deo_uxn_opcodes_h_l2950_c40_110f_previous_stack_read,
deo_uxn_opcodes_h_l2950_c40_110f_previous_device_ram_read,
deo_uxn_opcodes_h_l2950_c40_110f_previous_ram_read,
deo_uxn_opcodes_h_l2950_c40_110f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_left,
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_right,
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2
opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_cond,
opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output);

-- deo2_uxn_opcodes_h_l2951_c40_585a
deo2_uxn_opcodes_h_l2951_c40_585a : entity work.deo2_0CLK_1477f047 port map (
clk,
deo2_uxn_opcodes_h_l2951_c40_585a_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2951_c40_585a_phase,
deo2_uxn_opcodes_h_l2951_c40_585a_ins,
deo2_uxn_opcodes_h_l2951_c40_585a_previous_stack_read,
deo2_uxn_opcodes_h_l2951_c40_585a_previous_device_ram_read,
deo2_uxn_opcodes_h_l2951_c40_585a_previous_ram_read,
deo2_uxn_opcodes_h_l2951_c40_585a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_left,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_right,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2952_c7_b123
opc_result_MUX_uxn_opcodes_h_l2952_c7_b123 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_cond,
opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_iftrue,
opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_iffalse,
opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_return_output);

-- add_uxn_opcodes_h_l2952_c40_33e5
add_uxn_opcodes_h_l2952_c40_33e5 : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2952_c40_33e5_CLOCK_ENABLE,
add_uxn_opcodes_h_l2952_c40_33e5_phase,
add_uxn_opcodes_h_l2952_c40_33e5_ins,
add_uxn_opcodes_h_l2952_c40_33e5_previous_stack_read,
add_uxn_opcodes_h_l2952_c40_33e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_left,
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_right,
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2953_c7_e574
opc_result_MUX_uxn_opcodes_h_l2953_c7_e574 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_cond,
opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_iftrue,
opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_iffalse,
opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_return_output);

-- add2_uxn_opcodes_h_l2953_c40_ea20
add2_uxn_opcodes_h_l2953_c40_ea20 : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2953_c40_ea20_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2953_c40_ea20_phase,
add2_uxn_opcodes_h_l2953_c40_ea20_ins,
add2_uxn_opcodes_h_l2953_c40_ea20_previous_stack_read,
add2_uxn_opcodes_h_l2953_c40_ea20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2954_c7_2329
opc_result_MUX_uxn_opcodes_h_l2954_c7_2329 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_cond,
opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_iftrue,
opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_iffalse,
opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_return_output);

-- sub_uxn_opcodes_h_l2954_c40_905d
sub_uxn_opcodes_h_l2954_c40_905d : entity work.sub_0CLK_64d180f1 port map (
clk,
sub_uxn_opcodes_h_l2954_c40_905d_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2954_c40_905d_phase,
sub_uxn_opcodes_h_l2954_c40_905d_ins,
sub_uxn_opcodes_h_l2954_c40_905d_previous_stack_read,
sub_uxn_opcodes_h_l2954_c40_905d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_left,
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_right,
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e
opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_cond,
opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output);

-- sub2_uxn_opcodes_h_l2955_c40_135e
sub2_uxn_opcodes_h_l2955_c40_135e : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2955_c40_135e_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2955_c40_135e_phase,
sub2_uxn_opcodes_h_l2955_c40_135e_ins,
sub2_uxn_opcodes_h_l2955_c40_135e_previous_stack_read,
sub2_uxn_opcodes_h_l2955_c40_135e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_left,
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_right,
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2956_c7_427b
opc_result_MUX_uxn_opcodes_h_l2956_c7_427b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_cond,
opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_return_output);

-- mul_uxn_opcodes_h_l2956_c40_3647
mul_uxn_opcodes_h_l2956_c40_3647 : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2956_c40_3647_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2956_c40_3647_phase,
mul_uxn_opcodes_h_l2956_c40_3647_ins,
mul_uxn_opcodes_h_l2956_c40_3647_previous_stack_read,
mul_uxn_opcodes_h_l2956_c40_3647_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_left,
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_right,
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd
opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_cond,
opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output);

-- mul2_uxn_opcodes_h_l2957_c40_08fb
mul2_uxn_opcodes_h_l2957_c40_08fb : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2957_c40_08fb_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2957_c40_08fb_phase,
mul2_uxn_opcodes_h_l2957_c40_08fb_ins,
mul2_uxn_opcodes_h_l2957_c40_08fb_previous_stack_read,
mul2_uxn_opcodes_h_l2957_c40_08fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3
BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_left,
BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_right,
BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2958_c7_8538
opc_result_MUX_uxn_opcodes_h_l2958_c7_8538 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_cond,
opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_iftrue,
opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_iffalse,
opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_return_output);

-- div_uxn_opcodes_h_l2958_c40_bcd6
div_uxn_opcodes_h_l2958_c40_bcd6 : entity work.div_0CLK_09f6f009 port map (
clk,
div_uxn_opcodes_h_l2958_c40_bcd6_CLOCK_ENABLE,
div_uxn_opcodes_h_l2958_c40_bcd6_phase,
div_uxn_opcodes_h_l2958_c40_bcd6_ins,
div_uxn_opcodes_h_l2958_c40_bcd6_previous_stack_read,
div_uxn_opcodes_h_l2958_c40_bcd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747
BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_left,
BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_right,
BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2959_c7_867e
opc_result_MUX_uxn_opcodes_h_l2959_c7_867e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_cond,
opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_return_output);

-- div2_uxn_opcodes_h_l2959_c40_3093
div2_uxn_opcodes_h_l2959_c40_3093 : entity work.div2_0CLK_7cf9dac2 port map (
clk,
div2_uxn_opcodes_h_l2959_c40_3093_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2959_c40_3093_phase,
div2_uxn_opcodes_h_l2959_c40_3093_ins,
div2_uxn_opcodes_h_l2959_c40_3093_previous_stack_read,
div2_uxn_opcodes_h_l2959_c40_3093_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_left,
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_right,
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6
opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_cond,
opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output);

-- and_uxn_opcodes_h_l2960_c40_80e8
and_uxn_opcodes_h_l2960_c40_80e8 : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2960_c40_80e8_CLOCK_ENABLE,
and_uxn_opcodes_h_l2960_c40_80e8_phase,
and_uxn_opcodes_h_l2960_c40_80e8_ins,
and_uxn_opcodes_h_l2960_c40_80e8_previous_stack_read,
and_uxn_opcodes_h_l2960_c40_80e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963
BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_left,
BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_right,
BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2961_c7_8265
opc_result_MUX_uxn_opcodes_h_l2961_c7_8265 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_cond,
opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_iftrue,
opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_iffalse,
opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_return_output);

-- and2_uxn_opcodes_h_l2961_c40_9182
and2_uxn_opcodes_h_l2961_c40_9182 : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2961_c40_9182_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2961_c40_9182_phase,
and2_uxn_opcodes_h_l2961_c40_9182_ins,
and2_uxn_opcodes_h_l2961_c40_9182_previous_stack_read,
and2_uxn_opcodes_h_l2961_c40_9182_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079
BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_left,
BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_right,
BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2962_c7_4594
opc_result_MUX_uxn_opcodes_h_l2962_c7_4594 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_cond,
opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_iftrue,
opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_iffalse,
opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_return_output);

-- ora_uxn_opcodes_h_l2962_c40_2e63
ora_uxn_opcodes_h_l2962_c40_2e63 : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2962_c40_2e63_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2962_c40_2e63_phase,
ora_uxn_opcodes_h_l2962_c40_2e63_ins,
ora_uxn_opcodes_h_l2962_c40_2e63_previous_stack_read,
ora_uxn_opcodes_h_l2962_c40_2e63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a
BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_left,
BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_right,
BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36
opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_cond,
opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_iftrue,
opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_iffalse,
opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output);

-- ora2_uxn_opcodes_h_l2963_c40_9410
ora2_uxn_opcodes_h_l2963_c40_9410 : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2963_c40_9410_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2963_c40_9410_phase,
ora2_uxn_opcodes_h_l2963_c40_9410_ins,
ora2_uxn_opcodes_h_l2963_c40_9410_previous_stack_read,
ora2_uxn_opcodes_h_l2963_c40_9410_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0
BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb
opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_cond,
opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output);

-- eor_uxn_opcodes_h_l2964_c40_3598
eor_uxn_opcodes_h_l2964_c40_3598 : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2964_c40_3598_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2964_c40_3598_phase,
eor_uxn_opcodes_h_l2964_c40_3598_ins,
eor_uxn_opcodes_h_l2964_c40_3598_previous_stack_read,
eor_uxn_opcodes_h_l2964_c40_3598_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059
BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_left,
BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_right,
BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8
opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_cond,
opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output);

-- eor2_uxn_opcodes_h_l2965_c40_5e36
eor2_uxn_opcodes_h_l2965_c40_5e36 : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2965_c40_5e36_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2965_c40_5e36_phase,
eor2_uxn_opcodes_h_l2965_c40_5e36_ins,
eor2_uxn_opcodes_h_l2965_c40_5e36_previous_stack_read,
eor2_uxn_opcodes_h_l2965_c40_5e36_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a
BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_left,
BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_right,
BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2966_c7_821f
opc_result_MUX_uxn_opcodes_h_l2966_c7_821f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_cond,
opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_return_output);

-- sft_uxn_opcodes_h_l2966_c40_0188
sft_uxn_opcodes_h_l2966_c40_0188 : entity work.sft_0CLK_46cced44 port map (
clk,
sft_uxn_opcodes_h_l2966_c40_0188_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2966_c40_0188_phase,
sft_uxn_opcodes_h_l2966_c40_0188_ins,
sft_uxn_opcodes_h_l2966_c40_0188_previous_stack_read,
sft_uxn_opcodes_h_l2966_c40_0188_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_left,
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_right,
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2967_c7_592f
opc_result_MUX_uxn_opcodes_h_l2967_c7_592f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_cond,
opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_return_output);

-- sft2_uxn_opcodes_h_l2967_c40_ddea
sft2_uxn_opcodes_h_l2967_c40_ddea : entity work.sft2_0CLK_e8b37bfc port map (
clk,
sft2_uxn_opcodes_h_l2967_c40_ddea_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2967_c40_ddea_phase,
sft2_uxn_opcodes_h_l2967_c40_ddea_ins,
sft2_uxn_opcodes_h_l2967_c40_ddea_previous_stack_read,
sft2_uxn_opcodes_h_l2967_c40_ddea_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192
BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_left,
BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_right,
BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2970_c17_9008
CONST_SR_6_uxn_opcodes_h_l2970_c17_9008 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2970_c17_9008_x,
CONST_SR_6_uxn_opcodes_h_l2970_c17_9008_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031
BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_left,
BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_right,
BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_return_output);

-- sp0_MUX_uxn_opcodes_h_l2973_c2_10c6
sp0_MUX_uxn_opcodes_h_l2973_c2_10c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_cond,
sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_iftrue,
sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_iffalse,
sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output);

-- sp1_MUX_uxn_opcodes_h_l2973_c2_10c6
sp1_MUX_uxn_opcodes_h_l2973_c2_10c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_cond,
sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_iftrue,
sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_iffalse,
sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f
BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_left,
BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_right,
BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea
BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_left,
BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_right,
BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_return_output);

-- MUX_uxn_opcodes_h_l2979_c29_6a21
MUX_uxn_opcodes_h_l2979_c29_6a21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2979_c29_6a21_cond,
MUX_uxn_opcodes_h_l2979_c29_6a21_iftrue,
MUX_uxn_opcodes_h_l2979_c29_6a21_iffalse,
MUX_uxn_opcodes_h_l2979_c29_6a21_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166
BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166 : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_left,
BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_right,
BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_return_output);

-- MUX_uxn_opcodes_h_l2980_c20_bbc7
MUX_uxn_opcodes_h_l2980_c20_bbc7 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2980_c20_bbc7_cond,
MUX_uxn_opcodes_h_l2980_c20_bbc7_iftrue,
MUX_uxn_opcodes_h_l2980_c20_bbc7_iffalse,
MUX_uxn_opcodes_h_l2980_c20_bbc7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594
BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594 : entity work.BIN_OP_PLUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_left,
BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_right,
BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_return_output);

-- stack_ram_update_uxn_opcodes_h_l2982_c24_260d
stack_ram_update_uxn_opcodes_h_l2982_c24_260d : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2982_c24_260d_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2982_c24_260d_stack_address,
stack_ram_update_uxn_opcodes_h_l2982_c24_260d_value,
stack_ram_update_uxn_opcodes_h_l2982_c24_260d_write_enable,
stack_ram_update_uxn_opcodes_h_l2982_c24_260d_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_return_output,
 MUX_uxn_opcodes_h_l2891_c14_63b8_return_output,
 MUX_uxn_opcodes_h_l2892_c8_7270_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output,
 is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output,
 brk_uxn_opcodes_h_l2898_c48_8b7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output,
 jci_uxn_opcodes_h_l2899_c40_31a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output,
 jmi_uxn_opcodes_h_l2900_c40_10d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output,
 jsi_uxn_opcodes_h_l2901_c40_6acd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_return_output,
 lit_uxn_opcodes_h_l2902_c40_1a75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output,
 lit2_uxn_opcodes_h_l2903_c40_0aac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output,
 lit_uxn_opcodes_h_l2904_c40_bb0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output,
 lit2_uxn_opcodes_h_l2905_c40_3560_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_return_output,
 inc_uxn_opcodes_h_l2906_c40_7459_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_return_output,
 inc2_uxn_opcodes_h_l2907_c40_9b91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output,
 pop_uxn_opcodes_h_l2908_c40_178d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output,
 pop2_uxn_opcodes_h_l2909_c40_936e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output,
 nip_uxn_opcodes_h_l2910_c40_8853_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_return_output,
 nip2_uxn_opcodes_h_l2911_c40_dade_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output,
 swp_uxn_opcodes_h_l2912_c40_8924_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_return_output,
 swp2_uxn_opcodes_h_l2913_c40_e2fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_return_output,
 rot_uxn_opcodes_h_l2914_c40_dbf6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_return_output,
 rot2_uxn_opcodes_h_l2915_c40_de75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output,
 dup_uxn_opcodes_h_l2916_c40_f52b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output,
 dup2_uxn_opcodes_h_l2917_c40_abf0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output,
 ovr_uxn_opcodes_h_l2918_c40_63e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output,
 ovr2_uxn_opcodes_h_l2919_c40_d8a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output,
 equ_uxn_opcodes_h_l2920_c40_0cc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output,
 equ2_uxn_opcodes_h_l2921_c40_42af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output,
 neq_uxn_opcodes_h_l2922_c40_e9b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_return_output,
 neq2_uxn_opcodes_h_l2923_c40_625e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output,
 gth_uxn_opcodes_h_l2924_c40_0b12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output,
 gth2_uxn_opcodes_h_l2925_c40_6441_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_return_output,
 lth_uxn_opcodes_h_l2926_c40_53ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output,
 lth2_uxn_opcodes_h_l2927_c40_cca9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output,
 jmp_uxn_opcodes_h_l2928_c40_8508_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output,
 jmp2_uxn_opcodes_h_l2929_c40_589f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output,
 jcn_uxn_opcodes_h_l2930_c40_d383_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_return_output,
 jcn2_uxn_opcodes_h_l2931_c40_0032_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_return_output,
 jsr_uxn_opcodes_h_l2932_c40_8038_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_return_output,
 jsr2_uxn_opcodes_h_l2933_c40_7f03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output,
 sth_uxn_opcodes_h_l2934_c40_883e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output,
 sth2_uxn_opcodes_h_l2935_c40_7013_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output,
 ldz_uxn_opcodes_h_l2936_c40_1d9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output,
 ldz2_uxn_opcodes_h_l2937_c40_15c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output,
 stz_uxn_opcodes_h_l2938_c40_0e71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output,
 stz2_uxn_opcodes_h_l2939_c40_e402_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output,
 ldr_uxn_opcodes_h_l2940_c40_af57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_return_output,
 opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output,
 ldr2_uxn_opcodes_h_l2941_c40_82b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output,
 opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_return_output,
 str1_uxn_opcodes_h_l2942_c40_2146_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output,
 str2_uxn_opcodes_h_l2943_c40_0dd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output,
 opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_return_output,
 lda_uxn_opcodes_h_l2944_c40_5345_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_return_output,
 opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output,
 lda2_uxn_opcodes_h_l2945_c40_dea4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_return_output,
 sta_uxn_opcodes_h_l2946_c40_9cbd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output,
 sta2_uxn_opcodes_h_l2947_c40_af8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output,
 opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output,
 dei_uxn_opcodes_h_l2948_c40_f9b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output,
 dei2_uxn_opcodes_h_l2949_c40_1259_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output,
 deo_uxn_opcodes_h_l2950_c40_110f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_return_output,
 opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output,
 deo2_uxn_opcodes_h_l2951_c40_585a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_return_output,
 opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_return_output,
 add_uxn_opcodes_h_l2952_c40_33e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_return_output,
 opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_return_output,
 add2_uxn_opcodes_h_l2953_c40_ea20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_return_output,
 sub_uxn_opcodes_h_l2954_c40_905d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output,
 sub2_uxn_opcodes_h_l2955_c40_135e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_return_output,
 mul_uxn_opcodes_h_l2956_c40_3647_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_return_output,
 opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output,
 mul2_uxn_opcodes_h_l2957_c40_08fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_return_output,
 div_uxn_opcodes_h_l2958_c40_bcd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_return_output,
 div2_uxn_opcodes_h_l2959_c40_3093_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_return_output,
 opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output,
 and_uxn_opcodes_h_l2960_c40_80e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_return_output,
 opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_return_output,
 and2_uxn_opcodes_h_l2961_c40_9182_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output,
 opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_return_output,
 ora_uxn_opcodes_h_l2962_c40_2e63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output,
 ora2_uxn_opcodes_h_l2963_c40_9410_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output,
 eor_uxn_opcodes_h_l2964_c40_3598_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output,
 eor2_uxn_opcodes_h_l2965_c40_5e36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_return_output,
 sft_uxn_opcodes_h_l2966_c40_0188_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_return_output,
 sft2_uxn_opcodes_h_l2967_c40_ddea_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_return_output,
 CONST_SR_6_uxn_opcodes_h_l2970_c17_9008_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_return_output,
 sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output,
 sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_return_output,
 MUX_uxn_opcodes_h_l2979_c29_6a21_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_return_output,
 MUX_uxn_opcodes_h_l2980_c20_bbc7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_return_output,
 stack_ram_update_uxn_opcodes_h_l2982_c24_260d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2891_c14_63b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2891_c14_63b8_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2891_c14_63b8_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2891_c14_63b8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2892_c8_7270_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2892_c8_7270_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2892_c8_7270_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_cond : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2898_c48_8b7c_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2898_c48_8b7c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2898_c48_8b7c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2899_c40_31a9_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2899_c40_31a9_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2899_c40_31a9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2899_c40_31a9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2899_c40_31a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2899_c40_31a9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2902_c40_1a75_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2902_c40_1a75_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2902_c40_1a75_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2902_c40_1a75_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2902_c40_1a75_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2905_c40_3560_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2905_c40_3560_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2905_c40_3560_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2905_c40_3560_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2905_c40_3560_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2906_c40_7459_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2906_c40_7459_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2906_c40_7459_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2906_c40_7459_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2906_c40_7459_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2908_c40_178d_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2908_c40_178d_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2908_c40_178d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2908_c40_178d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2909_c40_936e_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2909_c40_936e_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2909_c40_936e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2909_c40_936e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2910_c40_8853_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2910_c40_8853_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2910_c40_8853_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2910_c40_8853_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2910_c40_8853_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2911_c40_dade_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2911_c40_dade_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2911_c40_dade_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2911_c40_dade_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2911_c40_dade_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2912_c40_8924_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2912_c40_8924_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2912_c40_8924_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2912_c40_8924_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2912_c40_8924_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2915_c40_de75_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2915_c40_de75_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2915_c40_de75_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2915_c40_de75_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2915_c40_de75_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2916_c40_f52b_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2916_c40_f52b_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2916_c40_f52b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2916_c40_f52b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2916_c40_f52b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2921_c40_42af_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2921_c40_42af_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2921_c40_42af_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2921_c40_42af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2921_c40_42af_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2923_c40_625e_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2923_c40_625e_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2923_c40_625e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2923_c40_625e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2923_c40_625e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2924_c40_0b12_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2924_c40_0b12_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2924_c40_0b12_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2924_c40_0b12_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2924_c40_0b12_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2925_c40_6441_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2925_c40_6441_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2925_c40_6441_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2925_c40_6441_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2925_c40_6441_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2926_c40_53ad_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2926_c40_53ad_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2926_c40_53ad_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2926_c40_53ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2926_c40_53ad_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2928_c40_8508_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2928_c40_8508_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2928_c40_8508_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2928_c40_8508_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2928_c40_8508_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2928_c40_8508_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2930_c40_d383_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2930_c40_d383_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2930_c40_d383_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2930_c40_d383_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2930_c40_d383_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2930_c40_d383_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2932_c40_8038_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2932_c40_8038_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2932_c40_8038_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2932_c40_8038_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2932_c40_8038_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2932_c40_8038_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2934_c40_883e_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2934_c40_883e_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2934_c40_883e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2934_c40_883e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2934_c40_883e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2935_c40_7013_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2935_c40_7013_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2935_c40_7013_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2935_c40_7013_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2935_c40_7013_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2938_c40_0e71_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2938_c40_0e71_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2938_c40_0e71_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2938_c40_0e71_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2938_c40_0e71_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2939_c40_e402_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2939_c40_e402_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2939_c40_e402_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2939_c40_e402_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2939_c40_e402_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2940_c40_af57_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2940_c40_af57_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2940_c40_af57_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2940_c40_af57_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2940_c40_af57_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2940_c40_af57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2940_c40_af57_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2942_c40_2146_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2942_c40_2146_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2942_c40_2146_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2942_c40_2146_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2942_c40_2146_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2942_c40_2146_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2944_c40_5345_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2944_c40_5345_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2944_c40_5345_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2944_c40_5345_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2944_c40_5345_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2944_c40_5345_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2949_c40_1259_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2949_c40_1259_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2949_c40_1259_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2949_c40_1259_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2949_c40_1259_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2949_c40_1259_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2950_c40_110f_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2950_c40_110f_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2950_c40_110f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2950_c40_110f_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2950_c40_110f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2950_c40_110f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2950_c40_110f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2951_c40_585a_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2951_c40_585a_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2951_c40_585a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2951_c40_585a_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2951_c40_585a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2951_c40_585a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2951_c40_585a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2952_c40_33e5_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2952_c40_33e5_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2952_c40_33e5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2952_c40_33e5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2952_c40_33e5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2953_c40_ea20_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2953_c40_ea20_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2953_c40_ea20_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2953_c40_ea20_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2953_c40_ea20_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2954_c40_905d_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2954_c40_905d_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2954_c40_905d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2954_c40_905d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2954_c40_905d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2955_c40_135e_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2955_c40_135e_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2955_c40_135e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2955_c40_135e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2955_c40_135e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2956_c40_3647_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2956_c40_3647_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2956_c40_3647_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2956_c40_3647_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2956_c40_3647_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2958_c40_bcd6_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2958_c40_bcd6_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2958_c40_bcd6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2958_c40_bcd6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2958_c40_bcd6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2959_c40_3093_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2959_c40_3093_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2959_c40_3093_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2959_c40_3093_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2959_c40_3093_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2960_c40_80e8_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2960_c40_80e8_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2960_c40_80e8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2960_c40_80e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2960_c40_80e8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2961_c40_9182_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2961_c40_9182_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2961_c40_9182_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2961_c40_9182_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2961_c40_9182_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2962_c40_2e63_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2962_c40_2e63_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2962_c40_2e63_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2962_c40_2e63_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2962_c40_2e63_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2963_c40_9410_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2963_c40_9410_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2963_c40_9410_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2963_c40_9410_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2963_c40_9410_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2964_c40_3598_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2964_c40_3598_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2964_c40_3598_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2964_c40_3598_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2964_c40_3598_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2966_c40_0188_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2966_c40_0188_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2966_c40_0188_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2966_c40_0188_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2966_c40_0188_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2970_c2_7a61 : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2970_c17_9008_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2970_c17_9008_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2971_c17_95d4_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2976_c3_b17a : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2974_c3_43c8 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2979_c29_6a21_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2979_c29_6a21_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2979_c29_6a21_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2979_c29_6a21_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2979_c19_e300_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2979_c68_07c1_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2979_c58_964c_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_return_output : unsigned(8 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2980_c2_fee8 : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2980_c20_bbc7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2980_c20_bbc7_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2980_c20_bbc7_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2980_c20_bbc7_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_return_output : unsigned(9 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2985_c3_633d_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2989_c39_7394_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2990_c40_1fbf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2991_c34_e517_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2992_c30_74cc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2993_c33_d73b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2994_c34_ee09_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2995_c37_3a66_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2997_c32_fe50_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2974_l2976_DUPLICATE_c150_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2974_l2976_DUPLICATE_57a8_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2996_l2984_DUPLICATE_a000_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2875_l2999_DUPLICATE_09d8_return_output : eval_opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_right := to_unsigned(54, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_right := to_unsigned(34, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_right := to_unsigned(59, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_right := to_unsigned(5, 8);
     VAR_MUX_uxn_opcodes_h_l2980_c20_bbc7_iftrue := to_unsigned(256, 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_right := to_unsigned(160, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_right := to_unsigned(21, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_right := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_right := to_unsigned(39, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_right := to_unsigned(4, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_right := to_unsigned(36, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_right := to_unsigned(50, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_right := to_unsigned(0, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_right := to_unsigned(47, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_right := to_unsigned(33, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_right := to_unsigned(28, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_right := to_unsigned(44, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_right := to_unsigned(46, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_right := to_unsigned(55, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_right := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_right := to_unsigned(45, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_right := to_unsigned(9, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_right := to_unsigned(58, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_right := to_unsigned(63, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_right := to_unsigned(19, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_right := to_unsigned(96, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_right := to_unsigned(23, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_right := to_unsigned(29, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_right := to_unsigned(26, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_right := to_unsigned(8, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_right := to_unsigned(31, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_right := to_unsigned(14, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_right := to_unsigned(16, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_right := to_unsigned(52, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_right := to_unsigned(3, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_right := to_unsigned(25, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_right := to_unsigned(61, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_right := to_unsigned(32, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_right := to_unsigned(63, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_right := to_unsigned(15, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_right := to_unsigned(10, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_right := to_unsigned(7, 8);
     VAR_MUX_uxn_opcodes_h_l2891_c14_63b8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_right := to_unsigned(24, 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_right := to_unsigned(64, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_right := to_unsigned(128, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_right := to_unsigned(224, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_right := to_unsigned(30, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_right := to_unsigned(48, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_right := to_unsigned(22, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_right := to_unsigned(223, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_right := to_unsigned(27, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_right := to_unsigned(56, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_right := to_unsigned(51, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_right := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_right := to_unsigned(18, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_right := to_unsigned(53, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_right := to_unsigned(49, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_right := to_unsigned(192, 8);
     VAR_MUX_uxn_opcodes_h_l2891_c14_63b8_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_right := to_unsigned(37, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_right := to_unsigned(64, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_right := to_unsigned(42, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_right := to_unsigned(20, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_right := to_unsigned(11, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_right := to_unsigned(35, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_right := to_unsigned(60, 8);
     VAR_MUX_uxn_opcodes_h_l2980_c20_bbc7_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_right := to_unsigned(38, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_right := to_unsigned(12, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_right := to_unsigned(13, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_right := to_unsigned(57, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_right := to_unsigned(62, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_right := to_unsigned(1, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_right := to_unsigned(17, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_left := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2892_c8_7270_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2953_c40_ea20_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2952_c40_33e5_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2961_c40_9182_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2960_c40_80e8_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2949_c40_1259_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2951_c40_585a_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2950_c40_110f_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2959_c40_3093_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2958_c40_bcd6_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2916_c40_f52b_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2964_c40_3598_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2921_c40_42af_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2925_c40_6441_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2924_c40_0b12_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2906_c40_7459_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2930_c40_d383_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2928_c40_8508_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2932_c40_8038_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2944_c40_5345_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2940_c40_af57_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2926_c40_53ad_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2956_c40_3647_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2923_c40_625e_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2911_c40_dade_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2910_c40_8853_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2963_c40_9410_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2962_c40_2e63_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2909_c40_936e_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2908_c40_178d_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2915_c40_de75_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2966_c40_0188_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2935_c40_7013_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2934_c40_883e_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2942_c40_2146_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2939_c40_e402_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2938_c40_0e71_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2955_c40_135e_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2954_c40_905d_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2912_c40_8924_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2899_c40_31a9_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2930_c40_d383_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2928_c40_8508_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2932_c40_8038_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2940_c40_af57_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2905_c40_3560_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2902_c40_1a75_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2942_c40_2146_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2953_c40_ea20_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2952_c40_33e5_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2961_c40_9182_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2960_c40_80e8_phase := VAR_phase;
     VAR_brk_uxn_opcodes_h_l2898_c48_8b7c_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2949_c40_1259_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2951_c40_585a_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2950_c40_110f_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2959_c40_3093_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2958_c40_bcd6_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2916_c40_f52b_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2964_c40_3598_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2921_c40_42af_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2925_c40_6441_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2924_c40_0b12_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2906_c40_7459_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2899_c40_31a9_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2930_c40_d383_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2928_c40_8508_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2932_c40_8038_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2944_c40_5345_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2940_c40_af57_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2905_c40_3560_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2902_c40_1a75_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2926_c40_53ad_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2956_c40_3647_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2923_c40_625e_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2911_c40_dade_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2910_c40_8853_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2963_c40_9410_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2962_c40_2e63_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2909_c40_936e_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2908_c40_178d_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l2915_c40_de75_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2966_c40_0188_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2935_c40_7013_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2934_c40_883e_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2942_c40_2146_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2939_c40_e402_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2938_c40_0e71_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2955_c40_135e_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2954_c40_905d_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2912_c40_8924_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2949_c40_1259_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2951_c40_585a_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2950_c40_110f_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2951_c40_585a_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2950_c40_110f_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2899_c40_31a9_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2944_c40_5345_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2940_c40_af57_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2905_c40_3560_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2902_c40_1a75_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2953_c40_ea20_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2952_c40_33e5_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2961_c40_9182_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2960_c40_80e8_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2949_c40_1259_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2951_c40_585a_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2950_c40_110f_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2959_c40_3093_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2958_c40_bcd6_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2916_c40_f52b_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2964_c40_3598_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2921_c40_42af_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2925_c40_6441_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2924_c40_0b12_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2906_c40_7459_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2899_c40_31a9_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2930_c40_d383_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2928_c40_8508_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2932_c40_8038_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2944_c40_5345_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2940_c40_af57_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2926_c40_53ad_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2956_c40_3647_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2923_c40_625e_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2911_c40_dade_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2910_c40_8853_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2963_c40_9410_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2962_c40_2e63_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2915_c40_de75_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2966_c40_0188_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2935_c40_7013_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2934_c40_883e_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2942_c40_2146_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2939_c40_e402_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2938_c40_0e71_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2955_c40_135e_previous_stack_read := previous_stack_read;
     VAR_sub_uxn_opcodes_h_l2954_c40_905d_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2912_c40_8924_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_iffalse := sp1;
     -- BIN_OP_AND[uxn_opcodes_h_l2890_c14_2ad2] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_left;
     BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_return_output := BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2970_c17_e192] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_left;
     BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_return_output := BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_return_output;
     VAR_MUX_uxn_opcodes_h_l2892_c8_7270_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2890_c14_2ad2_return_output;
     VAR_CONST_SR_6_uxn_opcodes_h_l2970_c17_9008_x := VAR_BIN_OP_AND_uxn_opcodes_h_l2970_c17_e192_return_output;
     -- CONST_SR_6[uxn_opcodes_h_l2970_c17_9008] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2970_c17_9008_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2970_c17_9008_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2970_c17_9008_return_output := CONST_SR_6_uxn_opcodes_h_l2970_c17_9008_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l2891_c14_a479] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_left;
     BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_return_output := BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2891_c14_a479_return_output;
     VAR_stack_index_uxn_opcodes_h_l2970_c2_7a61 := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2970_c17_9008_return_output, 1);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_left := VAR_stack_index_uxn_opcodes_h_l2970_c2_7a61;
     -- BIN_OP_OR[uxn_opcodes_h_l2891_c14_08bd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_left;
     BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_return_output := BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2891_c14_08bd_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2891_c14_fb6a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2891_c14_fb6a_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2891_c14_383a] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2891_c14_63b8_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2891_c14_383a_return_output;
     -- MUX[uxn_opcodes_h_l2891_c14_63b8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2891_c14_63b8_cond <= VAR_MUX_uxn_opcodes_h_l2891_c14_63b8_cond;
     MUX_uxn_opcodes_h_l2891_c14_63b8_iftrue <= VAR_MUX_uxn_opcodes_h_l2891_c14_63b8_iftrue;
     MUX_uxn_opcodes_h_l2891_c14_63b8_iffalse <= VAR_MUX_uxn_opcodes_h_l2891_c14_63b8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2891_c14_63b8_return_output := MUX_uxn_opcodes_h_l2891_c14_63b8_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2892_c8_7270_cond := VAR_MUX_uxn_opcodes_h_l2891_c14_63b8_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2891_c14_63b8_return_output;
     -- MUX[uxn_opcodes_h_l2892_c8_7270] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2892_c8_7270_cond <= VAR_MUX_uxn_opcodes_h_l2892_c8_7270_cond;
     MUX_uxn_opcodes_h_l2892_c8_7270_iftrue <= VAR_MUX_uxn_opcodes_h_l2892_c8_7270_iftrue;
     MUX_uxn_opcodes_h_l2892_c8_7270_iffalse <= VAR_MUX_uxn_opcodes_h_l2892_c8_7270_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output := MUX_uxn_opcodes_h_l2892_c8_7270_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_left := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2892_c8_7270_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_df0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2963_c11_556a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_08f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_f858] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_7549] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_6853] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_1ece] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_7f49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c6_5776] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_1086] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_left;
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_return_output := BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_950e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_7beb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_6880] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_dc61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_d8ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2967_c11_79f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2962_c11_b079] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_left;
     BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_return_output := BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_3880] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_5d31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_6741] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_7a9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_8d82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_162e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_cfe1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_f9a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_a0f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2959_c11_a747] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_left;
     BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_return_output := BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2964_c11_11e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_c91b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2947_c11_b3eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_281e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2956_c11_9f42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_left;
     BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_return_output := BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2965_c11_9059] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_left;
     BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_return_output := BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_686a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2966_c11_9c0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_b75a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2960_c11_3ffe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2957_c11_84e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_6a6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2949_c11_1714] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_left;
     BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_return_output := BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_7080] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2948_c11_279c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_bf73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_8a60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2958_c11_35b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_dcc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_ddc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_93a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_287f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_8a9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2943_c11_5f4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_5ef8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_96f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_9104] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_left;
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_return_output := BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_948e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_98a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2954_c11_a3eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_595b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2945_c11_daa0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_1b06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_2c7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_a710] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2951_c11_b41f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2950_c11_897b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2961_c11_3963] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_left;
     BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_return_output := BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2953_c11_cde1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2955_c11_661e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_070b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_3e8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2946_c11_83ea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c6_5776_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_6741_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_8d82_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_3e8a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_1ece_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_950e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_070b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_08f7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_93a9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_7beb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_162e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_8a9f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_a710_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_dc61_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_6853_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_b75a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_d8ac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_595b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_8a60_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_7080_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_96f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_5d31_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_281e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_bf73_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_948e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_7549_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_f858_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_1b06_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_f9a9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_a0f8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_df0e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_7a9b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_5ef8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_cfe1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_2c7a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_6a6d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_287f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_686a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_ddc1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_c91b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_dcc5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3880_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_7f49_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_6880_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_98a2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_5f4d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_9104_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_daa0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_83ea_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_b3eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_279c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_1714_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_897b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_b41f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_1086_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_cde1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_a3eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_661e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_9f42_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_84e3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2958_c11_35b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2959_c11_a747_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_3ffe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2961_c11_3963_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c11_b079_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2963_c11_556a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_11e0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2965_c11_9059_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2966_c11_9c0a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_79f8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_47f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_42ac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2898_c2_8aa4] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_cond;
     is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output := is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output;
     VAR_brk_uxn_opcodes_h_l2898_c48_8b7c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_47f9_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output;
     -- brk[uxn_opcodes_h_l2898_c48_8b7c] LATENCY=0
     -- Clock enable
     brk_uxn_opcodes_h_l2898_c48_8b7c_CLOCK_ENABLE <= VAR_brk_uxn_opcodes_h_l2898_c48_8b7c_CLOCK_ENABLE;
     -- Inputs
     brk_uxn_opcodes_h_l2898_c48_8b7c_phase <= VAR_brk_uxn_opcodes_h_l2898_c48_8b7c_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2898_c48_8b7c_return_output := brk_uxn_opcodes_h_l2898_c48_8b7c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_e3d2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_a8a6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output;
     VAR_jci_uxn_opcodes_h_l2899_c40_31a9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_e3d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_iftrue := VAR_brk_uxn_opcodes_h_l2898_c48_8b7c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_3a52] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_a774] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_return_output;

     -- jci[uxn_opcodes_h_l2899_c40_31a9] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2899_c40_31a9_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2899_c40_31a9_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2899_c40_31a9_phase <= VAR_jci_uxn_opcodes_h_l2899_c40_31a9_phase;
     jci_uxn_opcodes_h_l2899_c40_31a9_pc <= VAR_jci_uxn_opcodes_h_l2899_c40_31a9_pc;
     jci_uxn_opcodes_h_l2899_c40_31a9_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2899_c40_31a9_previous_stack_read;
     jci_uxn_opcodes_h_l2899_c40_31a9_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2899_c40_31a9_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2899_c40_31a9_return_output := jci_uxn_opcodes_h_l2899_c40_31a9_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output;
     VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_a774_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_iftrue := VAR_jci_uxn_opcodes_h_l2899_c40_31a9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_d585] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_return_output;

     -- jmi[uxn_opcodes_h_l2900_c40_10d8] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2900_c40_10d8_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2900_c40_10d8_phase <= VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_phase;
     jmi_uxn_opcodes_h_l2900_c40_10d8_pc <= VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_pc;
     jmi_uxn_opcodes_h_l2900_c40_10d8_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_return_output := jmi_uxn_opcodes_h_l2900_c40_10d8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_2123] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_2123_return_output;
     VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_d585_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_iftrue := VAR_jmi_uxn_opcodes_h_l2900_c40_10d8_return_output;
     -- jsi[uxn_opcodes_h_l2901_c40_6acd] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2901_c40_6acd_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2901_c40_6acd_phase <= VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_phase;
     jsi_uxn_opcodes_h_l2901_c40_6acd_pc <= VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_pc;
     jsi_uxn_opcodes_h_l2901_c40_6acd_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_return_output := jsi_uxn_opcodes_h_l2901_c40_6acd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_be1c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_5c2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output;
     VAR_lit_uxn_opcodes_h_l2902_c40_1a75_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_5c2d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_iftrue := VAR_jsi_uxn_opcodes_h_l2901_c40_6acd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_0a5e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_a1de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_return_output;

     -- lit[uxn_opcodes_h_l2902_c40_1a75] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2902_c40_1a75_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2902_c40_1a75_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2902_c40_1a75_phase <= VAR_lit_uxn_opcodes_h_l2902_c40_1a75_phase;
     lit_uxn_opcodes_h_l2902_c40_1a75_pc <= VAR_lit_uxn_opcodes_h_l2902_c40_1a75_pc;
     lit_uxn_opcodes_h_l2902_c40_1a75_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2902_c40_1a75_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2902_c40_1a75_return_output := lit_uxn_opcodes_h_l2902_c40_1a75_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output;
     VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_a1de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_iftrue := VAR_lit_uxn_opcodes_h_l2902_c40_1a75_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_0e8c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_8854] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_return_output;

     -- lit2[uxn_opcodes_h_l2903_c40_0aac] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2903_c40_0aac_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2903_c40_0aac_phase <= VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_phase;
     lit2_uxn_opcodes_h_l2903_c40_0aac_pc <= VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_pc;
     lit2_uxn_opcodes_h_l2903_c40_0aac_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_return_output := lit2_uxn_opcodes_h_l2903_c40_0aac_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output;
     VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_8854_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_iftrue := VAR_lit2_uxn_opcodes_h_l2903_c40_0aac_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_4d4f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_return_output;

     -- lit[uxn_opcodes_h_l2904_c40_bb0d] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2904_c40_bb0d_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2904_c40_bb0d_phase <= VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_phase;
     lit_uxn_opcodes_h_l2904_c40_bb0d_pc <= VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_pc;
     lit_uxn_opcodes_h_l2904_c40_bb0d_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_return_output := lit_uxn_opcodes_h_l2904_c40_bb0d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_5365] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_5365_return_output;
     VAR_lit2_uxn_opcodes_h_l2905_c40_3560_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_4d4f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_iftrue := VAR_lit_uxn_opcodes_h_l2904_c40_bb0d_return_output;
     -- lit2[uxn_opcodes_h_l2905_c40_3560] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2905_c40_3560_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2905_c40_3560_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2905_c40_3560_phase <= VAR_lit2_uxn_opcodes_h_l2905_c40_3560_phase;
     lit2_uxn_opcodes_h_l2905_c40_3560_pc <= VAR_lit2_uxn_opcodes_h_l2905_c40_3560_pc;
     lit2_uxn_opcodes_h_l2905_c40_3560_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2905_c40_3560_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2905_c40_3560_return_output := lit2_uxn_opcodes_h_l2905_c40_3560_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_24ce] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_5799] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_5799_return_output;
     VAR_inc_uxn_opcodes_h_l2906_c40_7459_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_24ce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_iftrue := VAR_lit2_uxn_opcodes_h_l2905_c40_3560_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_670c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_return_output;

     -- inc[uxn_opcodes_h_l2906_c40_7459] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2906_c40_7459_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2906_c40_7459_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2906_c40_7459_phase <= VAR_inc_uxn_opcodes_h_l2906_c40_7459_phase;
     inc_uxn_opcodes_h_l2906_c40_7459_ins <= VAR_inc_uxn_opcodes_h_l2906_c40_7459_ins;
     inc_uxn_opcodes_h_l2906_c40_7459_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2906_c40_7459_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2906_c40_7459_return_output := inc_uxn_opcodes_h_l2906_c40_7459_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_08a2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output;
     VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_670c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_iftrue := VAR_inc_uxn_opcodes_h_l2906_c40_7459_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_36e4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_1c68] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output;

     -- inc2[uxn_opcodes_h_l2907_c40_9b91] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2907_c40_9b91_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2907_c40_9b91_phase <= VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_phase;
     inc2_uxn_opcodes_h_l2907_c40_9b91_ins <= VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_ins;
     inc2_uxn_opcodes_h_l2907_c40_9b91_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_return_output := inc2_uxn_opcodes_h_l2907_c40_9b91_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output;
     VAR_pop_uxn_opcodes_h_l2908_c40_178d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_36e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_iftrue := VAR_inc2_uxn_opcodes_h_l2907_c40_9b91_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_f8d3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_022b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_return_output;

     -- pop[uxn_opcodes_h_l2908_c40_178d] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2908_c40_178d_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2908_c40_178d_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2908_c40_178d_phase <= VAR_pop_uxn_opcodes_h_l2908_c40_178d_phase;
     pop_uxn_opcodes_h_l2908_c40_178d_ins <= VAR_pop_uxn_opcodes_h_l2908_c40_178d_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2908_c40_178d_return_output := pop_uxn_opcodes_h_l2908_c40_178d_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output;
     VAR_pop2_uxn_opcodes_h_l2909_c40_936e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_022b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_iftrue := VAR_pop_uxn_opcodes_h_l2908_c40_178d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_dc91] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_858f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_return_output;

     -- pop2[uxn_opcodes_h_l2909_c40_936e] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2909_c40_936e_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2909_c40_936e_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2909_c40_936e_phase <= VAR_pop2_uxn_opcodes_h_l2909_c40_936e_phase;
     pop2_uxn_opcodes_h_l2909_c40_936e_ins <= VAR_pop2_uxn_opcodes_h_l2909_c40_936e_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2909_c40_936e_return_output := pop2_uxn_opcodes_h_l2909_c40_936e_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_858f_return_output;
     VAR_nip_uxn_opcodes_h_l2910_c40_8853_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_dc91_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_iftrue := VAR_pop2_uxn_opcodes_h_l2909_c40_936e_return_output;
     -- nip[uxn_opcodes_h_l2910_c40_8853] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2910_c40_8853_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2910_c40_8853_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2910_c40_8853_phase <= VAR_nip_uxn_opcodes_h_l2910_c40_8853_phase;
     nip_uxn_opcodes_h_l2910_c40_8853_ins <= VAR_nip_uxn_opcodes_h_l2910_c40_8853_ins;
     nip_uxn_opcodes_h_l2910_c40_8853_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2910_c40_8853_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2910_c40_8853_return_output := nip_uxn_opcodes_h_l2910_c40_8853_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_bc75] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_c726] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output;
     VAR_nip2_uxn_opcodes_h_l2911_c40_dade_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_c726_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_iftrue := VAR_nip_uxn_opcodes_h_l2910_c40_8853_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_7984] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_return_output;

     -- nip2[uxn_opcodes_h_l2911_c40_dade] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2911_c40_dade_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2911_c40_dade_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2911_c40_dade_phase <= VAR_nip2_uxn_opcodes_h_l2911_c40_dade_phase;
     nip2_uxn_opcodes_h_l2911_c40_dade_ins <= VAR_nip2_uxn_opcodes_h_l2911_c40_dade_ins;
     nip2_uxn_opcodes_h_l2911_c40_dade_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2911_c40_dade_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2911_c40_dade_return_output := nip2_uxn_opcodes_h_l2911_c40_dade_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_8eea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_7984_return_output;
     VAR_swp_uxn_opcodes_h_l2912_c40_8924_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_8eea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_iftrue := VAR_nip2_uxn_opcodes_h_l2911_c40_dade_return_output;
     -- swp[uxn_opcodes_h_l2912_c40_8924] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2912_c40_8924_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2912_c40_8924_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2912_c40_8924_phase <= VAR_swp_uxn_opcodes_h_l2912_c40_8924_phase;
     swp_uxn_opcodes_h_l2912_c40_8924_ins <= VAR_swp_uxn_opcodes_h_l2912_c40_8924_ins;
     swp_uxn_opcodes_h_l2912_c40_8924_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2912_c40_8924_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2912_c40_8924_return_output := swp_uxn_opcodes_h_l2912_c40_8924_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_2d2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_0291] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_0291_return_output;
     VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2d2d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_iftrue := VAR_swp_uxn_opcodes_h_l2912_c40_8924_return_output;
     -- swp2[uxn_opcodes_h_l2913_c40_e2fe] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2913_c40_e2fe_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2913_c40_e2fe_phase <= VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_phase;
     swp2_uxn_opcodes_h_l2913_c40_e2fe_ins <= VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_ins;
     swp2_uxn_opcodes_h_l2913_c40_e2fe_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_return_output := swp2_uxn_opcodes_h_l2913_c40_e2fe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_7955] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_3606] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_7955_return_output;
     VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_3606_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_iftrue := VAR_swp2_uxn_opcodes_h_l2913_c40_e2fe_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_97d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output;

     -- rot[uxn_opcodes_h_l2914_c40_dbf6] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2914_c40_dbf6_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2914_c40_dbf6_phase <= VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_phase;
     rot_uxn_opcodes_h_l2914_c40_dbf6_ins <= VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_ins;
     rot_uxn_opcodes_h_l2914_c40_dbf6_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_return_output := rot_uxn_opcodes_h_l2914_c40_dbf6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_6900] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output;
     VAR_rot2_uxn_opcodes_h_l2915_c40_de75_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_6900_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_iftrue := VAR_rot_uxn_opcodes_h_l2914_c40_dbf6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_d876] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_return_output;

     -- rot2[uxn_opcodes_h_l2915_c40_de75] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2915_c40_de75_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2915_c40_de75_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2915_c40_de75_phase <= VAR_rot2_uxn_opcodes_h_l2915_c40_de75_phase;
     rot2_uxn_opcodes_h_l2915_c40_de75_ins <= VAR_rot2_uxn_opcodes_h_l2915_c40_de75_ins;
     rot2_uxn_opcodes_h_l2915_c40_de75_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2915_c40_de75_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2915_c40_de75_return_output := rot2_uxn_opcodes_h_l2915_c40_de75_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_d98d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output;
     VAR_dup_uxn_opcodes_h_l2916_c40_f52b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_d876_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_iftrue := VAR_rot2_uxn_opcodes_h_l2915_c40_de75_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_7377] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_return_output;

     -- dup[uxn_opcodes_h_l2916_c40_f52b] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2916_c40_f52b_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2916_c40_f52b_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2916_c40_f52b_phase <= VAR_dup_uxn_opcodes_h_l2916_c40_f52b_phase;
     dup_uxn_opcodes_h_l2916_c40_f52b_ins <= VAR_dup_uxn_opcodes_h_l2916_c40_f52b_ins;
     dup_uxn_opcodes_h_l2916_c40_f52b_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2916_c40_f52b_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2916_c40_f52b_return_output := dup_uxn_opcodes_h_l2916_c40_f52b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_8b16] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output;
     VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_7377_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_iftrue := VAR_dup_uxn_opcodes_h_l2916_c40_f52b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_e662] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_4a47] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output;

     -- dup2[uxn_opcodes_h_l2917_c40_abf0] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2917_c40_abf0_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2917_c40_abf0_phase <= VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_phase;
     dup2_uxn_opcodes_h_l2917_c40_abf0_ins <= VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_ins;
     dup2_uxn_opcodes_h_l2917_c40_abf0_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_return_output := dup2_uxn_opcodes_h_l2917_c40_abf0_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output;
     VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_e662_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_iftrue := VAR_dup2_uxn_opcodes_h_l2917_c40_abf0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_c149] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_1fbf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output;

     -- ovr[uxn_opcodes_h_l2918_c40_63e9] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2918_c40_63e9_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2918_c40_63e9_phase <= VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_phase;
     ovr_uxn_opcodes_h_l2918_c40_63e9_ins <= VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_ins;
     ovr_uxn_opcodes_h_l2918_c40_63e9_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_return_output := ovr_uxn_opcodes_h_l2918_c40_63e9_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output;
     VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_c149_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_iftrue := VAR_ovr_uxn_opcodes_h_l2918_c40_63e9_return_output;
     -- ovr2[uxn_opcodes_h_l2919_c40_d8a9] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2919_c40_d8a9_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2919_c40_d8a9_phase <= VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_phase;
     ovr2_uxn_opcodes_h_l2919_c40_d8a9_ins <= VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_ins;
     ovr2_uxn_opcodes_h_l2919_c40_d8a9_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_return_output := ovr2_uxn_opcodes_h_l2919_c40_d8a9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_b6c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_4f19] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output;
     VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_b6c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_iftrue := VAR_ovr2_uxn_opcodes_h_l2919_c40_d8a9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_5dbe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_return_output;

     -- equ[uxn_opcodes_h_l2920_c40_0cc5] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2920_c40_0cc5_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2920_c40_0cc5_phase <= VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_phase;
     equ_uxn_opcodes_h_l2920_c40_0cc5_ins <= VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_ins;
     equ_uxn_opcodes_h_l2920_c40_0cc5_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_return_output := equ_uxn_opcodes_h_l2920_c40_0cc5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_efc4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output;
     VAR_equ2_uxn_opcodes_h_l2921_c40_42af_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_5dbe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_iftrue := VAR_equ_uxn_opcodes_h_l2920_c40_0cc5_return_output;
     -- equ2[uxn_opcodes_h_l2921_c40_42af] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2921_c40_42af_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2921_c40_42af_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2921_c40_42af_phase <= VAR_equ2_uxn_opcodes_h_l2921_c40_42af_phase;
     equ2_uxn_opcodes_h_l2921_c40_42af_ins <= VAR_equ2_uxn_opcodes_h_l2921_c40_42af_ins;
     equ2_uxn_opcodes_h_l2921_c40_42af_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2921_c40_42af_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2921_c40_42af_return_output := equ2_uxn_opcodes_h_l2921_c40_42af_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_611c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_6f14] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_611c_return_output;
     VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_6f14_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_iftrue := VAR_equ2_uxn_opcodes_h_l2921_c40_42af_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_dfd4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_return_output;

     -- neq[uxn_opcodes_h_l2922_c40_e9b6] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2922_c40_e9b6_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2922_c40_e9b6_phase <= VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_phase;
     neq_uxn_opcodes_h_l2922_c40_e9b6_ins <= VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_ins;
     neq_uxn_opcodes_h_l2922_c40_e9b6_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_return_output := neq_uxn_opcodes_h_l2922_c40_e9b6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_45dd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output;
     VAR_neq2_uxn_opcodes_h_l2923_c40_625e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_dfd4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_iftrue := VAR_neq_uxn_opcodes_h_l2922_c40_e9b6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_22db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_return_output;

     -- neq2[uxn_opcodes_h_l2923_c40_625e] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2923_c40_625e_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2923_c40_625e_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2923_c40_625e_phase <= VAR_neq2_uxn_opcodes_h_l2923_c40_625e_phase;
     neq2_uxn_opcodes_h_l2923_c40_625e_ins <= VAR_neq2_uxn_opcodes_h_l2923_c40_625e_ins;
     neq2_uxn_opcodes_h_l2923_c40_625e_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2923_c40_625e_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2923_c40_625e_return_output := neq2_uxn_opcodes_h_l2923_c40_625e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_88c5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output;
     VAR_gth_uxn_opcodes_h_l2924_c40_0b12_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_22db_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_iftrue := VAR_neq2_uxn_opcodes_h_l2923_c40_625e_return_output;
     -- gth[uxn_opcodes_h_l2924_c40_0b12] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2924_c40_0b12_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2924_c40_0b12_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2924_c40_0b12_phase <= VAR_gth_uxn_opcodes_h_l2924_c40_0b12_phase;
     gth_uxn_opcodes_h_l2924_c40_0b12_ins <= VAR_gth_uxn_opcodes_h_l2924_c40_0b12_ins;
     gth_uxn_opcodes_h_l2924_c40_0b12_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2924_c40_0b12_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2924_c40_0b12_return_output := gth_uxn_opcodes_h_l2924_c40_0b12_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_710b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_ae61] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_710b_return_output;
     VAR_gth2_uxn_opcodes_h_l2925_c40_6441_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_ae61_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_iftrue := VAR_gth_uxn_opcodes_h_l2924_c40_0b12_return_output;
     -- gth2[uxn_opcodes_h_l2925_c40_6441] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2925_c40_6441_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2925_c40_6441_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2925_c40_6441_phase <= VAR_gth2_uxn_opcodes_h_l2925_c40_6441_phase;
     gth2_uxn_opcodes_h_l2925_c40_6441_ins <= VAR_gth2_uxn_opcodes_h_l2925_c40_6441_ins;
     gth2_uxn_opcodes_h_l2925_c40_6441_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2925_c40_6441_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2925_c40_6441_return_output := gth2_uxn_opcodes_h_l2925_c40_6441_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_8f72] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_7cec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output;
     VAR_lth_uxn_opcodes_h_l2926_c40_53ad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_7cec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_iftrue := VAR_gth2_uxn_opcodes_h_l2925_c40_6441_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_c00c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_d172] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_return_output;

     -- lth[uxn_opcodes_h_l2926_c40_53ad] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2926_c40_53ad_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2926_c40_53ad_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2926_c40_53ad_phase <= VAR_lth_uxn_opcodes_h_l2926_c40_53ad_phase;
     lth_uxn_opcodes_h_l2926_c40_53ad_ins <= VAR_lth_uxn_opcodes_h_l2926_c40_53ad_ins;
     lth_uxn_opcodes_h_l2926_c40_53ad_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2926_c40_53ad_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2926_c40_53ad_return_output := lth_uxn_opcodes_h_l2926_c40_53ad_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output;
     VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_d172_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_iftrue := VAR_lth_uxn_opcodes_h_l2926_c40_53ad_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_61f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_return_output;

     -- lth2[uxn_opcodes_h_l2927_c40_cca9] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2927_c40_cca9_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2927_c40_cca9_phase <= VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_phase;
     lth2_uxn_opcodes_h_l2927_c40_cca9_ins <= VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_ins;
     lth2_uxn_opcodes_h_l2927_c40_cca9_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_return_output := lth2_uxn_opcodes_h_l2927_c40_cca9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_02a6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output;
     VAR_jmp_uxn_opcodes_h_l2928_c40_8508_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_61f9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_iftrue := VAR_lth2_uxn_opcodes_h_l2927_c40_cca9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_7e8d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_6b76] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_return_output;

     -- jmp[uxn_opcodes_h_l2928_c40_8508] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2928_c40_8508_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2928_c40_8508_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2928_c40_8508_phase <= VAR_jmp_uxn_opcodes_h_l2928_c40_8508_phase;
     jmp_uxn_opcodes_h_l2928_c40_8508_ins <= VAR_jmp_uxn_opcodes_h_l2928_c40_8508_ins;
     jmp_uxn_opcodes_h_l2928_c40_8508_pc <= VAR_jmp_uxn_opcodes_h_l2928_c40_8508_pc;
     jmp_uxn_opcodes_h_l2928_c40_8508_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2928_c40_8508_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2928_c40_8508_return_output := jmp_uxn_opcodes_h_l2928_c40_8508_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output;
     VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_6b76_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_iftrue := VAR_jmp_uxn_opcodes_h_l2928_c40_8508_return_output;
     -- jmp2[uxn_opcodes_h_l2929_c40_589f] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2929_c40_589f_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2929_c40_589f_phase <= VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_phase;
     jmp2_uxn_opcodes_h_l2929_c40_589f_ins <= VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_ins;
     jmp2_uxn_opcodes_h_l2929_c40_589f_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_return_output := jmp2_uxn_opcodes_h_l2929_c40_589f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_522d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_e511] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_522d_return_output;
     VAR_jcn_uxn_opcodes_h_l2930_c40_d383_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_e511_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_iftrue := VAR_jmp2_uxn_opcodes_h_l2929_c40_589f_return_output;
     -- jcn[uxn_opcodes_h_l2930_c40_d383] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2930_c40_d383_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2930_c40_d383_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2930_c40_d383_phase <= VAR_jcn_uxn_opcodes_h_l2930_c40_d383_phase;
     jcn_uxn_opcodes_h_l2930_c40_d383_ins <= VAR_jcn_uxn_opcodes_h_l2930_c40_d383_ins;
     jcn_uxn_opcodes_h_l2930_c40_d383_pc <= VAR_jcn_uxn_opcodes_h_l2930_c40_d383_pc;
     jcn_uxn_opcodes_h_l2930_c40_d383_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2930_c40_d383_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2930_c40_d383_return_output := jcn_uxn_opcodes_h_l2930_c40_d383_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_a062] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_5530] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_5530_return_output;
     VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_a062_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_iftrue := VAR_jcn_uxn_opcodes_h_l2930_c40_d383_return_output;
     -- jcn2[uxn_opcodes_h_l2931_c40_0032] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2931_c40_0032_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2931_c40_0032_phase <= VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_phase;
     jcn2_uxn_opcodes_h_l2931_c40_0032_ins <= VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_ins;
     jcn2_uxn_opcodes_h_l2931_c40_0032_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_return_output := jcn2_uxn_opcodes_h_l2931_c40_0032_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_7fb7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_4281] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_4281_return_output;
     VAR_jsr_uxn_opcodes_h_l2932_c40_8038_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_7fb7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_iftrue := VAR_jcn2_uxn_opcodes_h_l2931_c40_0032_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_1136] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_88b6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output;

     -- jsr[uxn_opcodes_h_l2932_c40_8038] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2932_c40_8038_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2932_c40_8038_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2932_c40_8038_phase <= VAR_jsr_uxn_opcodes_h_l2932_c40_8038_phase;
     jsr_uxn_opcodes_h_l2932_c40_8038_ins <= VAR_jsr_uxn_opcodes_h_l2932_c40_8038_ins;
     jsr_uxn_opcodes_h_l2932_c40_8038_pc <= VAR_jsr_uxn_opcodes_h_l2932_c40_8038_pc;
     jsr_uxn_opcodes_h_l2932_c40_8038_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2932_c40_8038_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2932_c40_8038_return_output := jsr_uxn_opcodes_h_l2932_c40_8038_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output;
     VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1136_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_iftrue := VAR_jsr_uxn_opcodes_h_l2932_c40_8038_return_output;
     -- jsr2[uxn_opcodes_h_l2933_c40_7f03] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2933_c40_7f03_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2933_c40_7f03_phase <= VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_phase;
     jsr2_uxn_opcodes_h_l2933_c40_7f03_ins <= VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_ins;
     jsr2_uxn_opcodes_h_l2933_c40_7f03_pc <= VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_pc;
     jsr2_uxn_opcodes_h_l2933_c40_7f03_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_return_output := jsr2_uxn_opcodes_h_l2933_c40_7f03_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_84cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_e4b0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output;
     VAR_sth_uxn_opcodes_h_l2934_c40_883e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_84cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_iftrue := VAR_jsr2_uxn_opcodes_h_l2933_c40_7f03_return_output;
     -- sth[uxn_opcodes_h_l2934_c40_883e] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2934_c40_883e_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2934_c40_883e_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2934_c40_883e_phase <= VAR_sth_uxn_opcodes_h_l2934_c40_883e_phase;
     sth_uxn_opcodes_h_l2934_c40_883e_ins <= VAR_sth_uxn_opcodes_h_l2934_c40_883e_ins;
     sth_uxn_opcodes_h_l2934_c40_883e_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2934_c40_883e_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2934_c40_883e_return_output := sth_uxn_opcodes_h_l2934_c40_883e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_20a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_cd61] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output;
     VAR_sth2_uxn_opcodes_h_l2935_c40_7013_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_20a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_iftrue := VAR_sth_uxn_opcodes_h_l2934_c40_883e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_fb03] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_c6da] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_return_output;

     -- sth2[uxn_opcodes_h_l2935_c40_7013] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2935_c40_7013_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2935_c40_7013_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2935_c40_7013_phase <= VAR_sth2_uxn_opcodes_h_l2935_c40_7013_phase;
     sth2_uxn_opcodes_h_l2935_c40_7013_ins <= VAR_sth2_uxn_opcodes_h_l2935_c40_7013_ins;
     sth2_uxn_opcodes_h_l2935_c40_7013_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2935_c40_7013_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2935_c40_7013_return_output := sth2_uxn_opcodes_h_l2935_c40_7013_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output;
     VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_c6da_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_iftrue := VAR_sth2_uxn_opcodes_h_l2935_c40_7013_return_output;
     -- ldz[uxn_opcodes_h_l2936_c40_1d9e] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2936_c40_1d9e_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2936_c40_1d9e_phase <= VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_phase;
     ldz_uxn_opcodes_h_l2936_c40_1d9e_ins <= VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_ins;
     ldz_uxn_opcodes_h_l2936_c40_1d9e_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_previous_stack_read;
     ldz_uxn_opcodes_h_l2936_c40_1d9e_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_return_output := ldz_uxn_opcodes_h_l2936_c40_1d9e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_9ef4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_da7d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output;
     VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_9ef4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_iftrue := VAR_ldz_uxn_opcodes_h_l2936_c40_1d9e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_9dac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_dc07] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output;

     -- ldz2[uxn_opcodes_h_l2937_c40_15c0] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2937_c40_15c0_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2937_c40_15c0_phase <= VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_phase;
     ldz2_uxn_opcodes_h_l2937_c40_15c0_ins <= VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_ins;
     ldz2_uxn_opcodes_h_l2937_c40_15c0_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_previous_stack_read;
     ldz2_uxn_opcodes_h_l2937_c40_15c0_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_return_output := ldz2_uxn_opcodes_h_l2937_c40_15c0_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output;
     VAR_stz_uxn_opcodes_h_l2938_c40_0e71_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_9dac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_iftrue := VAR_ldz2_uxn_opcodes_h_l2937_c40_15c0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_d70a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_bb2b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_return_output;

     -- stz[uxn_opcodes_h_l2938_c40_0e71] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2938_c40_0e71_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2938_c40_0e71_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2938_c40_0e71_phase <= VAR_stz_uxn_opcodes_h_l2938_c40_0e71_phase;
     stz_uxn_opcodes_h_l2938_c40_0e71_ins <= VAR_stz_uxn_opcodes_h_l2938_c40_0e71_ins;
     stz_uxn_opcodes_h_l2938_c40_0e71_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2938_c40_0e71_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2938_c40_0e71_return_output := stz_uxn_opcodes_h_l2938_c40_0e71_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output;
     VAR_stz2_uxn_opcodes_h_l2939_c40_e402_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_bb2b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_iftrue := VAR_stz_uxn_opcodes_h_l2938_c40_0e71_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_89eb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output;

     -- stz2[uxn_opcodes_h_l2939_c40_e402] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2939_c40_e402_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2939_c40_e402_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2939_c40_e402_phase <= VAR_stz2_uxn_opcodes_h_l2939_c40_e402_phase;
     stz2_uxn_opcodes_h_l2939_c40_e402_ins <= VAR_stz2_uxn_opcodes_h_l2939_c40_e402_ins;
     stz2_uxn_opcodes_h_l2939_c40_e402_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2939_c40_e402_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2939_c40_e402_return_output := stz2_uxn_opcodes_h_l2939_c40_e402_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_ae54] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output;
     VAR_ldr_uxn_opcodes_h_l2940_c40_af57_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_ae54_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_iftrue := VAR_stz2_uxn_opcodes_h_l2939_c40_e402_return_output;
     -- ldr[uxn_opcodes_h_l2940_c40_af57] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2940_c40_af57_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2940_c40_af57_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2940_c40_af57_phase <= VAR_ldr_uxn_opcodes_h_l2940_c40_af57_phase;
     ldr_uxn_opcodes_h_l2940_c40_af57_ins <= VAR_ldr_uxn_opcodes_h_l2940_c40_af57_ins;
     ldr_uxn_opcodes_h_l2940_c40_af57_pc <= VAR_ldr_uxn_opcodes_h_l2940_c40_af57_pc;
     ldr_uxn_opcodes_h_l2940_c40_af57_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2940_c40_af57_previous_stack_read;
     ldr_uxn_opcodes_h_l2940_c40_af57_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2940_c40_af57_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2940_c40_af57_return_output := ldr_uxn_opcodes_h_l2940_c40_af57_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_4814] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_f726] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_4814_return_output;
     VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_f726_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_iftrue := VAR_ldr_uxn_opcodes_h_l2940_c40_af57_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c7_eb37] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output;

     -- ldr2[uxn_opcodes_h_l2941_c40_82b5] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2941_c40_82b5_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2941_c40_82b5_phase <= VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_phase;
     ldr2_uxn_opcodes_h_l2941_c40_82b5_ins <= VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_ins;
     ldr2_uxn_opcodes_h_l2941_c40_82b5_pc <= VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_pc;
     ldr2_uxn_opcodes_h_l2941_c40_82b5_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_previous_stack_read;
     ldr2_uxn_opcodes_h_l2941_c40_82b5_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_return_output := ldr2_uxn_opcodes_h_l2941_c40_82b5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_4420] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output;
     VAR_str1_uxn_opcodes_h_l2942_c40_2146_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_4420_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_iftrue := VAR_ldr2_uxn_opcodes_h_l2941_c40_82b5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c7_612f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c1_5826] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_return_output;

     -- str1[uxn_opcodes_h_l2942_c40_2146] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2942_c40_2146_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2942_c40_2146_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2942_c40_2146_phase <= VAR_str1_uxn_opcodes_h_l2942_c40_2146_phase;
     str1_uxn_opcodes_h_l2942_c40_2146_ins <= VAR_str1_uxn_opcodes_h_l2942_c40_2146_ins;
     str1_uxn_opcodes_h_l2942_c40_2146_pc <= VAR_str1_uxn_opcodes_h_l2942_c40_2146_pc;
     str1_uxn_opcodes_h_l2942_c40_2146_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2942_c40_2146_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2942_c40_2146_return_output := str1_uxn_opcodes_h_l2942_c40_2146_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_612f_return_output;
     VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_5826_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_iftrue := VAR_str1_uxn_opcodes_h_l2942_c40_2146_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c1_5a64] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_return_output;

     -- str2[uxn_opcodes_h_l2943_c40_0dd0] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2943_c40_0dd0_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2943_c40_0dd0_phase <= VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_phase;
     str2_uxn_opcodes_h_l2943_c40_0dd0_ins <= VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_ins;
     str2_uxn_opcodes_h_l2943_c40_0dd0_pc <= VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_pc;
     str2_uxn_opcodes_h_l2943_c40_0dd0_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_return_output := str2_uxn_opcodes_h_l2943_c40_0dd0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c7_a0ea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output;
     VAR_lda_uxn_opcodes_h_l2944_c40_5345_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_5a64_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_iftrue := VAR_str2_uxn_opcodes_h_l2943_c40_0dd0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c7_6310] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_return_output;

     -- lda[uxn_opcodes_h_l2944_c40_5345] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2944_c40_5345_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2944_c40_5345_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2944_c40_5345_phase <= VAR_lda_uxn_opcodes_h_l2944_c40_5345_phase;
     lda_uxn_opcodes_h_l2944_c40_5345_ins <= VAR_lda_uxn_opcodes_h_l2944_c40_5345_ins;
     lda_uxn_opcodes_h_l2944_c40_5345_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2944_c40_5345_previous_stack_read;
     lda_uxn_opcodes_h_l2944_c40_5345_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2944_c40_5345_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2944_c40_5345_return_output := lda_uxn_opcodes_h_l2944_c40_5345_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c1_a706] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_6310_return_output;
     VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_a706_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_iftrue := VAR_lda_uxn_opcodes_h_l2944_c40_5345_return_output;
     -- lda2[uxn_opcodes_h_l2945_c40_dea4] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2945_c40_dea4_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2945_c40_dea4_phase <= VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_phase;
     lda2_uxn_opcodes_h_l2945_c40_dea4_ins <= VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_ins;
     lda2_uxn_opcodes_h_l2945_c40_dea4_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_previous_stack_read;
     lda2_uxn_opcodes_h_l2945_c40_dea4_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_return_output := lda2_uxn_opcodes_h_l2945_c40_dea4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c7_94a1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c1_ca60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output;
     VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_ca60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_iftrue := VAR_lda2_uxn_opcodes_h_l2945_c40_dea4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c1_c367] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c7_ed1d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output;

     -- sta[uxn_opcodes_h_l2946_c40_9cbd] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2946_c40_9cbd_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2946_c40_9cbd_phase <= VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_phase;
     sta_uxn_opcodes_h_l2946_c40_9cbd_ins <= VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_ins;
     sta_uxn_opcodes_h_l2946_c40_9cbd_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_return_output := sta_uxn_opcodes_h_l2946_c40_9cbd_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output;
     VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_c367_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_iftrue := VAR_sta_uxn_opcodes_h_l2946_c40_9cbd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c1_56ad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c7_4fed] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output;

     -- sta2[uxn_opcodes_h_l2947_c40_af8a] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2947_c40_af8a_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2947_c40_af8a_phase <= VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_phase;
     sta2_uxn_opcodes_h_l2947_c40_af8a_ins <= VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_ins;
     sta2_uxn_opcodes_h_l2947_c40_af8a_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_return_output := sta2_uxn_opcodes_h_l2947_c40_af8a_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output;
     VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_56ad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_iftrue := VAR_sta2_uxn_opcodes_h_l2947_c40_af8a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c7_a05d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output;

     -- dei[uxn_opcodes_h_l2948_c40_f9b0] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2948_c40_f9b0_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2948_c40_f9b0_phase <= VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_phase;
     dei_uxn_opcodes_h_l2948_c40_f9b0_ins <= VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_ins;
     dei_uxn_opcodes_h_l2948_c40_f9b0_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_previous_stack_read;
     dei_uxn_opcodes_h_l2948_c40_f9b0_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_return_output := dei_uxn_opcodes_h_l2948_c40_f9b0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c1_2cd7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output;
     VAR_dei2_uxn_opcodes_h_l2949_c40_1259_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_2cd7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_iftrue := VAR_dei_uxn_opcodes_h_l2948_c40_f9b0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c7_6cd2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c1_c354] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_return_output;

     -- dei2[uxn_opcodes_h_l2949_c40_1259] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2949_c40_1259_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2949_c40_1259_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2949_c40_1259_phase <= VAR_dei2_uxn_opcodes_h_l2949_c40_1259_phase;
     dei2_uxn_opcodes_h_l2949_c40_1259_ins <= VAR_dei2_uxn_opcodes_h_l2949_c40_1259_ins;
     dei2_uxn_opcodes_h_l2949_c40_1259_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2949_c40_1259_previous_stack_read;
     dei2_uxn_opcodes_h_l2949_c40_1259_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2949_c40_1259_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2949_c40_1259_return_output := dei2_uxn_opcodes_h_l2949_c40_1259_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output;
     VAR_deo_uxn_opcodes_h_l2950_c40_110f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_c354_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_iftrue := VAR_dei2_uxn_opcodes_h_l2949_c40_1259_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c1_c8b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_return_output;

     -- deo[uxn_opcodes_h_l2950_c40_110f] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2950_c40_110f_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2950_c40_110f_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2950_c40_110f_phase <= VAR_deo_uxn_opcodes_h_l2950_c40_110f_phase;
     deo_uxn_opcodes_h_l2950_c40_110f_ins <= VAR_deo_uxn_opcodes_h_l2950_c40_110f_ins;
     deo_uxn_opcodes_h_l2950_c40_110f_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2950_c40_110f_previous_stack_read;
     deo_uxn_opcodes_h_l2950_c40_110f_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2950_c40_110f_previous_device_ram_read;
     deo_uxn_opcodes_h_l2950_c40_110f_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2950_c40_110f_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2950_c40_110f_return_output := deo_uxn_opcodes_h_l2950_c40_110f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c7_b123] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_b123_return_output;
     VAR_deo2_uxn_opcodes_h_l2951_c40_585a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_c8b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_iftrue := VAR_deo_uxn_opcodes_h_l2950_c40_110f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c7_e574] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_return_output;

     -- deo2[uxn_opcodes_h_l2951_c40_585a] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2951_c40_585a_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2951_c40_585a_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2951_c40_585a_phase <= VAR_deo2_uxn_opcodes_h_l2951_c40_585a_phase;
     deo2_uxn_opcodes_h_l2951_c40_585a_ins <= VAR_deo2_uxn_opcodes_h_l2951_c40_585a_ins;
     deo2_uxn_opcodes_h_l2951_c40_585a_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2951_c40_585a_previous_stack_read;
     deo2_uxn_opcodes_h_l2951_c40_585a_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2951_c40_585a_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2951_c40_585a_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2951_c40_585a_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2951_c40_585a_return_output := deo2_uxn_opcodes_h_l2951_c40_585a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c1_b0a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_e574_return_output;
     VAR_add_uxn_opcodes_h_l2952_c40_33e5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_b0a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_iftrue := VAR_deo2_uxn_opcodes_h_l2951_c40_585a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c1_e0b7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_return_output;

     -- add[uxn_opcodes_h_l2952_c40_33e5] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2952_c40_33e5_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2952_c40_33e5_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2952_c40_33e5_phase <= VAR_add_uxn_opcodes_h_l2952_c40_33e5_phase;
     add_uxn_opcodes_h_l2952_c40_33e5_ins <= VAR_add_uxn_opcodes_h_l2952_c40_33e5_ins;
     add_uxn_opcodes_h_l2952_c40_33e5_previous_stack_read <= VAR_add_uxn_opcodes_h_l2952_c40_33e5_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2952_c40_33e5_return_output := add_uxn_opcodes_h_l2952_c40_33e5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c7_2329] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_2329_return_output;
     VAR_add2_uxn_opcodes_h_l2953_c40_ea20_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_e0b7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_iftrue := VAR_add_uxn_opcodes_h_l2952_c40_33e5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c7_c74e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c1_c7d8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_return_output;

     -- add2[uxn_opcodes_h_l2953_c40_ea20] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2953_c40_ea20_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2953_c40_ea20_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2953_c40_ea20_phase <= VAR_add2_uxn_opcodes_h_l2953_c40_ea20_phase;
     add2_uxn_opcodes_h_l2953_c40_ea20_ins <= VAR_add2_uxn_opcodes_h_l2953_c40_ea20_ins;
     add2_uxn_opcodes_h_l2953_c40_ea20_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2953_c40_ea20_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2953_c40_ea20_return_output := add2_uxn_opcodes_h_l2953_c40_ea20_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output;
     VAR_sub_uxn_opcodes_h_l2954_c40_905d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_c7d8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_iftrue := VAR_add2_uxn_opcodes_h_l2953_c40_ea20_return_output;
     -- sub[uxn_opcodes_h_l2954_c40_905d] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2954_c40_905d_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2954_c40_905d_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2954_c40_905d_phase <= VAR_sub_uxn_opcodes_h_l2954_c40_905d_phase;
     sub_uxn_opcodes_h_l2954_c40_905d_ins <= VAR_sub_uxn_opcodes_h_l2954_c40_905d_ins;
     sub_uxn_opcodes_h_l2954_c40_905d_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2954_c40_905d_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2954_c40_905d_return_output := sub_uxn_opcodes_h_l2954_c40_905d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c1_5978] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c7_427b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_427b_return_output;
     VAR_sub2_uxn_opcodes_h_l2955_c40_135e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_5978_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_iftrue := VAR_sub_uxn_opcodes_h_l2954_c40_905d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c7_0bdd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c1_b6aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_return_output;

     -- sub2[uxn_opcodes_h_l2955_c40_135e] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2955_c40_135e_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2955_c40_135e_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2955_c40_135e_phase <= VAR_sub2_uxn_opcodes_h_l2955_c40_135e_phase;
     sub2_uxn_opcodes_h_l2955_c40_135e_ins <= VAR_sub2_uxn_opcodes_h_l2955_c40_135e_ins;
     sub2_uxn_opcodes_h_l2955_c40_135e_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2955_c40_135e_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2955_c40_135e_return_output := sub2_uxn_opcodes_h_l2955_c40_135e_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output;
     VAR_mul_uxn_opcodes_h_l2956_c40_3647_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_b6aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_iftrue := VAR_sub2_uxn_opcodes_h_l2955_c40_135e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2958_c7_8538] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c1_48dd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_return_output;

     -- mul[uxn_opcodes_h_l2956_c40_3647] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2956_c40_3647_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2956_c40_3647_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2956_c40_3647_phase <= VAR_mul_uxn_opcodes_h_l2956_c40_3647_phase;
     mul_uxn_opcodes_h_l2956_c40_3647_ins <= VAR_mul_uxn_opcodes_h_l2956_c40_3647_ins;
     mul_uxn_opcodes_h_l2956_c40_3647_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2956_c40_3647_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2956_c40_3647_return_output := mul_uxn_opcodes_h_l2956_c40_3647_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c7_8538_return_output;
     VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_48dd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_iftrue := VAR_mul_uxn_opcodes_h_l2956_c40_3647_return_output;
     -- mul2[uxn_opcodes_h_l2957_c40_08fb] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2957_c40_08fb_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2957_c40_08fb_phase <= VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_phase;
     mul2_uxn_opcodes_h_l2957_c40_08fb_ins <= VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_ins;
     mul2_uxn_opcodes_h_l2957_c40_08fb_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_return_output := mul2_uxn_opcodes_h_l2957_c40_08fb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2959_c7_867e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2958_c1_21a4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c7_867e_return_output;
     VAR_div_uxn_opcodes_h_l2958_c40_bcd6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2958_c1_21a4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_iftrue := VAR_mul2_uxn_opcodes_h_l2957_c40_08fb_return_output;
     -- div[uxn_opcodes_h_l2958_c40_bcd6] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2958_c40_bcd6_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2958_c40_bcd6_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2958_c40_bcd6_phase <= VAR_div_uxn_opcodes_h_l2958_c40_bcd6_phase;
     div_uxn_opcodes_h_l2958_c40_bcd6_ins <= VAR_div_uxn_opcodes_h_l2958_c40_bcd6_ins;
     div_uxn_opcodes_h_l2958_c40_bcd6_previous_stack_read <= VAR_div_uxn_opcodes_h_l2958_c40_bcd6_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2958_c40_bcd6_return_output := div_uxn_opcodes_h_l2958_c40_bcd6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2959_c1_4402] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2960_c7_57d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output;
     VAR_div2_uxn_opcodes_h_l2959_c40_3093_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2959_c1_4402_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_iftrue := VAR_div_uxn_opcodes_h_l2958_c40_bcd6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2960_c1_ea86] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2961_c7_8265] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_return_output;

     -- div2[uxn_opcodes_h_l2959_c40_3093] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2959_c40_3093_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2959_c40_3093_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2959_c40_3093_phase <= VAR_div2_uxn_opcodes_h_l2959_c40_3093_phase;
     div2_uxn_opcodes_h_l2959_c40_3093_ins <= VAR_div2_uxn_opcodes_h_l2959_c40_3093_ins;
     div2_uxn_opcodes_h_l2959_c40_3093_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2959_c40_3093_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2959_c40_3093_return_output := div2_uxn_opcodes_h_l2959_c40_3093_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c7_8265_return_output;
     VAR_and_uxn_opcodes_h_l2960_c40_80e8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2960_c1_ea86_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_iftrue := VAR_div2_uxn_opcodes_h_l2959_c40_3093_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2962_c7_4594] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2961_c1_95f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_return_output;

     -- and[uxn_opcodes_h_l2960_c40_80e8] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2960_c40_80e8_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2960_c40_80e8_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2960_c40_80e8_phase <= VAR_and_uxn_opcodes_h_l2960_c40_80e8_phase;
     and_uxn_opcodes_h_l2960_c40_80e8_ins <= VAR_and_uxn_opcodes_h_l2960_c40_80e8_ins;
     and_uxn_opcodes_h_l2960_c40_80e8_previous_stack_read <= VAR_and_uxn_opcodes_h_l2960_c40_80e8_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2960_c40_80e8_return_output := and_uxn_opcodes_h_l2960_c40_80e8_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c7_4594_return_output;
     VAR_and2_uxn_opcodes_h_l2961_c40_9182_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2961_c1_95f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_iftrue := VAR_and_uxn_opcodes_h_l2960_c40_80e8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2963_c7_cb36] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2962_c1_4d69] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_return_output;

     -- and2[uxn_opcodes_h_l2961_c40_9182] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2961_c40_9182_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2961_c40_9182_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2961_c40_9182_phase <= VAR_and2_uxn_opcodes_h_l2961_c40_9182_phase;
     and2_uxn_opcodes_h_l2961_c40_9182_ins <= VAR_and2_uxn_opcodes_h_l2961_c40_9182_ins;
     and2_uxn_opcodes_h_l2961_c40_9182_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2961_c40_9182_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2961_c40_9182_return_output := and2_uxn_opcodes_h_l2961_c40_9182_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output;
     VAR_ora_uxn_opcodes_h_l2962_c40_2e63_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4d69_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_iftrue := VAR_and2_uxn_opcodes_h_l2961_c40_9182_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2963_c1_b2ed] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2964_c7_2dfb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output;

     -- ora[uxn_opcodes_h_l2962_c40_2e63] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2962_c40_2e63_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2962_c40_2e63_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2962_c40_2e63_phase <= VAR_ora_uxn_opcodes_h_l2962_c40_2e63_phase;
     ora_uxn_opcodes_h_l2962_c40_2e63_ins <= VAR_ora_uxn_opcodes_h_l2962_c40_2e63_ins;
     ora_uxn_opcodes_h_l2962_c40_2e63_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2962_c40_2e63_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2962_c40_2e63_return_output := ora_uxn_opcodes_h_l2962_c40_2e63_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output;
     VAR_ora2_uxn_opcodes_h_l2963_c40_9410_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2963_c1_b2ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_iftrue := VAR_ora_uxn_opcodes_h_l2962_c40_2e63_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2964_c1_daa3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2965_c7_aeb8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output;

     -- ora2[uxn_opcodes_h_l2963_c40_9410] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2963_c40_9410_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2963_c40_9410_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2963_c40_9410_phase <= VAR_ora2_uxn_opcodes_h_l2963_c40_9410_phase;
     ora2_uxn_opcodes_h_l2963_c40_9410_ins <= VAR_ora2_uxn_opcodes_h_l2963_c40_9410_ins;
     ora2_uxn_opcodes_h_l2963_c40_9410_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2963_c40_9410_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2963_c40_9410_return_output := ora2_uxn_opcodes_h_l2963_c40_9410_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output;
     VAR_eor_uxn_opcodes_h_l2964_c40_3598_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2964_c1_daa3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_iftrue := VAR_ora2_uxn_opcodes_h_l2963_c40_9410_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2965_c1_ac59] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_return_output;

     -- eor[uxn_opcodes_h_l2964_c40_3598] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2964_c40_3598_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2964_c40_3598_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2964_c40_3598_phase <= VAR_eor_uxn_opcodes_h_l2964_c40_3598_phase;
     eor_uxn_opcodes_h_l2964_c40_3598_ins <= VAR_eor_uxn_opcodes_h_l2964_c40_3598_ins;
     eor_uxn_opcodes_h_l2964_c40_3598_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2964_c40_3598_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2964_c40_3598_return_output := eor_uxn_opcodes_h_l2964_c40_3598_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2966_c7_821f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c7_821f_return_output;
     VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2965_c1_ac59_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_iftrue := VAR_eor_uxn_opcodes_h_l2964_c40_3598_return_output;
     -- eor2[uxn_opcodes_h_l2965_c40_5e36] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2965_c40_5e36_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2965_c40_5e36_phase <= VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_phase;
     eor2_uxn_opcodes_h_l2965_c40_5e36_ins <= VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_ins;
     eor2_uxn_opcodes_h_l2965_c40_5e36_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_return_output := eor2_uxn_opcodes_h_l2965_c40_5e36_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2966_c1_e03d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2967_c7_592f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c7_592f_return_output;
     VAR_sft_uxn_opcodes_h_l2966_c40_0188_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2966_c1_e03d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_iftrue := VAR_eor2_uxn_opcodes_h_l2965_c40_5e36_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2967_c1_22d2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_return_output;

     -- sft[uxn_opcodes_h_l2966_c40_0188] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2966_c40_0188_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2966_c40_0188_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2966_c40_0188_phase <= VAR_sft_uxn_opcodes_h_l2966_c40_0188_phase;
     sft_uxn_opcodes_h_l2966_c40_0188_ins <= VAR_sft_uxn_opcodes_h_l2966_c40_0188_ins;
     sft_uxn_opcodes_h_l2966_c40_0188_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2966_c40_0188_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2966_c40_0188_return_output := sft_uxn_opcodes_h_l2966_c40_0188_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2967_c1_22d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_iftrue := VAR_sft_uxn_opcodes_h_l2966_c40_0188_return_output;
     -- sft2[uxn_opcodes_h_l2967_c40_ddea] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2967_c40_ddea_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2967_c40_ddea_phase <= VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_phase;
     sft2_uxn_opcodes_h_l2967_c40_ddea_ins <= VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_ins;
     sft2_uxn_opcodes_h_l2967_c40_ddea_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_return_output := sft2_uxn_opcodes_h_l2967_c40_ddea_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_iftrue := VAR_sft2_uxn_opcodes_h_l2967_c40_ddea_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2967_c7_592f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_cond;
     opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_return_output := opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2967_c7_592f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2966_c7_821f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_cond;
     opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_return_output := opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2966_c7_821f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2965_c7_aeb8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_cond;
     opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output := opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2965_c7_aeb8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2964_c7_2dfb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_cond;
     opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output := opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2964_c7_2dfb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2963_c7_cb36] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_cond;
     opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output := opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2963_c7_cb36_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2962_c7_4594] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_cond;
     opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_return_output := opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2962_c7_4594_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2961_c7_8265] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_cond;
     opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_return_output := opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2961_c7_8265_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2960_c7_57d6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_cond;
     opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output := opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2960_c7_57d6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2959_c7_867e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_cond;
     opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_return_output := opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2959_c7_867e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2958_c7_8538] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_cond;
     opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_return_output := opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2958_c7_8538_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2957_c7_0bdd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_cond;
     opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output := opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_0bdd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2956_c7_427b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_cond;
     opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_return_output := opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_427b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2955_c7_c74e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_cond;
     opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output := opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c74e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2954_c7_2329] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_cond;
     opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_return_output := opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_2329_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2953_c7_e574] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_cond;
     opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_return_output := opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_e574_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2952_c7_b123] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_cond;
     opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_return_output := opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_b123_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2951_c7_6cd2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_cond;
     opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output := opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_6cd2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2950_c7_a05d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_cond;
     opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output := opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_a05d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2949_c7_4fed] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_cond;
     opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output := opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_4fed_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2948_c7_ed1d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_cond;
     opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output := opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_ed1d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2947_c7_94a1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_cond;
     opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output := opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_94a1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2946_c7_6310] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_cond;
     opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_return_output := opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_6310_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2945_c7_a0ea] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_cond;
     opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output := opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_a0ea_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2944_c7_612f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_cond;
     opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_return_output := opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_612f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2943_c7_eb37] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_cond;
     opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output := opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_eb37_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2942_c7_4814] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_cond;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_return_output := opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_4814_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2941_c7_89eb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_cond;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output := opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_89eb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_d70a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_d70a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_dc07] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_dc07_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_da7d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_da7d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_fb03] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_fb03_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_cd61] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_cd61_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_e4b0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_e4b0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_88b6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_88b6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_4281] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_4281_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_5530] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_5530_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_522d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_522d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_7e8d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_7e8d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_02a6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_02a6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_c00c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_c00c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_8f72] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_8f72_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_710b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_710b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_88c5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_88c5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_45dd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_45dd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_611c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_611c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_efc4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_efc4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_4f19] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_4f19_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_1fbf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_1fbf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_4a47] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_4a47_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_8b16] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_8b16_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_d98d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_d98d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_97d1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_97d1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_7955] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_7955_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_0291] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_0291_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_7984] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_7984_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_bc75] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_bc75_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_858f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_858f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_f8d3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_f8d3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_1c68] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_1c68_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_08a2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_08a2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_5799] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_5799_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_5365] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_5365_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_0e8c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_0e8c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_0a5e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_0a5e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_be1c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_be1c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_2123] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_2123_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_3a52] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_3a52_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_a8a6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_a8a6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_42ac] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_42ac_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c2_8aa4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2971_c17_95d4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2971_c17_95d4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2991_c34_e517] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2991_c34_e517_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2990_c40_1fbf] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2990_c40_1fbf_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2979_c68_07c1] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2979_c68_07c1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2997_c32_fe50] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2997_c32_fe50_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2996_l2984_DUPLICATE_a000 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2996_l2984_DUPLICATE_a000_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2995_c37_3a66] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2995_c37_3a66_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2994_c34_ee09] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2994_c34_ee09_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2985_c3_633d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2985_c3_633d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2992_c30_74cc] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2992_c30_74cc_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2974_l2976_DUPLICATE_c150 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2974_l2976_DUPLICATE_c150_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2993_c33_d73b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2993_c33_d73b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2989_c39_7394] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2989_c39_7394_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output.device_ram_address;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2971_c17_95d4_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2985_c3_633d_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2996_l2984_DUPLICATE_a000_return_output;
     -- BIN_OP_XOR[uxn_opcodes_h_l2971_c2_e031] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_left;
     BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_return_output := BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_return_output;

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2974_l2976_DUPLICATE_57a8 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2974_l2976_DUPLICATE_57a8_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2974_l2976_DUPLICATE_c150_return_output);

     -- CAST_TO_uint9_t[uxn_opcodes_h_l2979_c58_964c] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2979_c58_964c_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2979_c68_07c1_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2875_l2999_DUPLICATE_09d8 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2875_l2999_DUPLICATE_09d8_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2898_c2_8aa4_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2989_c39_7394_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2990_c40_1fbf_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2991_c34_e517_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2992_c30_74cc_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2993_c33_d73b_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2994_c34_ee09_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2995_c37_3a66_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2996_l2984_DUPLICATE_a000_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2997_c32_fe50_return_output);

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2979_c29_6a21_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_return_output;
     VAR_MUX_uxn_opcodes_h_l2980_c20_bbc7_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2971_c2_e031_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2974_l2976_DUPLICATE_57a8_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2974_l2976_DUPLICATE_57a8_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2979_c58_964c_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2875_l2999_DUPLICATE_09d8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2875_l2999_DUPLICATE_09d8_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2976_c3_f6ea] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_return_output;

     -- MUX[uxn_opcodes_h_l2980_c20_bbc7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2980_c20_bbc7_cond <= VAR_MUX_uxn_opcodes_h_l2980_c20_bbc7_cond;
     MUX_uxn_opcodes_h_l2980_c20_bbc7_iftrue <= VAR_MUX_uxn_opcodes_h_l2980_c20_bbc7_iftrue;
     MUX_uxn_opcodes_h_l2980_c20_bbc7_iffalse <= VAR_MUX_uxn_opcodes_h_l2980_c20_bbc7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2980_c20_bbc7_return_output := MUX_uxn_opcodes_h_l2980_c20_bbc7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2974_c3_804f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2974_c3_43c8 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2974_c3_804f_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2976_c3_b17a := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2976_c3_f6ea_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_right := VAR_MUX_uxn_opcodes_h_l2980_c20_bbc7_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_iffalse := VAR_sp0_uxn_opcodes_h_l2976_c3_b17a;
     VAR_sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_iftrue := VAR_sp1_uxn_opcodes_h_l2974_c3_43c8;
     -- sp0_MUX[uxn_opcodes_h_l2973_c2_10c6] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_cond;
     sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_iftrue;
     sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output := sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2973_c2_10c6] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_cond;
     sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_iftrue;
     sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output := sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2979_c29_6a21_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output;
     VAR_MUX_uxn_opcodes_h_l2979_c29_6a21_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2973_c2_10c6_return_output;
     -- MUX[uxn_opcodes_h_l2979_c29_6a21] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2979_c29_6a21_cond <= VAR_MUX_uxn_opcodes_h_l2979_c29_6a21_cond;
     MUX_uxn_opcodes_h_l2979_c29_6a21_iftrue <= VAR_MUX_uxn_opcodes_h_l2979_c29_6a21_iftrue;
     MUX_uxn_opcodes_h_l2979_c29_6a21_iffalse <= VAR_MUX_uxn_opcodes_h_l2979_c29_6a21_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2979_c29_6a21_return_output := MUX_uxn_opcodes_h_l2979_c29_6a21_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2979_c19_e300] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2979_c19_e300_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2979_c29_6a21_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2979_c19_e300_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2979_c19_e166] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_return_output;

     -- Submodule level 156
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2979_c19_e166_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2980_c2_0594] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_return_output;

     -- Submodule level 157
     VAR_stack_address_uxn_opcodes_h_l2980_c2_fee8 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2980_c2_0594_return_output, 9);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2980_c2_fee8;
     VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_stack_address := VAR_stack_address_uxn_opcodes_h_l2980_c2_fee8;
     -- stack_ram_update[uxn_opcodes_h_l2982_c24_260d] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2982_c24_260d_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2982_c24_260d_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_stack_address;
     stack_ram_update_uxn_opcodes_h_l2982_c24_260d_value <= VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_value;
     stack_ram_update_uxn_opcodes_h_l2982_c24_260d_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_return_output := stack_ram_update_uxn_opcodes_h_l2982_c24_260d_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2982_c24_260d_return_output;
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
