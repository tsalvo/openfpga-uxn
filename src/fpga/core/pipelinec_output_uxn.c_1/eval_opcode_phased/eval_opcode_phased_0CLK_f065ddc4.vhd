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
entity eval_opcode_phased_0CLK_f065ddc4 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_f065ddc4;
architecture arch of eval_opcode_phased_0CLK_f065ddc4 is
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
-- BIN_OP_AND[uxn_opcodes_h_l2880_c14_af8a]
signal BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2881_c14_f1d7]
signal BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2881_c14_bda9]
signal BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2881_c14_8ce8]
signal UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2881_c14_8225]
signal BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2881_c14_bde4]
signal MUX_uxn_opcodes_h_l2881_c14_bde4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2881_c14_bde4_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2881_c14_bde4_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2881_c14_bde4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2882_c8_f712]
signal MUX_uxn_opcodes_h_l2882_c8_f712_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2882_c8_f712_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2882_c8_f712_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2882_c8_f712_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c6_8129]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_04b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output : unsigned(0 downto 0);

-- is_wait_MUX[uxn_opcodes_h_l2888_c2_55dc]
signal is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c2_55dc]
signal opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output : opcode_result_t;

-- brk[uxn_opcodes_h_l2888_c48_a8f0]
signal brk_uxn_opcodes_h_l2888_c48_a8f0_phase : unsigned(7 downto 0);
signal brk_uxn_opcodes_h_l2888_c48_a8f0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_c457]
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_aa08]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_2b44]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2889_c7_04b4]
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2889_c40_1c1d]
signal jci_uxn_opcodes_h_l2889_c40_1c1d_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2889_c40_1c1d_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2889_c40_1c1d_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2889_c40_1c1d_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2889_c40_1c1d_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2889_c40_1c1d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_f109]
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_fbd6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_6eb5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2890_c7_2b44]
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2890_c40_d8fc]
signal jmi_uxn_opcodes_h_l2890_c40_d8fc_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2890_c40_d8fc_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2890_c40_d8fc_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2890_c40_d8fc_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2890_c40_d8fc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_f92a]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_2074]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_60a7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2891_c7_6eb5]
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2891_c40_08d2]
signal jsi_uxn_opcodes_h_l2891_c40_08d2_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2891_c40_08d2_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2891_c40_08d2_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2891_c40_08d2_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2891_c40_08d2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_d36d]
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_26a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_f20d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2892_c7_60a7]
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2892_c40_eba5]
signal lit_uxn_opcodes_h_l2892_c40_eba5_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2892_c40_eba5_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2892_c40_eba5_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2892_c40_eba5_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2892_c40_eba5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_6fee]
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_efd9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_f749]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2893_c7_f20d]
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2893_c40_59fa]
signal lit2_uxn_opcodes_h_l2893_c40_59fa_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2893_c40_59fa_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2893_c40_59fa_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2893_c40_59fa_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2893_c40_59fa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_a762]
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_964a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_7087]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2894_c7_f749]
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2894_c40_0fd7]
signal lit_uxn_opcodes_h_l2894_c40_0fd7_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2894_c40_0fd7_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2894_c40_0fd7_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2894_c40_0fd7_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2894_c40_0fd7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_d446]
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_8c38]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_b5a2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2895_c7_7087]
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2895_c40_fe58]
signal lit2_uxn_opcodes_h_l2895_c40_fe58_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2895_c40_fe58_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2895_c40_fe58_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2895_c40_fe58_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2895_c40_fe58_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_8392]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_9f44]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_37ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2896_c7_b5a2]
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2896_c40_1912]
signal inc_uxn_opcodes_h_l2896_c40_1912_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2896_c40_1912_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2896_c40_1912_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2896_c40_1912_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2896_c40_1912_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_f24b]
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_0cd6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_8d31]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2897_c7_37ef]
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2897_c40_2036]
signal inc2_uxn_opcodes_h_l2897_c40_2036_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2897_c40_2036_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2897_c40_2036_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2897_c40_2036_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2897_c40_2036_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_8104]
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_4822]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_fcfc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2898_c7_8d31]
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2898_c40_33f1]
signal pop_uxn_opcodes_h_l2898_c40_33f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2898_c40_33f1_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2898_c40_33f1_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2898_c40_33f1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_3f8d]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_f92f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_8573]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2899_c7_fcfc]
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2899_c40_caf6]
signal pop2_uxn_opcodes_h_l2899_c40_caf6_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2899_c40_caf6_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2899_c40_caf6_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2899_c40_caf6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_249d]
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_29df]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_e4fc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2900_c7_8573]
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2900_c40_c7ad]
signal nip_uxn_opcodes_h_l2900_c40_c7ad_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2900_c40_c7ad_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2900_c40_c7ad_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2900_c40_c7ad_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2900_c40_c7ad_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_8398]
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_2675]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_3192]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2901_c7_e4fc]
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2901_c40_2f88]
signal nip2_uxn_opcodes_h_l2901_c40_2f88_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2901_c40_2f88_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2901_c40_2f88_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2901_c40_2f88_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2901_c40_2f88_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_6d64]
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_9541]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_fc01]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2902_c7_3192]
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2902_c40_779b]
signal swp_uxn_opcodes_h_l2902_c40_779b_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2902_c40_779b_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2902_c40_779b_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2902_c40_779b_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2902_c40_779b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_134b]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_cb03]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_4114]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2903_c7_fc01]
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2903_c40_40a2]
signal swp2_uxn_opcodes_h_l2903_c40_40a2_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2903_c40_40a2_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2903_c40_40a2_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2903_c40_40a2_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2903_c40_40a2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_022f]
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_3474]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_9b6d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2904_c7_4114]
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2904_c40_d162]
signal rot_uxn_opcodes_h_l2904_c40_d162_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2904_c40_d162_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2904_c40_d162_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2904_c40_d162_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2904_c40_d162_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_0c6a]
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_36a4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_0ba6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2905_c7_9b6d]
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2905_c40_a0e1]
signal rot2_uxn_opcodes_h_l2905_c40_a0e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2905_c40_a0e1_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2905_c40_a0e1_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2905_c40_a0e1_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2905_c40_a0e1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_ccca]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_8b26]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_8a17]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2906_c7_0ba6]
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2906_c40_4842]
signal dup_uxn_opcodes_h_l2906_c40_4842_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2906_c40_4842_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2906_c40_4842_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2906_c40_4842_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2906_c40_4842_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_4bb6]
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_16f6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_f1b4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2907_c7_8a17]
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2907_c40_f42b]
signal dup2_uxn_opcodes_h_l2907_c40_f42b_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2907_c40_f42b_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2907_c40_f42b_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2907_c40_f42b_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2907_c40_f42b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_d556]
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_a4b9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_53ac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2908_c7_f1b4]
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2908_c40_a4fe]
signal ovr_uxn_opcodes_h_l2908_c40_a4fe_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2908_c40_a4fe_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2908_c40_a4fe_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2908_c40_a4fe_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2908_c40_a4fe_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_7ad7]
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_8fe6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_7a35]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2909_c7_53ac]
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2909_c40_8dbf]
signal ovr2_uxn_opcodes_h_l2909_c40_8dbf_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2909_c40_8dbf_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2909_c40_8dbf_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2909_c40_8dbf_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2909_c40_8dbf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_bdc4]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_d95b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_10ff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2910_c7_7a35]
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2910_c40_9012]
signal equ_uxn_opcodes_h_l2910_c40_9012_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2910_c40_9012_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2910_c40_9012_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2910_c40_9012_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2910_c40_9012_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_064e]
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_a939]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_dfdc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2911_c7_10ff]
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2911_c40_fe28]
signal equ2_uxn_opcodes_h_l2911_c40_fe28_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2911_c40_fe28_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2911_c40_fe28_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2911_c40_fe28_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2911_c40_fe28_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_1311]
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_5c29]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_f77c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2912_c7_dfdc]
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2912_c40_1abf]
signal neq_uxn_opcodes_h_l2912_c40_1abf_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2912_c40_1abf_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2912_c40_1abf_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2912_c40_1abf_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2912_c40_1abf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_8c70]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_2e17]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_4e31]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2913_c7_f77c]
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2913_c40_ec26]
signal neq2_uxn_opcodes_h_l2913_c40_ec26_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2913_c40_ec26_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2913_c40_ec26_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2913_c40_ec26_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2913_c40_ec26_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_2fb9]
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_59f2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_0136]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2914_c7_4e31]
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2914_c40_a832]
signal gth_uxn_opcodes_h_l2914_c40_a832_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2914_c40_a832_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2914_c40_a832_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2914_c40_a832_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2914_c40_a832_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_8740]
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_072a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_d5c2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2915_c7_0136]
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2915_c40_b990]
signal gth2_uxn_opcodes_h_l2915_c40_b990_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2915_c40_b990_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2915_c40_b990_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2915_c40_b990_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2915_c40_b990_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_abdc]
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_18a0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_b7d6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2916_c7_d5c2]
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2916_c40_b59f]
signal lth_uxn_opcodes_h_l2916_c40_b59f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2916_c40_b59f_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2916_c40_b59f_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2916_c40_b59f_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2916_c40_b59f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_bf2b]
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_fb3f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_906b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2917_c7_b7d6]
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2917_c40_85ca]
signal lth2_uxn_opcodes_h_l2917_c40_85ca_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2917_c40_85ca_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2917_c40_85ca_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2917_c40_85ca_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2917_c40_85ca_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_b1c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_ee44]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_abb8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2918_c7_906b]
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2918_c40_a3b4]
signal jmp_uxn_opcodes_h_l2918_c40_a3b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2918_c40_a3b4_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2918_c40_a3b4_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2918_c40_a3b4_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2918_c40_a3b4_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2918_c40_a3b4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_2f0c]
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_e34b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_4e73]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2919_c7_abb8]
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2919_c40_efa4]
signal jmp2_uxn_opcodes_h_l2919_c40_efa4_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2919_c40_efa4_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2919_c40_efa4_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2919_c40_efa4_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2919_c40_efa4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_0c0c]
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_d044]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_6fbe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2920_c7_4e73]
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2920_c40_970c]
signal jcn_uxn_opcodes_h_l2920_c40_970c_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2920_c40_970c_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2920_c40_970c_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2920_c40_970c_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2920_c40_970c_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2920_c40_970c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_d4bd]
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_48dc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_e17c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2921_c7_6fbe]
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2921_c40_9218]
signal jcn2_uxn_opcodes_h_l2921_c40_9218_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2921_c40_9218_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2921_c40_9218_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2921_c40_9218_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2921_c40_9218_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_d1b3]
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_8709]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_292a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2922_c7_e17c]
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2922_c40_92be]
signal jsr_uxn_opcodes_h_l2922_c40_92be_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2922_c40_92be_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2922_c40_92be_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2922_c40_92be_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2922_c40_92be_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2922_c40_92be_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_1a3c]
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_9460]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_4bdf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2923_c7_292a]
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2923_c40_ceaf]
signal jsr2_uxn_opcodes_h_l2923_c40_ceaf_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2923_c40_ceaf_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2923_c40_ceaf_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2923_c40_ceaf_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2923_c40_ceaf_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2923_c40_ceaf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_73e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_48b7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_3477]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2924_c7_4bdf]
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2924_c40_8a87]
signal sth_uxn_opcodes_h_l2924_c40_8a87_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2924_c40_8a87_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2924_c40_8a87_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2924_c40_8a87_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2924_c40_8a87_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_633d]
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_26cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_93c6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2925_c7_3477]
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2925_c40_b059]
signal sth2_uxn_opcodes_h_l2925_c40_b059_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2925_c40_b059_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2925_c40_b059_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2925_c40_b059_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2925_c40_b059_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_fcdf]
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_0223]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_c6a8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2926_c7_93c6]
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2926_c40_b163]
signal ldz_uxn_opcodes_h_l2926_c40_b163_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2926_c40_b163_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2926_c40_b163_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2926_c40_b163_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2926_c40_b163_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2926_c40_b163_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_f39d]
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_362f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_75a9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2927_c7_c6a8]
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2927_c40_d69a]
signal ldz2_uxn_opcodes_h_l2927_c40_d69a_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2927_c40_d69a_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2927_c40_d69a_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2927_c40_d69a_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2927_c40_d69a_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2927_c40_d69a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_5cc8]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_e157]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_f392]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2928_c7_75a9]
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2928_c40_575e]
signal stz_uxn_opcodes_h_l2928_c40_575e_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2928_c40_575e_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2928_c40_575e_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2928_c40_575e_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2928_c40_575e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_95a7]
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_cd58]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_43dc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2929_c7_f392]
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2929_c40_650d]
signal stz2_uxn_opcodes_h_l2929_c40_650d_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2929_c40_650d_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2929_c40_650d_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2929_c40_650d_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2929_c40_650d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_f932]
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_19ed]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_bb81]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2930_c7_43dc]
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2930_c40_65e3]
signal ldr_uxn_opcodes_h_l2930_c40_65e3_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2930_c40_65e3_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2930_c40_65e3_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2930_c40_65e3_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2930_c40_65e3_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2930_c40_65e3_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2930_c40_65e3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_8192]
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_c185]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_68af]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2931_c7_bb81]
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2931_c40_936e]
signal ldr2_uxn_opcodes_h_l2931_c40_936e_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2931_c40_936e_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2931_c40_936e_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2931_c40_936e_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2931_c40_936e_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2931_c40_936e_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2931_c40_936e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_4fbf]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_d2fe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_1577]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2932_c7_68af]
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2932_c40_3137]
signal str1_uxn_opcodes_h_l2932_c40_3137_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2932_c40_3137_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2932_c40_3137_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2932_c40_3137_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2932_c40_3137_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2932_c40_3137_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_34e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_1a9e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_098f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2933_c7_1577]
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2933_c40_587f]
signal str2_uxn_opcodes_h_l2933_c40_587f_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2933_c40_587f_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2933_c40_587f_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2933_c40_587f_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2933_c40_587f_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2933_c40_587f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_cb73]
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_2ebe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_0065]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2934_c7_098f]
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2934_c40_d8ae]
signal lda_uxn_opcodes_h_l2934_c40_d8ae_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2934_c40_d8ae_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2934_c40_d8ae_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2934_c40_d8ae_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2934_c40_d8ae_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2934_c40_d8ae_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_2685]
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_3f21]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_fdc3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2935_c7_0065]
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2935_c40_c21e]
signal lda2_uxn_opcodes_h_l2935_c40_c21e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2935_c40_c21e_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2935_c40_c21e_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2935_c40_c21e_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2935_c40_c21e_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2935_c40_c21e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_65a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_bf90]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_42c3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2936_c7_fdc3]
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2936_c40_6e8d]
signal sta_uxn_opcodes_h_l2936_c40_6e8d_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2936_c40_6e8d_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2936_c40_6e8d_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2936_c40_6e8d_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2936_c40_6e8d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_a40b]
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_539c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_e369]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2937_c7_42c3]
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2937_c40_a4fa]
signal sta2_uxn_opcodes_h_l2937_c40_a4fa_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2937_c40_a4fa_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2937_c40_a4fa_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2937_c40_a4fa_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2937_c40_a4fa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_a992]
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_f37b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_e2c3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2938_c7_e369]
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2938_c40_ad7d]
signal dei_uxn_opcodes_h_l2938_c40_ad7d_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2938_c40_ad7d_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2938_c40_ad7d_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2938_c40_ad7d_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2938_c40_ad7d_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2938_c40_ad7d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_3cf3]
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_240d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_15f9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2939_c7_e2c3]
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2939_c40_d10b]
signal dei2_uxn_opcodes_h_l2939_c40_d10b_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2939_c40_d10b_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2939_c40_d10b_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2939_c40_d10b_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2939_c40_d10b_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2939_c40_d10b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_c97b]
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_0fb8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_03a2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2940_c7_15f9]
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2940_c40_f622]
signal deo_uxn_opcodes_h_l2940_c40_f622_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2940_c40_f622_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2940_c40_f622_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2940_c40_f622_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2940_c40_f622_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2940_c40_f622_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2940_c40_f622_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_8b4c]
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_d27d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_81ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2941_c7_03a2]
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2941_c40_4576]
signal deo2_uxn_opcodes_h_l2941_c40_4576_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2941_c40_4576_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2941_c40_4576_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2941_c40_4576_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2941_c40_4576_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2941_c40_4576_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2941_c40_4576_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_82ef]
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_b571]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c7_76ee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2942_c7_81ec]
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2942_c40_a15e]
signal add_uxn_opcodes_h_l2942_c40_a15e_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2942_c40_a15e_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2942_c40_a15e_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2942_c40_a15e_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2942_c40_a15e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2943_c11_2b33]
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c1_20c2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c7_64af]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2943_c7_76ee]
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2943_c40_3f93]
signal add2_uxn_opcodes_h_l2943_c40_3f93_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2943_c40_3f93_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2943_c40_3f93_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2943_c40_3f93_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2943_c40_3f93_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_edf1]
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c1_e5f8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c7_f73f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2944_c7_64af]
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2944_c40_06f0]
signal sub_uxn_opcodes_h_l2944_c40_06f0_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2944_c40_06f0_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2944_c40_06f0_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2944_c40_06f0_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2944_c40_06f0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2945_c11_2725]
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c1_1a70]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c7_26bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2945_c7_f73f]
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2945_c40_e61d]
signal sub2_uxn_opcodes_h_l2945_c40_e61d_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2945_c40_e61d_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2945_c40_e61d_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2945_c40_e61d_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2945_c40_e61d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2946_c11_d235]
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c1_0308]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c7_eb75]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2946_c7_26bf]
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2946_c40_d2e1]
signal mul_uxn_opcodes_h_l2946_c40_d2e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2946_c40_d2e1_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2946_c40_d2e1_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2946_c40_d2e1_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2946_c40_d2e1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2947_c11_d20a]
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c1_d2c5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c7_1435]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2947_c7_eb75]
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2947_c40_01f6]
signal mul2_uxn_opcodes_h_l2947_c40_01f6_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2947_c40_01f6_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2947_c40_01f6_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2947_c40_01f6_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2947_c40_01f6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2948_c11_18cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c1_b85d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c7_a6be]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2948_c7_1435]
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2948_c40_4cc1]
signal div_uxn_opcodes_h_l2948_c40_4cc1_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2948_c40_4cc1_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2948_c40_4cc1_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2948_c40_4cc1_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2948_c40_4cc1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2949_c11_c520]
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c1_6956]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c7_c600]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2949_c7_a6be]
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2949_c40_64e2]
signal div2_uxn_opcodes_h_l2949_c40_64e2_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2949_c40_64e2_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2949_c40_64e2_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2949_c40_64e2_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2949_c40_64e2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2950_c11_9db3]
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c1_ec18]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c7_bc37]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2950_c7_c600]
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2950_c40_c59f]
signal and_uxn_opcodes_h_l2950_c40_c59f_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2950_c40_c59f_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2950_c40_c59f_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2950_c40_c59f_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2950_c40_c59f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2951_c11_fecb]
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c1_de3f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c7_f515]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2951_c7_bc37]
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2951_c40_ae80]
signal and2_uxn_opcodes_h_l2951_c40_ae80_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2951_c40_ae80_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2951_c40_ae80_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2951_c40_ae80_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2951_c40_ae80_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_2500]
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c1_4121]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c7_70e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2952_c7_f515]
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2952_c40_b07d]
signal ora_uxn_opcodes_h_l2952_c40_b07d_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2952_c40_b07d_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2952_c40_b07d_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2952_c40_b07d_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2952_c40_b07d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2953_c11_dab6]
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c1_39be]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c7_e9d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2953_c7_70e6]
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2953_c40_d3c9]
signal ora2_uxn_opcodes_h_l2953_c40_d3c9_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2953_c40_d3c9_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2953_c40_d3c9_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2953_c40_d3c9_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2953_c40_d3c9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2954_c11_d085]
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c1_d219]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c7_c851]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2954_c7_e9d5]
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2954_c40_9707]
signal eor_uxn_opcodes_h_l2954_c40_9707_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2954_c40_9707_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2954_c40_9707_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2954_c40_9707_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2954_c40_9707_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2955_c11_62ad]
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c1_2499]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c7_3f73]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2955_c7_c851]
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2955_c40_eb72]
signal eor2_uxn_opcodes_h_l2955_c40_eb72_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2955_c40_eb72_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2955_c40_eb72_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2955_c40_eb72_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2955_c40_eb72_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2956_c11_df87]
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c1_1f88]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c7_50f2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2956_c7_3f73]
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2956_c40_e6a7]
signal sft_uxn_opcodes_h_l2956_c40_e6a7_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2956_c40_e6a7_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2956_c40_e6a7_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2956_c40_e6a7_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2956_c40_e6a7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2957_c11_a5f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c1_6926]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2957_c7_50f2]
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2957_c40_7e12]
signal sft2_uxn_opcodes_h_l2957_c40_7e12_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2957_c40_7e12_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2957_c40_7e12_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2957_c40_7e12_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2957_c40_7e12_return_output : opcode_result_t;

-- CONST_SR_6[uxn_opcodes_h_l2959_c16_e14e]
signal CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2960_c2_6cd8]
signal BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2962_c2_c726]
signal sp0_MUX_uxn_opcodes_h_l2962_c2_c726_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2962_c2_c726_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2962_c2_c726_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2962_c2_c726_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2962_c2_c726]
signal sp1_MUX_uxn_opcodes_h_l2962_c2_c726_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2962_c2_c726_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2962_c2_c726_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2962_c2_c726_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2963_c3_13d9]
signal BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2965_c3_e127]
signal BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2968_c29_22ba]
signal MUX_uxn_opcodes_h_l2968_c29_22ba_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2968_c29_22ba_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2968_c29_22ba_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2968_c29_22ba_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2968_c19_7d2c]
signal BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2969_c20_878e]
signal MUX_uxn_opcodes_h_l2969_c20_878e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2969_c20_878e_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2969_c20_878e_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2969_c20_878e_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2969_c2_47c4]
signal BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_left : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_return_output : unsigned(9 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2971_c24_3dbc]
signal stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a
BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_left,
BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_right,
BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7
BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_left,
BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_right,
BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9
BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_left,
BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_right,
BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8
UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8 : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225
BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225 : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_left,
BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_right,
BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_return_output);

-- MUX_uxn_opcodes_h_l2881_c14_bde4
MUX_uxn_opcodes_h_l2881_c14_bde4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2881_c14_bde4_cond,
MUX_uxn_opcodes_h_l2881_c14_bde4_iftrue,
MUX_uxn_opcodes_h_l2881_c14_bde4_iffalse,
MUX_uxn_opcodes_h_l2881_c14_bde4_return_output);

-- MUX_uxn_opcodes_h_l2882_c8_f712
MUX_uxn_opcodes_h_l2882_c8_f712 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2882_c8_f712_cond,
MUX_uxn_opcodes_h_l2882_c8_f712_iftrue,
MUX_uxn_opcodes_h_l2882_c8_f712_iffalse,
MUX_uxn_opcodes_h_l2882_c8_f712_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129
BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc
is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_cond,
is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_iftrue,
is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_iffalse,
is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc
opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output);

-- brk_uxn_opcodes_h_l2888_c48_a8f0
brk_uxn_opcodes_h_l2888_c48_a8f0 : entity work.brk_0CLK_b45f1687 port map (
brk_uxn_opcodes_h_l2888_c48_a8f0_phase,
brk_uxn_opcodes_h_l2888_c48_a8f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_left,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_right,
BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4
opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_cond,
opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output);

-- jci_uxn_opcodes_h_l2889_c40_1c1d
jci_uxn_opcodes_h_l2889_c40_1c1d : entity work.jci_0CLK_4351dde2 port map (
clk,
jci_uxn_opcodes_h_l2889_c40_1c1d_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2889_c40_1c1d_phase,
jci_uxn_opcodes_h_l2889_c40_1c1d_pc,
jci_uxn_opcodes_h_l2889_c40_1c1d_previous_stack_read,
jci_uxn_opcodes_h_l2889_c40_1c1d_previous_ram_read,
jci_uxn_opcodes_h_l2889_c40_1c1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_left,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_right,
BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44
opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_cond,
opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_iftrue,
opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_iffalse,
opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output);

-- jmi_uxn_opcodes_h_l2890_c40_d8fc
jmi_uxn_opcodes_h_l2890_c40_d8fc : entity work.jmi_0CLK_937caaea port map (
clk,
jmi_uxn_opcodes_h_l2890_c40_d8fc_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2890_c40_d8fc_phase,
jmi_uxn_opcodes_h_l2890_c40_d8fc_pc,
jmi_uxn_opcodes_h_l2890_c40_d8fc_previous_ram_read,
jmi_uxn_opcodes_h_l2890_c40_d8fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5
opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_cond,
opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output);

-- jsi_uxn_opcodes_h_l2891_c40_08d2
jsi_uxn_opcodes_h_l2891_c40_08d2 : entity work.jsi_0CLK_4c8178ef port map (
clk,
jsi_uxn_opcodes_h_l2891_c40_08d2_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2891_c40_08d2_phase,
jsi_uxn_opcodes_h_l2891_c40_08d2_pc,
jsi_uxn_opcodes_h_l2891_c40_08d2_previous_ram_read,
jsi_uxn_opcodes_h_l2891_c40_08d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_left,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_right,
BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7
opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_cond,
opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output);

-- lit_uxn_opcodes_h_l2892_c40_eba5
lit_uxn_opcodes_h_l2892_c40_eba5 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2892_c40_eba5_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2892_c40_eba5_phase,
lit_uxn_opcodes_h_l2892_c40_eba5_pc,
lit_uxn_opcodes_h_l2892_c40_eba5_previous_ram_read,
lit_uxn_opcodes_h_l2892_c40_eba5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_left,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_right,
BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d
opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_cond,
opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output);

-- lit2_uxn_opcodes_h_l2893_c40_59fa
lit2_uxn_opcodes_h_l2893_c40_59fa : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2893_c40_59fa_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2893_c40_59fa_phase,
lit2_uxn_opcodes_h_l2893_c40_59fa_pc,
lit2_uxn_opcodes_h_l2893_c40_59fa_previous_ram_read,
lit2_uxn_opcodes_h_l2893_c40_59fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_left,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_right,
BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2894_c7_f749
opc_result_MUX_uxn_opcodes_h_l2894_c7_f749 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_cond,
opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_iftrue,
opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_iffalse,
opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_return_output);

-- lit_uxn_opcodes_h_l2894_c40_0fd7
lit_uxn_opcodes_h_l2894_c40_0fd7 : entity work.lit_0CLK_f3f71871 port map (
clk,
lit_uxn_opcodes_h_l2894_c40_0fd7_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2894_c40_0fd7_phase,
lit_uxn_opcodes_h_l2894_c40_0fd7_pc,
lit_uxn_opcodes_h_l2894_c40_0fd7_previous_ram_read,
lit_uxn_opcodes_h_l2894_c40_0fd7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_left,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_right,
BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2895_c7_7087
opc_result_MUX_uxn_opcodes_h_l2895_c7_7087 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_cond,
opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_iftrue,
opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_iffalse,
opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_return_output);

-- lit2_uxn_opcodes_h_l2895_c40_fe58
lit2_uxn_opcodes_h_l2895_c40_fe58 : entity work.lit2_0CLK_4351dde2 port map (
clk,
lit2_uxn_opcodes_h_l2895_c40_fe58_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2895_c40_fe58_phase,
lit2_uxn_opcodes_h_l2895_c40_fe58_pc,
lit2_uxn_opcodes_h_l2895_c40_fe58_previous_ram_read,
lit2_uxn_opcodes_h_l2895_c40_fe58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2
opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_cond,
opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output);

-- inc_uxn_opcodes_h_l2896_c40_1912
inc_uxn_opcodes_h_l2896_c40_1912 : entity work.inc_0CLK_121b1df5 port map (
clk,
inc_uxn_opcodes_h_l2896_c40_1912_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2896_c40_1912_phase,
inc_uxn_opcodes_h_l2896_c40_1912_ins,
inc_uxn_opcodes_h_l2896_c40_1912_previous_stack_read,
inc_uxn_opcodes_h_l2896_c40_1912_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_left,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_right,
BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef
opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_cond,
opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_iftrue,
opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_iffalse,
opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output);

-- inc2_uxn_opcodes_h_l2897_c40_2036
inc2_uxn_opcodes_h_l2897_c40_2036 : entity work.inc2_0CLK_180c5210 port map (
clk,
inc2_uxn_opcodes_h_l2897_c40_2036_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2897_c40_2036_phase,
inc2_uxn_opcodes_h_l2897_c40_2036_ins,
inc2_uxn_opcodes_h_l2897_c40_2036_previous_stack_read,
inc2_uxn_opcodes_h_l2897_c40_2036_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_left,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_right,
BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31
opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_cond,
opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_iftrue,
opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_iffalse,
opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output);

-- pop_uxn_opcodes_h_l2898_c40_33f1
pop_uxn_opcodes_h_l2898_c40_33f1 : entity work.pop_0CLK_b0b628a3 port map (
clk,
pop_uxn_opcodes_h_l2898_c40_33f1_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2898_c40_33f1_phase,
pop_uxn_opcodes_h_l2898_c40_33f1_ins,
pop_uxn_opcodes_h_l2898_c40_33f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc
opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_cond,
opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output);

-- pop2_uxn_opcodes_h_l2899_c40_caf6
pop2_uxn_opcodes_h_l2899_c40_caf6 : entity work.pop2_0CLK_b0b628a3 port map (
clk,
pop2_uxn_opcodes_h_l2899_c40_caf6_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2899_c40_caf6_phase,
pop2_uxn_opcodes_h_l2899_c40_caf6_ins,
pop2_uxn_opcodes_h_l2899_c40_caf6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_left,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_right,
BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2900_c7_8573
opc_result_MUX_uxn_opcodes_h_l2900_c7_8573 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_cond,
opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_iftrue,
opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_iffalse,
opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_return_output);

-- nip_uxn_opcodes_h_l2900_c40_c7ad
nip_uxn_opcodes_h_l2900_c40_c7ad : entity work.nip_0CLK_d0ab213f port map (
clk,
nip_uxn_opcodes_h_l2900_c40_c7ad_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2900_c40_c7ad_phase,
nip_uxn_opcodes_h_l2900_c40_c7ad_ins,
nip_uxn_opcodes_h_l2900_c40_c7ad_previous_stack_read,
nip_uxn_opcodes_h_l2900_c40_c7ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_left,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_right,
BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc
opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_cond,
opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output);

-- nip2_uxn_opcodes_h_l2901_c40_2f88
nip2_uxn_opcodes_h_l2901_c40_2f88 : entity work.nip2_0CLK_1a2ef46d port map (
clk,
nip2_uxn_opcodes_h_l2901_c40_2f88_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2901_c40_2f88_phase,
nip2_uxn_opcodes_h_l2901_c40_2f88_ins,
nip2_uxn_opcodes_h_l2901_c40_2f88_previous_stack_read,
nip2_uxn_opcodes_h_l2901_c40_2f88_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_left,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_right,
BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2902_c7_3192
opc_result_MUX_uxn_opcodes_h_l2902_c7_3192 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_cond,
opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_iftrue,
opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_iffalse,
opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_return_output);

-- swp_uxn_opcodes_h_l2902_c40_779b
swp_uxn_opcodes_h_l2902_c40_779b : entity work.swp_0CLK_0d289325 port map (
clk,
swp_uxn_opcodes_h_l2902_c40_779b_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2902_c40_779b_phase,
swp_uxn_opcodes_h_l2902_c40_779b_ins,
swp_uxn_opcodes_h_l2902_c40_779b_previous_stack_read,
swp_uxn_opcodes_h_l2902_c40_779b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01
opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_cond,
opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_iftrue,
opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_iffalse,
opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output);

-- swp2_uxn_opcodes_h_l2903_c40_40a2
swp2_uxn_opcodes_h_l2903_c40_40a2 : entity work.swp2_0CLK_814c2afd port map (
clk,
swp2_uxn_opcodes_h_l2903_c40_40a2_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2903_c40_40a2_phase,
swp2_uxn_opcodes_h_l2903_c40_40a2_ins,
swp2_uxn_opcodes_h_l2903_c40_40a2_previous_stack_read,
swp2_uxn_opcodes_h_l2903_c40_40a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_left,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_right,
BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2904_c7_4114
opc_result_MUX_uxn_opcodes_h_l2904_c7_4114 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_cond,
opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_iftrue,
opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_iffalse,
opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_return_output);

-- rot_uxn_opcodes_h_l2904_c40_d162
rot_uxn_opcodes_h_l2904_c40_d162 : entity work.rot_0CLK_b288bfb7 port map (
clk,
rot_uxn_opcodes_h_l2904_c40_d162_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2904_c40_d162_phase,
rot_uxn_opcodes_h_l2904_c40_d162_ins,
rot_uxn_opcodes_h_l2904_c40_d162_previous_stack_read,
rot_uxn_opcodes_h_l2904_c40_d162_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_left,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_right,
BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d
opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_cond,
opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output);

-- rot2_uxn_opcodes_h_l2905_c40_a0e1
rot2_uxn_opcodes_h_l2905_c40_a0e1 : entity work.rot2_0CLK_8e773831 port map (
clk,
rot2_uxn_opcodes_h_l2905_c40_a0e1_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2905_c40_a0e1_phase,
rot2_uxn_opcodes_h_l2905_c40_a0e1_ins,
rot2_uxn_opcodes_h_l2905_c40_a0e1_previous_stack_read,
rot2_uxn_opcodes_h_l2905_c40_a0e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6
opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_cond,
opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output);

-- dup_uxn_opcodes_h_l2906_c40_4842
dup_uxn_opcodes_h_l2906_c40_4842 : entity work.dup_0CLK_d4b33a56 port map (
clk,
dup_uxn_opcodes_h_l2906_c40_4842_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2906_c40_4842_phase,
dup_uxn_opcodes_h_l2906_c40_4842_ins,
dup_uxn_opcodes_h_l2906_c40_4842_previous_stack_read,
dup_uxn_opcodes_h_l2906_c40_4842_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_left,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_right,
BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17
opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_cond,
opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_iftrue,
opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_iffalse,
opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output);

-- dup2_uxn_opcodes_h_l2907_c40_f42b
dup2_uxn_opcodes_h_l2907_c40_f42b : entity work.dup2_0CLK_e4095020 port map (
clk,
dup2_uxn_opcodes_h_l2907_c40_f42b_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2907_c40_f42b_phase,
dup2_uxn_opcodes_h_l2907_c40_f42b_ins,
dup2_uxn_opcodes_h_l2907_c40_f42b_previous_stack_read,
dup2_uxn_opcodes_h_l2907_c40_f42b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_left,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_right,
BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4
opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_cond,
opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output);

-- ovr_uxn_opcodes_h_l2908_c40_a4fe
ovr_uxn_opcodes_h_l2908_c40_a4fe : entity work.ovr_0CLK_61914e8d port map (
clk,
ovr_uxn_opcodes_h_l2908_c40_a4fe_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2908_c40_a4fe_phase,
ovr_uxn_opcodes_h_l2908_c40_a4fe_ins,
ovr_uxn_opcodes_h_l2908_c40_a4fe_previous_stack_read,
ovr_uxn_opcodes_h_l2908_c40_a4fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_left,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_right,
BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac
opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_cond,
opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_iftrue,
opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_iffalse,
opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output);

-- ovr2_uxn_opcodes_h_l2909_c40_8dbf
ovr2_uxn_opcodes_h_l2909_c40_8dbf : entity work.ovr2_0CLK_bb09c2cb port map (
clk,
ovr2_uxn_opcodes_h_l2909_c40_8dbf_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2909_c40_8dbf_phase,
ovr2_uxn_opcodes_h_l2909_c40_8dbf_ins,
ovr2_uxn_opcodes_h_l2909_c40_8dbf_previous_stack_read,
ovr2_uxn_opcodes_h_l2909_c40_8dbf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35
opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_cond,
opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_iftrue,
opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_iffalse,
opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output);

-- equ_uxn_opcodes_h_l2910_c40_9012
equ_uxn_opcodes_h_l2910_c40_9012 : entity work.equ_0CLK_226c8821 port map (
clk,
equ_uxn_opcodes_h_l2910_c40_9012_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2910_c40_9012_phase,
equ_uxn_opcodes_h_l2910_c40_9012_ins,
equ_uxn_opcodes_h_l2910_c40_9012_previous_stack_read,
equ_uxn_opcodes_h_l2910_c40_9012_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_left,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_right,
BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff
opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_cond,
opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_iftrue,
opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_iffalse,
opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output);

-- equ2_uxn_opcodes_h_l2911_c40_fe28
equ2_uxn_opcodes_h_l2911_c40_fe28 : entity work.equ2_0CLK_609876da port map (
clk,
equ2_uxn_opcodes_h_l2911_c40_fe28_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2911_c40_fe28_phase,
equ2_uxn_opcodes_h_l2911_c40_fe28_ins,
equ2_uxn_opcodes_h_l2911_c40_fe28_previous_stack_read,
equ2_uxn_opcodes_h_l2911_c40_fe28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_left,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_right,
BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc
opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_cond,
opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output);

-- neq_uxn_opcodes_h_l2912_c40_1abf
neq_uxn_opcodes_h_l2912_c40_1abf : entity work.neq_0CLK_226c8821 port map (
clk,
neq_uxn_opcodes_h_l2912_c40_1abf_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2912_c40_1abf_phase,
neq_uxn_opcodes_h_l2912_c40_1abf_ins,
neq_uxn_opcodes_h_l2912_c40_1abf_previous_stack_read,
neq_uxn_opcodes_h_l2912_c40_1abf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c
opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_cond,
opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output);

-- neq2_uxn_opcodes_h_l2913_c40_ec26
neq2_uxn_opcodes_h_l2913_c40_ec26 : entity work.neq2_0CLK_609876da port map (
clk,
neq2_uxn_opcodes_h_l2913_c40_ec26_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2913_c40_ec26_phase,
neq2_uxn_opcodes_h_l2913_c40_ec26_ins,
neq2_uxn_opcodes_h_l2913_c40_ec26_previous_stack_read,
neq2_uxn_opcodes_h_l2913_c40_ec26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_left,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_right,
BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31
opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_cond,
opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_iftrue,
opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_iffalse,
opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output);

-- gth_uxn_opcodes_h_l2914_c40_a832
gth_uxn_opcodes_h_l2914_c40_a832 : entity work.gth_0CLK_226c8821 port map (
clk,
gth_uxn_opcodes_h_l2914_c40_a832_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2914_c40_a832_phase,
gth_uxn_opcodes_h_l2914_c40_a832_ins,
gth_uxn_opcodes_h_l2914_c40_a832_previous_stack_read,
gth_uxn_opcodes_h_l2914_c40_a832_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_left,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_right,
BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2915_c7_0136
opc_result_MUX_uxn_opcodes_h_l2915_c7_0136 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_cond,
opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_iftrue,
opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_iffalse,
opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_return_output);

-- gth2_uxn_opcodes_h_l2915_c40_b990
gth2_uxn_opcodes_h_l2915_c40_b990 : entity work.gth2_0CLK_609876da port map (
clk,
gth2_uxn_opcodes_h_l2915_c40_b990_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2915_c40_b990_phase,
gth2_uxn_opcodes_h_l2915_c40_b990_ins,
gth2_uxn_opcodes_h_l2915_c40_b990_previous_stack_read,
gth2_uxn_opcodes_h_l2915_c40_b990_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_left,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_right,
BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2
opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_cond,
opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output);

-- lth_uxn_opcodes_h_l2916_c40_b59f
lth_uxn_opcodes_h_l2916_c40_b59f : entity work.lth_0CLK_226c8821 port map (
clk,
lth_uxn_opcodes_h_l2916_c40_b59f_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2916_c40_b59f_phase,
lth_uxn_opcodes_h_l2916_c40_b59f_ins,
lth_uxn_opcodes_h_l2916_c40_b59f_previous_stack_read,
lth_uxn_opcodes_h_l2916_c40_b59f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_left,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_right,
BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6
opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_cond,
opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output);

-- lth2_uxn_opcodes_h_l2917_c40_85ca
lth2_uxn_opcodes_h_l2917_c40_85ca : entity work.lth2_0CLK_609876da port map (
clk,
lth2_uxn_opcodes_h_l2917_c40_85ca_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2917_c40_85ca_phase,
lth2_uxn_opcodes_h_l2917_c40_85ca_ins,
lth2_uxn_opcodes_h_l2917_c40_85ca_previous_stack_read,
lth2_uxn_opcodes_h_l2917_c40_85ca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2918_c7_906b
opc_result_MUX_uxn_opcodes_h_l2918_c7_906b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_cond,
opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_return_output);

-- jmp_uxn_opcodes_h_l2918_c40_a3b4
jmp_uxn_opcodes_h_l2918_c40_a3b4 : entity work.jmp_0CLK_121b1df5 port map (
clk,
jmp_uxn_opcodes_h_l2918_c40_a3b4_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2918_c40_a3b4_phase,
jmp_uxn_opcodes_h_l2918_c40_a3b4_ins,
jmp_uxn_opcodes_h_l2918_c40_a3b4_pc,
jmp_uxn_opcodes_h_l2918_c40_a3b4_previous_stack_read,
jmp_uxn_opcodes_h_l2918_c40_a3b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_left,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_right,
BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8
opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_cond,
opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output);

-- jmp2_uxn_opcodes_h_l2919_c40_efa4
jmp2_uxn_opcodes_h_l2919_c40_efa4 : entity work.jmp2_0CLK_d6642053 port map (
clk,
jmp2_uxn_opcodes_h_l2919_c40_efa4_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2919_c40_efa4_phase,
jmp2_uxn_opcodes_h_l2919_c40_efa4_ins,
jmp2_uxn_opcodes_h_l2919_c40_efa4_previous_stack_read,
jmp2_uxn_opcodes_h_l2919_c40_efa4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_left,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_right,
BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73
opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_cond,
opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_iftrue,
opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_iffalse,
opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output);

-- jcn_uxn_opcodes_h_l2920_c40_970c
jcn_uxn_opcodes_h_l2920_c40_970c : entity work.jcn_0CLK_226c8821 port map (
clk,
jcn_uxn_opcodes_h_l2920_c40_970c_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2920_c40_970c_phase,
jcn_uxn_opcodes_h_l2920_c40_970c_ins,
jcn_uxn_opcodes_h_l2920_c40_970c_pc,
jcn_uxn_opcodes_h_l2920_c40_970c_previous_stack_read,
jcn_uxn_opcodes_h_l2920_c40_970c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_left,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_right,
BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe
opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_cond,
opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_iftrue,
opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_iffalse,
opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output);

-- jcn2_uxn_opcodes_h_l2921_c40_9218
jcn2_uxn_opcodes_h_l2921_c40_9218 : entity work.jcn2_0CLK_12273847 port map (
clk,
jcn2_uxn_opcodes_h_l2921_c40_9218_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2921_c40_9218_phase,
jcn2_uxn_opcodes_h_l2921_c40_9218_ins,
jcn2_uxn_opcodes_h_l2921_c40_9218_previous_stack_read,
jcn2_uxn_opcodes_h_l2921_c40_9218_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_left,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_right,
BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c
opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_cond,
opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output);

-- jsr_uxn_opcodes_h_l2922_c40_92be
jsr_uxn_opcodes_h_l2922_c40_92be : entity work.jsr_0CLK_fedec265 port map (
clk,
jsr_uxn_opcodes_h_l2922_c40_92be_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2922_c40_92be_phase,
jsr_uxn_opcodes_h_l2922_c40_92be_ins,
jsr_uxn_opcodes_h_l2922_c40_92be_pc,
jsr_uxn_opcodes_h_l2922_c40_92be_previous_stack_read,
jsr_uxn_opcodes_h_l2922_c40_92be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_left,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_right,
BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2923_c7_292a
opc_result_MUX_uxn_opcodes_h_l2923_c7_292a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_cond,
opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_return_output);

-- jsr2_uxn_opcodes_h_l2923_c40_ceaf
jsr2_uxn_opcodes_h_l2923_c40_ceaf : entity work.jsr2_0CLK_609876da port map (
clk,
jsr2_uxn_opcodes_h_l2923_c40_ceaf_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2923_c40_ceaf_phase,
jsr2_uxn_opcodes_h_l2923_c40_ceaf_ins,
jsr2_uxn_opcodes_h_l2923_c40_ceaf_pc,
jsr2_uxn_opcodes_h_l2923_c40_ceaf_previous_stack_read,
jsr2_uxn_opcodes_h_l2923_c40_ceaf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf
opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_cond,
opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output);

-- sth_uxn_opcodes_h_l2924_c40_8a87
sth_uxn_opcodes_h_l2924_c40_8a87 : entity work.sth_0CLK_a9f1e08f port map (
clk,
sth_uxn_opcodes_h_l2924_c40_8a87_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2924_c40_8a87_phase,
sth_uxn_opcodes_h_l2924_c40_8a87_ins,
sth_uxn_opcodes_h_l2924_c40_8a87_previous_stack_read,
sth_uxn_opcodes_h_l2924_c40_8a87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_left,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_right,
BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2925_c7_3477
opc_result_MUX_uxn_opcodes_h_l2925_c7_3477 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_cond,
opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_iftrue,
opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_iffalse,
opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_return_output);

-- sth2_uxn_opcodes_h_l2925_c40_b059
sth2_uxn_opcodes_h_l2925_c40_b059 : entity work.sth2_0CLK_55b6500a port map (
clk,
sth2_uxn_opcodes_h_l2925_c40_b059_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2925_c40_b059_phase,
sth2_uxn_opcodes_h_l2925_c40_b059_ins,
sth2_uxn_opcodes_h_l2925_c40_b059_previous_stack_read,
sth2_uxn_opcodes_h_l2925_c40_b059_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_left,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_right,
BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6
opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_cond,
opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output);

-- ldz_uxn_opcodes_h_l2926_c40_b163
ldz_uxn_opcodes_h_l2926_c40_b163 : entity work.ldz_0CLK_b128164d port map (
clk,
ldz_uxn_opcodes_h_l2926_c40_b163_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2926_c40_b163_phase,
ldz_uxn_opcodes_h_l2926_c40_b163_ins,
ldz_uxn_opcodes_h_l2926_c40_b163_previous_stack_read,
ldz_uxn_opcodes_h_l2926_c40_b163_previous_ram_read,
ldz_uxn_opcodes_h_l2926_c40_b163_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_left,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_right,
BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8
opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_cond,
opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output);

-- ldz2_uxn_opcodes_h_l2927_c40_d69a
ldz2_uxn_opcodes_h_l2927_c40_d69a : entity work.ldz2_0CLK_2ab048cc port map (
clk,
ldz2_uxn_opcodes_h_l2927_c40_d69a_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2927_c40_d69a_phase,
ldz2_uxn_opcodes_h_l2927_c40_d69a_ins,
ldz2_uxn_opcodes_h_l2927_c40_d69a_previous_stack_read,
ldz2_uxn_opcodes_h_l2927_c40_d69a_previous_ram_read,
ldz2_uxn_opcodes_h_l2927_c40_d69a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9
opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_cond,
opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output);

-- stz_uxn_opcodes_h_l2928_c40_575e
stz_uxn_opcodes_h_l2928_c40_575e : entity work.stz_0CLK_bacf6a1d port map (
clk,
stz_uxn_opcodes_h_l2928_c40_575e_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2928_c40_575e_phase,
stz_uxn_opcodes_h_l2928_c40_575e_ins,
stz_uxn_opcodes_h_l2928_c40_575e_previous_stack_read,
stz_uxn_opcodes_h_l2928_c40_575e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_left,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_right,
BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2929_c7_f392
opc_result_MUX_uxn_opcodes_h_l2929_c7_f392 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_cond,
opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_iftrue,
opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_iffalse,
opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_return_output);

-- stz2_uxn_opcodes_h_l2929_c40_650d
stz2_uxn_opcodes_h_l2929_c40_650d : entity work.stz2_0CLK_75b4bee3 port map (
clk,
stz2_uxn_opcodes_h_l2929_c40_650d_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2929_c40_650d_phase,
stz2_uxn_opcodes_h_l2929_c40_650d_ins,
stz2_uxn_opcodes_h_l2929_c40_650d_previous_stack_read,
stz2_uxn_opcodes_h_l2929_c40_650d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_left,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_right,
BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc
opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_cond,
opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output);

-- ldr_uxn_opcodes_h_l2930_c40_65e3
ldr_uxn_opcodes_h_l2930_c40_65e3 : entity work.ldr_0CLK_f74745d5 port map (
clk,
ldr_uxn_opcodes_h_l2930_c40_65e3_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2930_c40_65e3_phase,
ldr_uxn_opcodes_h_l2930_c40_65e3_ins,
ldr_uxn_opcodes_h_l2930_c40_65e3_pc,
ldr_uxn_opcodes_h_l2930_c40_65e3_previous_stack_read,
ldr_uxn_opcodes_h_l2930_c40_65e3_previous_ram_read,
ldr_uxn_opcodes_h_l2930_c40_65e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_left,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_right,
BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81
opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_cond,
opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_iftrue,
opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_iffalse,
opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output);

-- ldr2_uxn_opcodes_h_l2931_c40_936e
ldr2_uxn_opcodes_h_l2931_c40_936e : entity work.ldr2_0CLK_b7cf2331 port map (
clk,
ldr2_uxn_opcodes_h_l2931_c40_936e_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2931_c40_936e_phase,
ldr2_uxn_opcodes_h_l2931_c40_936e_ins,
ldr2_uxn_opcodes_h_l2931_c40_936e_pc,
ldr2_uxn_opcodes_h_l2931_c40_936e_previous_stack_read,
ldr2_uxn_opcodes_h_l2931_c40_936e_previous_ram_read,
ldr2_uxn_opcodes_h_l2931_c40_936e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2932_c7_68af
opc_result_MUX_uxn_opcodes_h_l2932_c7_68af : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_cond,
opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_iftrue,
opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_iffalse,
opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_return_output);

-- str1_uxn_opcodes_h_l2932_c40_3137
str1_uxn_opcodes_h_l2932_c40_3137 : entity work.str1_0CLK_85d5529e port map (
clk,
str1_uxn_opcodes_h_l2932_c40_3137_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2932_c40_3137_phase,
str1_uxn_opcodes_h_l2932_c40_3137_ins,
str1_uxn_opcodes_h_l2932_c40_3137_pc,
str1_uxn_opcodes_h_l2932_c40_3137_previous_stack_read,
str1_uxn_opcodes_h_l2932_c40_3137_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2933_c7_1577
opc_result_MUX_uxn_opcodes_h_l2933_c7_1577 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_cond,
opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_iftrue,
opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_iffalse,
opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_return_output);

-- str2_uxn_opcodes_h_l2933_c40_587f
str2_uxn_opcodes_h_l2933_c40_587f : entity work.str2_0CLK_75b4bee3 port map (
clk,
str2_uxn_opcodes_h_l2933_c40_587f_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2933_c40_587f_phase,
str2_uxn_opcodes_h_l2933_c40_587f_ins,
str2_uxn_opcodes_h_l2933_c40_587f_pc,
str2_uxn_opcodes_h_l2933_c40_587f_previous_stack_read,
str2_uxn_opcodes_h_l2933_c40_587f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_left,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_right,
BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2934_c7_098f
opc_result_MUX_uxn_opcodes_h_l2934_c7_098f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_cond,
opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_return_output);

-- lda_uxn_opcodes_h_l2934_c40_d8ae
lda_uxn_opcodes_h_l2934_c40_d8ae : entity work.lda_0CLK_c634cda8 port map (
clk,
lda_uxn_opcodes_h_l2934_c40_d8ae_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2934_c40_d8ae_phase,
lda_uxn_opcodes_h_l2934_c40_d8ae_ins,
lda_uxn_opcodes_h_l2934_c40_d8ae_previous_stack_read,
lda_uxn_opcodes_h_l2934_c40_d8ae_previous_ram_read,
lda_uxn_opcodes_h_l2934_c40_d8ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_left,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_right,
BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2935_c7_0065
opc_result_MUX_uxn_opcodes_h_l2935_c7_0065 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_cond,
opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_iftrue,
opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_iffalse,
opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_return_output);

-- lda2_uxn_opcodes_h_l2935_c40_c21e
lda2_uxn_opcodes_h_l2935_c40_c21e : entity work.lda2_0CLK_19339e1d port map (
clk,
lda2_uxn_opcodes_h_l2935_c40_c21e_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2935_c40_c21e_phase,
lda2_uxn_opcodes_h_l2935_c40_c21e_ins,
lda2_uxn_opcodes_h_l2935_c40_c21e_previous_stack_read,
lda2_uxn_opcodes_h_l2935_c40_c21e_previous_ram_read,
lda2_uxn_opcodes_h_l2935_c40_c21e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3
opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_cond,
opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output);

-- sta_uxn_opcodes_h_l2936_c40_6e8d
sta_uxn_opcodes_h_l2936_c40_6e8d : entity work.sta_0CLK_bce25fe8 port map (
clk,
sta_uxn_opcodes_h_l2936_c40_6e8d_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2936_c40_6e8d_phase,
sta_uxn_opcodes_h_l2936_c40_6e8d_ins,
sta_uxn_opcodes_h_l2936_c40_6e8d_previous_stack_read,
sta_uxn_opcodes_h_l2936_c40_6e8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_left,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_right,
BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3
opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_cond,
opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output);

-- sta2_uxn_opcodes_h_l2937_c40_a4fa
sta2_uxn_opcodes_h_l2937_c40_a4fa : entity work.sta2_0CLK_4674db74 port map (
clk,
sta2_uxn_opcodes_h_l2937_c40_a4fa_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2937_c40_a4fa_phase,
sta2_uxn_opcodes_h_l2937_c40_a4fa_ins,
sta2_uxn_opcodes_h_l2937_c40_a4fa_previous_stack_read,
sta2_uxn_opcodes_h_l2937_c40_a4fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_left,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_right,
BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2938_c7_e369
opc_result_MUX_uxn_opcodes_h_l2938_c7_e369 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_cond,
opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_iftrue,
opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_iffalse,
opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_return_output);

-- dei_uxn_opcodes_h_l2938_c40_ad7d
dei_uxn_opcodes_h_l2938_c40_ad7d : entity work.dei_0CLK_9bcaee2f port map (
clk,
dei_uxn_opcodes_h_l2938_c40_ad7d_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2938_c40_ad7d_phase,
dei_uxn_opcodes_h_l2938_c40_ad7d_ins,
dei_uxn_opcodes_h_l2938_c40_ad7d_previous_stack_read,
dei_uxn_opcodes_h_l2938_c40_ad7d_previous_device_ram_read,
dei_uxn_opcodes_h_l2938_c40_ad7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_left,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_right,
BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3
opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_cond,
opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output);

-- dei2_uxn_opcodes_h_l2939_c40_d10b
dei2_uxn_opcodes_h_l2939_c40_d10b : entity work.dei2_0CLK_f0f27b91 port map (
clk,
dei2_uxn_opcodes_h_l2939_c40_d10b_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2939_c40_d10b_phase,
dei2_uxn_opcodes_h_l2939_c40_d10b_ins,
dei2_uxn_opcodes_h_l2939_c40_d10b_previous_stack_read,
dei2_uxn_opcodes_h_l2939_c40_d10b_previous_device_ram_read,
dei2_uxn_opcodes_h_l2939_c40_d10b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_left,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_right,
BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9
opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_cond,
opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output);

-- deo_uxn_opcodes_h_l2940_c40_f622
deo_uxn_opcodes_h_l2940_c40_f622 : entity work.deo_0CLK_ebde644c port map (
clk,
deo_uxn_opcodes_h_l2940_c40_f622_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2940_c40_f622_phase,
deo_uxn_opcodes_h_l2940_c40_f622_ins,
deo_uxn_opcodes_h_l2940_c40_f622_previous_stack_read,
deo_uxn_opcodes_h_l2940_c40_f622_previous_device_ram_read,
deo_uxn_opcodes_h_l2940_c40_f622_previous_ram_read,
deo_uxn_opcodes_h_l2940_c40_f622_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_left,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_right,
BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2
opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_cond,
opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output);

-- deo2_uxn_opcodes_h_l2941_c40_4576
deo2_uxn_opcodes_h_l2941_c40_4576 : entity work.deo2_0CLK_5952a5d7 port map (
clk,
deo2_uxn_opcodes_h_l2941_c40_4576_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2941_c40_4576_phase,
deo2_uxn_opcodes_h_l2941_c40_4576_ins,
deo2_uxn_opcodes_h_l2941_c40_4576_previous_stack_read,
deo2_uxn_opcodes_h_l2941_c40_4576_previous_device_ram_read,
deo2_uxn_opcodes_h_l2941_c40_4576_previous_ram_read,
deo2_uxn_opcodes_h_l2941_c40_4576_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_left,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_right,
BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec
opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_cond,
opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_iftrue,
opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_iffalse,
opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output);

-- add_uxn_opcodes_h_l2942_c40_a15e
add_uxn_opcodes_h_l2942_c40_a15e : entity work.add_0CLK_64d180f1 port map (
clk,
add_uxn_opcodes_h_l2942_c40_a15e_CLOCK_ENABLE,
add_uxn_opcodes_h_l2942_c40_a15e_phase,
add_uxn_opcodes_h_l2942_c40_a15e_ins,
add_uxn_opcodes_h_l2942_c40_a15e_previous_stack_read,
add_uxn_opcodes_h_l2942_c40_a15e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_left,
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_right,
BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee
opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_cond,
opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_iftrue,
opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_iffalse,
opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output);

-- add2_uxn_opcodes_h_l2943_c40_3f93
add2_uxn_opcodes_h_l2943_c40_3f93 : entity work.add2_0CLK_50b92fe2 port map (
clk,
add2_uxn_opcodes_h_l2943_c40_3f93_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2943_c40_3f93_phase,
add2_uxn_opcodes_h_l2943_c40_3f93_ins,
add2_uxn_opcodes_h_l2943_c40_3f93_previous_stack_read,
add2_uxn_opcodes_h_l2943_c40_3f93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_left,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_right,
BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2944_c7_64af
opc_result_MUX_uxn_opcodes_h_l2944_c7_64af : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_cond,
opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_iftrue,
opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_iffalse,
opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_return_output);

-- sub_uxn_opcodes_h_l2944_c40_06f0
sub_uxn_opcodes_h_l2944_c40_06f0 : entity work.sub_0CLK_64d180f1 port map (
clk,
sub_uxn_opcodes_h_l2944_c40_06f0_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2944_c40_06f0_phase,
sub_uxn_opcodes_h_l2944_c40_06f0_ins,
sub_uxn_opcodes_h_l2944_c40_06f0_previous_stack_read,
sub_uxn_opcodes_h_l2944_c40_06f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_left,
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_right,
BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f
opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_cond,
opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output);

-- sub2_uxn_opcodes_h_l2945_c40_e61d
sub2_uxn_opcodes_h_l2945_c40_e61d : entity work.sub2_0CLK_50b92fe2 port map (
clk,
sub2_uxn_opcodes_h_l2945_c40_e61d_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2945_c40_e61d_phase,
sub2_uxn_opcodes_h_l2945_c40_e61d_ins,
sub2_uxn_opcodes_h_l2945_c40_e61d_previous_stack_read,
sub2_uxn_opcodes_h_l2945_c40_e61d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_left,
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_right,
BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf
opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_cond,
opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output);

-- mul_uxn_opcodes_h_l2946_c40_d2e1
mul_uxn_opcodes_h_l2946_c40_d2e1 : entity work.mul_0CLK_64d180f1 port map (
clk,
mul_uxn_opcodes_h_l2946_c40_d2e1_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2946_c40_d2e1_phase,
mul_uxn_opcodes_h_l2946_c40_d2e1_ins,
mul_uxn_opcodes_h_l2946_c40_d2e1_previous_stack_read,
mul_uxn_opcodes_h_l2946_c40_d2e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_left,
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_right,
BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75
opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_cond,
opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_iftrue,
opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_iffalse,
opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output);

-- mul2_uxn_opcodes_h_l2947_c40_01f6
mul2_uxn_opcodes_h_l2947_c40_01f6 : entity work.mul2_0CLK_50b92fe2 port map (
clk,
mul2_uxn_opcodes_h_l2947_c40_01f6_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2947_c40_01f6_phase,
mul2_uxn_opcodes_h_l2947_c40_01f6_ins,
mul2_uxn_opcodes_h_l2947_c40_01f6_previous_stack_read,
mul2_uxn_opcodes_h_l2947_c40_01f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2948_c7_1435
opc_result_MUX_uxn_opcodes_h_l2948_c7_1435 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_cond,
opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_iftrue,
opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_iffalse,
opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_return_output);

-- div_uxn_opcodes_h_l2948_c40_4cc1
div_uxn_opcodes_h_l2948_c40_4cc1 : entity work.div_0CLK_09f6f009 port map (
clk,
div_uxn_opcodes_h_l2948_c40_4cc1_CLOCK_ENABLE,
div_uxn_opcodes_h_l2948_c40_4cc1_phase,
div_uxn_opcodes_h_l2948_c40_4cc1_ins,
div_uxn_opcodes_h_l2948_c40_4cc1_previous_stack_read,
div_uxn_opcodes_h_l2948_c40_4cc1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_left,
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_right,
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be
opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_cond,
opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_iftrue,
opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_iffalse,
opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output);

-- div2_uxn_opcodes_h_l2949_c40_64e2
div2_uxn_opcodes_h_l2949_c40_64e2 : entity work.div2_0CLK_7cf9dac2 port map (
clk,
div2_uxn_opcodes_h_l2949_c40_64e2_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2949_c40_64e2_phase,
div2_uxn_opcodes_h_l2949_c40_64e2_ins,
div2_uxn_opcodes_h_l2949_c40_64e2_previous_stack_read,
div2_uxn_opcodes_h_l2949_c40_64e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_left,
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_right,
BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2950_c7_c600
opc_result_MUX_uxn_opcodes_h_l2950_c7_c600 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_cond,
opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_iftrue,
opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_iffalse,
opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_return_output);

-- and_uxn_opcodes_h_l2950_c40_c59f
and_uxn_opcodes_h_l2950_c40_c59f : entity work.and_0CLK_64d180f1 port map (
clk,
and_uxn_opcodes_h_l2950_c40_c59f_CLOCK_ENABLE,
and_uxn_opcodes_h_l2950_c40_c59f_phase,
and_uxn_opcodes_h_l2950_c40_c59f_ins,
and_uxn_opcodes_h_l2950_c40_c59f_previous_stack_read,
and_uxn_opcodes_h_l2950_c40_c59f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_left,
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_right,
BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37
opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_cond,
opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_iftrue,
opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_iffalse,
opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output);

-- and2_uxn_opcodes_h_l2951_c40_ae80
and2_uxn_opcodes_h_l2951_c40_ae80 : entity work.and2_0CLK_50b92fe2 port map (
clk,
and2_uxn_opcodes_h_l2951_c40_ae80_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2951_c40_ae80_phase,
and2_uxn_opcodes_h_l2951_c40_ae80_ins,
and2_uxn_opcodes_h_l2951_c40_ae80_previous_stack_read,
and2_uxn_opcodes_h_l2951_c40_ae80_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_left,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_right,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2952_c7_f515
opc_result_MUX_uxn_opcodes_h_l2952_c7_f515 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_cond,
opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_iftrue,
opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_iffalse,
opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_return_output);

-- ora_uxn_opcodes_h_l2952_c40_b07d
ora_uxn_opcodes_h_l2952_c40_b07d : entity work.ora_0CLK_64d180f1 port map (
clk,
ora_uxn_opcodes_h_l2952_c40_b07d_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2952_c40_b07d_phase,
ora_uxn_opcodes_h_l2952_c40_b07d_ins,
ora_uxn_opcodes_h_l2952_c40_b07d_previous_stack_read,
ora_uxn_opcodes_h_l2952_c40_b07d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_left,
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_right,
BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6
opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_cond,
opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output);

-- ora2_uxn_opcodes_h_l2953_c40_d3c9
ora2_uxn_opcodes_h_l2953_c40_d3c9 : entity work.ora2_0CLK_50b92fe2 port map (
clk,
ora2_uxn_opcodes_h_l2953_c40_d3c9_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2953_c40_d3c9_phase,
ora2_uxn_opcodes_h_l2953_c40_d3c9_ins,
ora2_uxn_opcodes_h_l2953_c40_d3c9_previous_stack_read,
ora2_uxn_opcodes_h_l2953_c40_d3c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_left,
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_right,
BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5
opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_cond,
opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output);

-- eor_uxn_opcodes_h_l2954_c40_9707
eor_uxn_opcodes_h_l2954_c40_9707 : entity work.eor_0CLK_64d180f1 port map (
clk,
eor_uxn_opcodes_h_l2954_c40_9707_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2954_c40_9707_phase,
eor_uxn_opcodes_h_l2954_c40_9707_ins,
eor_uxn_opcodes_h_l2954_c40_9707_previous_stack_read,
eor_uxn_opcodes_h_l2954_c40_9707_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_left,
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_right,
BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2955_c7_c851
opc_result_MUX_uxn_opcodes_h_l2955_c7_c851 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_cond,
opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_iftrue,
opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_iffalse,
opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_return_output);

-- eor2_uxn_opcodes_h_l2955_c40_eb72
eor2_uxn_opcodes_h_l2955_c40_eb72 : entity work.eor2_0CLK_50b92fe2 port map (
clk,
eor2_uxn_opcodes_h_l2955_c40_eb72_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2955_c40_eb72_phase,
eor2_uxn_opcodes_h_l2955_c40_eb72_ins,
eor2_uxn_opcodes_h_l2955_c40_eb72_previous_stack_read,
eor2_uxn_opcodes_h_l2955_c40_eb72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_left,
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_right,
BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73
opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_cond,
opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_iftrue,
opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_iffalse,
opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output);

-- sft_uxn_opcodes_h_l2956_c40_e6a7
sft_uxn_opcodes_h_l2956_c40_e6a7 : entity work.sft_0CLK_46cced44 port map (
clk,
sft_uxn_opcodes_h_l2956_c40_e6a7_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2956_c40_e6a7_phase,
sft_uxn_opcodes_h_l2956_c40_e6a7_ins,
sft_uxn_opcodes_h_l2956_c40_e6a7_previous_stack_read,
sft_uxn_opcodes_h_l2956_c40_e6a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2
opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_cond,
opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_return_output);

-- sft2_uxn_opcodes_h_l2957_c40_7e12
sft2_uxn_opcodes_h_l2957_c40_7e12 : entity work.sft2_0CLK_e8b37bfc port map (
clk,
sft2_uxn_opcodes_h_l2957_c40_7e12_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2957_c40_7e12_phase,
sft2_uxn_opcodes_h_l2957_c40_7e12_ins,
sft2_uxn_opcodes_h_l2957_c40_7e12_previous_stack_read,
sft2_uxn_opcodes_h_l2957_c40_7e12_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e
CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e_x,
CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8
BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_left,
BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_right,
BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_return_output);

-- sp0_MUX_uxn_opcodes_h_l2962_c2_c726
sp0_MUX_uxn_opcodes_h_l2962_c2_c726 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2962_c2_c726_cond,
sp0_MUX_uxn_opcodes_h_l2962_c2_c726_iftrue,
sp0_MUX_uxn_opcodes_h_l2962_c2_c726_iffalse,
sp0_MUX_uxn_opcodes_h_l2962_c2_c726_return_output);

-- sp1_MUX_uxn_opcodes_h_l2962_c2_c726
sp1_MUX_uxn_opcodes_h_l2962_c2_c726 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2962_c2_c726_cond,
sp1_MUX_uxn_opcodes_h_l2962_c2_c726_iftrue,
sp1_MUX_uxn_opcodes_h_l2962_c2_c726_iffalse,
sp1_MUX_uxn_opcodes_h_l2962_c2_c726_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9
BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_left,
BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_right,
BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127
BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_left,
BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_right,
BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_return_output);

-- MUX_uxn_opcodes_h_l2968_c29_22ba
MUX_uxn_opcodes_h_l2968_c29_22ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2968_c29_22ba_cond,
MUX_uxn_opcodes_h_l2968_c29_22ba_iftrue,
MUX_uxn_opcodes_h_l2968_c29_22ba_iffalse,
MUX_uxn_opcodes_h_l2968_c29_22ba_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c
BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_left,
BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_right,
BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_return_output);

-- MUX_uxn_opcodes_h_l2969_c20_878e
MUX_uxn_opcodes_h_l2969_c20_878e : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2969_c20_878e_cond,
MUX_uxn_opcodes_h_l2969_c20_878e_iftrue,
MUX_uxn_opcodes_h_l2969_c20_878e_iffalse,
MUX_uxn_opcodes_h_l2969_c20_878e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4
BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4 : entity work.BIN_OP_PLUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_left,
BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_right,
BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_return_output);

-- stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc
stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_stack_address,
stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_value,
stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_write_enable,
stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_return_output,
 MUX_uxn_opcodes_h_l2881_c14_bde4_return_output,
 MUX_uxn_opcodes_h_l2882_c8_f712_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output,
 is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output,
 brk_uxn_opcodes_h_l2888_c48_a8f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output,
 opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output,
 jci_uxn_opcodes_h_l2889_c40_1c1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output,
 jmi_uxn_opcodes_h_l2890_c40_d8fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output,
 jsi_uxn_opcodes_h_l2891_c40_08d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output,
 lit_uxn_opcodes_h_l2892_c40_eba5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_return_output,
 opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output,
 lit2_uxn_opcodes_h_l2893_c40_59fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_return_output,
 opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_return_output,
 lit_uxn_opcodes_h_l2894_c40_0fd7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_return_output,
 lit2_uxn_opcodes_h_l2895_c40_fe58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output,
 opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output,
 inc_uxn_opcodes_h_l2896_c40_1912_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output,
 opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output,
 inc2_uxn_opcodes_h_l2897_c40_2036_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output,
 pop_uxn_opcodes_h_l2898_c40_33f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_return_output,
 opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output,
 pop2_uxn_opcodes_h_l2899_c40_caf6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_return_output,
 nip_uxn_opcodes_h_l2900_c40_c7ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_return_output,
 opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output,
 nip2_uxn_opcodes_h_l2901_c40_2f88_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output,
 opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_return_output,
 swp_uxn_opcodes_h_l2902_c40_779b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_return_output,
 opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output,
 swp2_uxn_opcodes_h_l2903_c40_40a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_return_output,
 rot_uxn_opcodes_h_l2904_c40_d162_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output,
 rot2_uxn_opcodes_h_l2905_c40_a0e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output,
 opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output,
 dup_uxn_opcodes_h_l2906_c40_4842_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output,
 dup2_uxn_opcodes_h_l2907_c40_f42b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output,
 opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output,
 ovr_uxn_opcodes_h_l2908_c40_a4fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output,
 opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output,
 ovr2_uxn_opcodes_h_l2909_c40_8dbf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output,
 opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output,
 equ_uxn_opcodes_h_l2910_c40_9012_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output,
 equ2_uxn_opcodes_h_l2911_c40_fe28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output,
 neq_uxn_opcodes_h_l2912_c40_1abf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output,
 opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output,
 neq2_uxn_opcodes_h_l2913_c40_ec26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_return_output,
 opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output,
 gth_uxn_opcodes_h_l2914_c40_a832_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_return_output,
 gth2_uxn_opcodes_h_l2915_c40_b990_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output,
 lth_uxn_opcodes_h_l2916_c40_b59f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output,
 lth2_uxn_opcodes_h_l2917_c40_85ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_return_output,
 jmp_uxn_opcodes_h_l2918_c40_a3b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output,
 opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output,
 jmp2_uxn_opcodes_h_l2919_c40_efa4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output,
 opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output,
 jcn_uxn_opcodes_h_l2920_c40_970c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output,
 jcn2_uxn_opcodes_h_l2921_c40_9218_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output,
 jsr_uxn_opcodes_h_l2922_c40_92be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_return_output,
 jsr2_uxn_opcodes_h_l2923_c40_ceaf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_return_output,
 opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output,
 sth_uxn_opcodes_h_l2924_c40_8a87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_return_output,
 sth2_uxn_opcodes_h_l2925_c40_b059_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output,
 ldz_uxn_opcodes_h_l2926_c40_b163_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output,
 ldz2_uxn_opcodes_h_l2927_c40_d69a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_return_output,
 opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output,
 stz_uxn_opcodes_h_l2928_c40_575e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_return_output,
 stz2_uxn_opcodes_h_l2929_c40_650d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output,
 opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output,
 ldr_uxn_opcodes_h_l2930_c40_65e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_return_output,
 opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output,
 ldr2_uxn_opcodes_h_l2931_c40_936e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_return_output,
 opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_return_output,
 str1_uxn_opcodes_h_l2932_c40_3137_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_return_output,
 str2_uxn_opcodes_h_l2933_c40_587f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_return_output,
 opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_return_output,
 lda_uxn_opcodes_h_l2934_c40_d8ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_return_output,
 lda2_uxn_opcodes_h_l2935_c40_c21e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output,
 sta_uxn_opcodes_h_l2936_c40_6e8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_return_output,
 opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output,
 sta2_uxn_opcodes_h_l2937_c40_a4fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_return_output,
 dei_uxn_opcodes_h_l2938_c40_ad7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output,
 dei2_uxn_opcodes_h_l2939_c40_d10b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output,
 deo_uxn_opcodes_h_l2940_c40_f622_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output,
 opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output,
 deo2_uxn_opcodes_h_l2941_c40_4576_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output,
 opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output,
 add_uxn_opcodes_h_l2942_c40_a15e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_return_output,
 opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output,
 add2_uxn_opcodes_h_l2943_c40_3f93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_return_output,
 sub_uxn_opcodes_h_l2944_c40_06f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output,
 sub2_uxn_opcodes_h_l2945_c40_e61d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output,
 opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output,
 mul_uxn_opcodes_h_l2946_c40_d2e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_return_output,
 opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output,
 mul2_uxn_opcodes_h_l2947_c40_01f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output,
 opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_return_output,
 div_uxn_opcodes_h_l2948_c40_4cc1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_return_output,
 opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output,
 div2_uxn_opcodes_h_l2949_c40_64e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output,
 opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_return_output,
 and_uxn_opcodes_h_l2950_c40_c59f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_return_output,
 opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output,
 and2_uxn_opcodes_h_l2951_c40_ae80_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_return_output,
 ora_uxn_opcodes_h_l2952_c40_b07d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output,
 ora2_uxn_opcodes_h_l2953_c40_d3c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_return_output,
 opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output,
 eor_uxn_opcodes_h_l2954_c40_9707_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output,
 opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_return_output,
 eor2_uxn_opcodes_h_l2955_c40_eb72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output,
 sft_uxn_opcodes_h_l2956_c40_e6a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_return_output,
 opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_return_output,
 sft2_uxn_opcodes_h_l2957_c40_7e12_return_output,
 CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_return_output,
 sp0_MUX_uxn_opcodes_h_l2962_c2_c726_return_output,
 sp1_MUX_uxn_opcodes_h_l2962_c2_c726_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_return_output,
 MUX_uxn_opcodes_h_l2968_c29_22ba_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_return_output,
 MUX_uxn_opcodes_h_l2969_c20_878e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_return_output,
 stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2881_c14_bde4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2881_c14_bde4_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2881_c14_bde4_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2881_c14_bde4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2882_c8_f712_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2882_c8_f712_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2882_c8_f712_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_cond : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_cond : unsigned(0 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2888_c48_a8f0_phase : unsigned(7 downto 0);
 variable VAR_brk_uxn_opcodes_h_l2888_c48_a8f0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2892_c40_eba5_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2892_c40_eba5_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2892_c40_eba5_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2892_c40_eba5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2892_c40_eba5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2896_c40_1912_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2896_c40_1912_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2896_c40_1912_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2896_c40_1912_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2896_c40_1912_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2897_c40_2036_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2897_c40_2036_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2897_c40_2036_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2897_c40_2036_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2897_c40_2036_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2898_c40_33f1_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2898_c40_33f1_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2898_c40_33f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2898_c40_33f1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2899_c40_caf6_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2899_c40_caf6_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2899_c40_caf6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2899_c40_caf6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2902_c40_779b_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2902_c40_779b_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2902_c40_779b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2902_c40_779b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2902_c40_779b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2904_c40_d162_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2904_c40_d162_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2904_c40_d162_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2904_c40_d162_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2904_c40_d162_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2906_c40_4842_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2906_c40_4842_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2906_c40_4842_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2906_c40_4842_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2906_c40_4842_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2910_c40_9012_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2910_c40_9012_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2910_c40_9012_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2910_c40_9012_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2910_c40_9012_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2912_c40_1abf_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2912_c40_1abf_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2912_c40_1abf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2912_c40_1abf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2912_c40_1abf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2914_c40_a832_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2914_c40_a832_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2914_c40_a832_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2914_c40_a832_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2914_c40_a832_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2915_c40_b990_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2915_c40_b990_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2915_c40_b990_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2915_c40_b990_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2915_c40_b990_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2916_c40_b59f_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2916_c40_b59f_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2916_c40_b59f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2916_c40_b59f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2916_c40_b59f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2920_c40_970c_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2920_c40_970c_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2920_c40_970c_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2920_c40_970c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2920_c40_970c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2920_c40_970c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2922_c40_92be_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2922_c40_92be_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2922_c40_92be_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2922_c40_92be_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2922_c40_92be_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2922_c40_92be_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2924_c40_8a87_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2924_c40_8a87_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2924_c40_8a87_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2924_c40_8a87_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2924_c40_8a87_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2925_c40_b059_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2925_c40_b059_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2925_c40_b059_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2925_c40_b059_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2925_c40_b059_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2926_c40_b163_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2926_c40_b163_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2926_c40_b163_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2926_c40_b163_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2926_c40_b163_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2926_c40_b163_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2928_c40_575e_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2928_c40_575e_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2928_c40_575e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2928_c40_575e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2928_c40_575e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2929_c40_650d_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2929_c40_650d_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2929_c40_650d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2929_c40_650d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2929_c40_650d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2932_c40_3137_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2932_c40_3137_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2932_c40_3137_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2932_c40_3137_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2932_c40_3137_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2932_c40_3137_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2933_c40_587f_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2933_c40_587f_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2933_c40_587f_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2933_c40_587f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2933_c40_587f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2933_c40_587f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2940_c40_f622_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2940_c40_f622_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2940_c40_f622_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2940_c40_f622_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2940_c40_f622_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2940_c40_f622_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2940_c40_f622_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2941_c40_4576_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2941_c40_4576_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2941_c40_4576_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2941_c40_4576_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2941_c40_4576_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2941_c40_4576_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2941_c40_4576_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2942_c40_a15e_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2942_c40_a15e_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2942_c40_a15e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2942_c40_a15e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2942_c40_a15e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2943_c40_3f93_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2943_c40_3f93_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2943_c40_3f93_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2943_c40_3f93_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2943_c40_3f93_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2944_c40_06f0_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2944_c40_06f0_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2944_c40_06f0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2944_c40_06f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2944_c40_06f0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2948_c40_4cc1_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2948_c40_4cc1_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2948_c40_4cc1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2948_c40_4cc1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2948_c40_4cc1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2949_c40_64e2_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2949_c40_64e2_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2949_c40_64e2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2949_c40_64e2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2949_c40_64e2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2950_c40_c59f_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2950_c40_c59f_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2950_c40_c59f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2950_c40_c59f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2950_c40_c59f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2951_c40_ae80_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2951_c40_ae80_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2951_c40_ae80_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2951_c40_ae80_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2951_c40_ae80_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2952_c40_b07d_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2952_c40_b07d_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2952_c40_b07d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2952_c40_b07d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2952_c40_b07d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2954_c40_9707_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2954_c40_9707_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2954_c40_9707_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2954_c40_9707_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2954_c40_9707_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2959_c2_daa0 : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2960_c17_1690_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_c726_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_c726_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2965_c3_ba3b : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_c726_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_c726_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_c726_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2963_c3_f63e : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_c726_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_c726_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_c726_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2968_c29_22ba_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2968_c29_22ba_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2968_c29_22ba_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2968_c29_22ba_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2968_c19_90e1_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2968_c68_0d66_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2968_c58_79b5_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_return_output : unsigned(8 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2969_c2_83b2 : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2969_c20_878e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2969_c20_878e_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2969_c20_878e_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2969_c20_878e_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_return_output : unsigned(9 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2974_c3_36af_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2978_c39_4f7b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2979_c40_201d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2980_c34_592e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2981_c30_5c0a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2982_c33_f5f4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2983_c34_e4b4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2984_c37_a061_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2986_c32_dd52_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2963_l2965_DUPLICATE_a7a5_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2963_l2965_DUPLICATE_be96_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2985_l2973_DUPLICATE_8e5c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2988_l2865_DUPLICATE_99e6_return_output : eval_opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_right := to_unsigned(24, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_right := to_unsigned(2, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_right := to_unsigned(56, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_right := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_right := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_right := to_unsigned(30, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_right := to_unsigned(48, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_right := to_unsigned(58, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_right := to_unsigned(42, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_right := to_unsigned(3, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_right := to_unsigned(39, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_right := to_unsigned(12, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_right := to_unsigned(37, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_right := to_unsigned(23, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_right := to_unsigned(8, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_right := to_unsigned(15, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_right := to_unsigned(31, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_right := to_unsigned(38, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2881_c14_bde4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_right := to_unsigned(59, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_right := to_unsigned(25, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_right := to_unsigned(54, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_right := to_unsigned(45, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_right := to_unsigned(61, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_right := to_unsigned(13, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_right := to_unsigned(10, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_right := to_unsigned(223, 8);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_right := to_unsigned(32, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_right := to_unsigned(55, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_right := to_unsigned(26, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_right := to_unsigned(57, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_right := to_unsigned(50, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_right := to_unsigned(53, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_right := to_unsigned(4, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_right := to_unsigned(35, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_right := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_right := to_unsigned(33, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_right := to_unsigned(192, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_right := to_unsigned(63, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_right := to_unsigned(34, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_right := to_unsigned(32, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_right := to_unsigned(51, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_right := to_unsigned(17, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_right := to_unsigned(7, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_right := to_unsigned(160, 8);
     VAR_MUX_uxn_opcodes_h_l2969_c20_878e_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_right := to_unsigned(60, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_right := to_unsigned(19, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_right := to_unsigned(27, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_right := to_unsigned(64, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_right := to_unsigned(21, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_right := to_unsigned(36, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_right := to_unsigned(46, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_right := to_unsigned(14, 8);
     VAR_MUX_uxn_opcodes_h_l2969_c20_878e_iftrue := to_unsigned(256, 9);
     VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_right := to_unsigned(18, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_right := to_unsigned(5, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_right := to_unsigned(44, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_right := to_unsigned(1, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_right := to_unsigned(49, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_right := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_right := to_unsigned(9, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_right := to_unsigned(62, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_right := to_unsigned(224, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_right := to_unsigned(96, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_right := to_unsigned(20, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_right := to_unsigned(29, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_right := to_unsigned(22, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_right := to_unsigned(16, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_right := to_unsigned(11, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_right := to_unsigned(52, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_right := to_unsigned(47, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_right := to_unsigned(28, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2881_c14_bde4_iffalse := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_iftrue := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_left := VAR_ins;
     VAR_CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e_x := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2882_c8_f712_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2943_c40_3f93_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2942_c40_a15e_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2951_c40_ae80_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2950_c40_c59f_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2941_c40_4576_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2940_c40_f622_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2949_c40_64e2_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2948_c40_4cc1_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2906_c40_4842_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2954_c40_9707_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2910_c40_9012_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2915_c40_b990_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2914_c40_a832_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2897_c40_2036_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2896_c40_1912_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2920_c40_970c_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2922_c40_92be_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2926_c40_b163_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2916_c40_b59f_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2912_c40_1abf_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2952_c40_b07d_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2899_c40_caf6_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2898_c40_33f1_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2904_c40_d162_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2925_c40_b059_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2924_c40_8a87_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2932_c40_3137_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2933_c40_587f_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2929_c40_650d_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2928_c40_575e_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2944_c40_06f0_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2902_c40_779b_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2920_c40_970c_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2922_c40_92be_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2892_c40_eba5_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2932_c40_3137_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2933_c40_587f_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2943_c40_3f93_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2942_c40_a15e_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2951_c40_ae80_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2950_c40_c59f_phase := VAR_phase;
     VAR_brk_uxn_opcodes_h_l2888_c48_a8f0_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2941_c40_4576_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2940_c40_f622_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2949_c40_64e2_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2948_c40_4cc1_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2906_c40_4842_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2954_c40_9707_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2910_c40_9012_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2915_c40_b990_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2914_c40_a832_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2897_c40_2036_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2896_c40_1912_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2920_c40_970c_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2922_c40_92be_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2926_c40_b163_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2892_c40_eba5_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2916_c40_b59f_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2912_c40_1abf_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2952_c40_b07d_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2899_c40_caf6_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2898_c40_33f1_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2904_c40_d162_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2925_c40_b059_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2924_c40_8a87_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2932_c40_3137_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2933_c40_587f_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2929_c40_650d_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2928_c40_575e_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2944_c40_06f0_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2902_c40_779b_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2941_c40_4576_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2940_c40_f622_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2941_c40_4576_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2940_c40_f622_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2926_c40_b163_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2892_c40_eba5_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2943_c40_3f93_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2942_c40_a15e_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2951_c40_ae80_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2950_c40_c59f_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2941_c40_4576_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2940_c40_f622_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2949_c40_64e2_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2948_c40_4cc1_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2906_c40_4842_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2954_c40_9707_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2910_c40_9012_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2915_c40_b990_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2914_c40_a832_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2897_c40_2036_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2896_c40_1912_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2920_c40_970c_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2922_c40_92be_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2926_c40_b163_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2916_c40_b59f_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2912_c40_1abf_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2952_c40_b07d_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2904_c40_d162_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2925_c40_b059_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2924_c40_8a87_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2932_c40_3137_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2933_c40_587f_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2929_c40_650d_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2928_c40_575e_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_previous_stack_read := previous_stack_read;
     VAR_sub_uxn_opcodes_h_l2944_c40_06f0_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2902_c40_779b_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_c726_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_c726_iffalse := sp1;
     -- CONST_SR_6[uxn_opcodes_h_l2959_c16_e14e] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e_return_output := CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e_return_output;

     -- brk[uxn_opcodes_h_l2888_c48_a8f0] LATENCY=0
     -- Inputs
     brk_uxn_opcodes_h_l2888_c48_a8f0_phase <= VAR_brk_uxn_opcodes_h_l2888_c48_a8f0_phase;
     -- Outputs
     VAR_brk_uxn_opcodes_h_l2888_c48_a8f0_return_output := brk_uxn_opcodes_h_l2888_c48_a8f0_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2880_c14_af8a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_left;
     BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_return_output := BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_return_output;
     VAR_MUX_uxn_opcodes_h_l2882_c8_f712_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2880_c14_af8a_return_output;
     VAR_stack_index_uxn_opcodes_h_l2959_c2_daa0 := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2959_c16_e14e_return_output, 1);
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_iftrue := VAR_brk_uxn_opcodes_h_l2888_c48_a8f0_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_left := VAR_stack_index_uxn_opcodes_h_l2959_c2_daa0;
     -- BIN_OP_XOR[uxn_opcodes_h_l2881_c14_f1d7] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_left;
     BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_return_output := BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2881_c14_f1d7_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2881_c14_bda9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_left;
     BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_return_output := BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2881_c14_bda9_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2881_c14_8ce8] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2881_c14_8ce8_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2881_c14_8225] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2881_c14_bde4_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2881_c14_8225_return_output;
     -- MUX[uxn_opcodes_h_l2881_c14_bde4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2881_c14_bde4_cond <= VAR_MUX_uxn_opcodes_h_l2881_c14_bde4_cond;
     MUX_uxn_opcodes_h_l2881_c14_bde4_iftrue <= VAR_MUX_uxn_opcodes_h_l2881_c14_bde4_iftrue;
     MUX_uxn_opcodes_h_l2881_c14_bde4_iffalse <= VAR_MUX_uxn_opcodes_h_l2881_c14_bde4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2881_c14_bde4_return_output := MUX_uxn_opcodes_h_l2881_c14_bde4_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2882_c8_f712_cond := VAR_MUX_uxn_opcodes_h_l2881_c14_bde4_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2881_c14_bde4_return_output;
     -- MUX[uxn_opcodes_h_l2882_c8_f712] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2882_c8_f712_cond <= VAR_MUX_uxn_opcodes_h_l2882_c8_f712_cond;
     MUX_uxn_opcodes_h_l2882_c8_f712_iftrue <= VAR_MUX_uxn_opcodes_h_l2882_c8_f712_iftrue;
     MUX_uxn_opcodes_h_l2882_c8_f712_iffalse <= VAR_MUX_uxn_opcodes_h_l2882_c8_f712_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output := MUX_uxn_opcodes_h_l2882_c8_f712_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_left := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2882_c8_f712_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2929_c11_95a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_4fbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_b1c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2936_c11_65a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2934_c11_cb73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_left;
     BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_return_output := BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2916_c11_abdc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2947_c11_d20a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2898_c11_8104] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_left;
     BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_return_output := BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2900_c11_249d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2949_c11_c520] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_left;
     BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_return_output := BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2933_c11_34e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_2500] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_left;
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_return_output := BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2941_c11_8b4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2948_c11_18cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2945_c11_2725] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_left;
     BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_return_output := BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_bdc4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2940_c11_c97b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_ccca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2921_c11_d4bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c11_f92a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2895_c11_d446] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_left;
     BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_return_output := BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2939_c11_3cf3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2915_c11_8740] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_left;
     BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_return_output := BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2938_c11_a992] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_left;
     BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_return_output := BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2942_c11_82ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_73e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2937_c11_a40b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2944_c11_edf1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c6_8129] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2919_c11_2f0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2955_c11_62ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2917_c11_bf2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_3f8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2897_c11_f24b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2901_c11_8398] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_left;
     BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_return_output := BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2914_c11_2fb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_134b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2951_c11_fecb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2911_c11_064e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2956_c11_df87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_left;
     BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_return_output := BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2923_c11_1a3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2889_c11_c457] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_left;
     BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_return_output := BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2925_c11_633d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2902_c11_6d64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_left;
     BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_return_output := BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_8392] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2943_c11_2b33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_left;
     BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_return_output := BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2893_c11_6fee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2931_c11_8192] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_left;
     BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_return_output := BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2927_c11_f39d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2926_c11_fcdf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2922_c11_d1b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2930_c11_f932] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_left;
     BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_return_output := BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2957_c11_a5f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2946_c11_d235] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_left;
     BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_return_output := BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2905_c11_0c6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2890_c11_f109] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_left;
     BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_return_output := BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2953_c11_dab6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2904_c11_022f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2935_c11_2685] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_left;
     BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_return_output := BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2908_c11_d556] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_left;
     BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_return_output := BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2950_c11_9db3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2894_c11_a762] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_left;
     BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_return_output := BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2907_c11_4bb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2954_c11_d085] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_left;
     BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_return_output := BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2892_c11_d36d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_8c70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_5cc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2920_c11_0c0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2909_c11_7ad7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2912_c11_1311] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_left;
     BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_return_output := BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c6_8129_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2889_c11_c457_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2890_c11_f109_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c11_f92a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2892_c11_d36d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2893_c11_6fee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2894_c11_a762_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2895_c11_d446_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_8392_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2897_c11_f24b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2898_c11_8104_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_3f8d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2900_c11_249d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2901_c11_8398_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2902_c11_6d64_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_134b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2904_c11_022f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2905_c11_0c6a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_ccca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2907_c11_4bb6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2908_c11_d556_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2909_c11_7ad7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_bdc4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2911_c11_064e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2912_c11_1311_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_8c70_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2914_c11_2fb9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2915_c11_8740_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2916_c11_abdc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2917_c11_bf2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b1c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2919_c11_2f0c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2920_c11_0c0c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2921_c11_d4bd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2922_c11_d1b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2923_c11_1a3c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_73e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2925_c11_633d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2926_c11_fcdf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2927_c11_f39d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_5cc8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2929_c11_95a7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2930_c11_f932_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2931_c11_8192_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_4fbf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2933_c11_34e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2934_c11_cb73_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2935_c11_2685_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2936_c11_65a5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2937_c11_a40b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2938_c11_a992_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2939_c11_3cf3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2940_c11_c97b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2941_c11_8b4c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2942_c11_82ef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2943_c11_2b33_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c11_edf1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2945_c11_2725_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2946_c11_d235_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2947_c11_d20a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2948_c11_18cd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_c520_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2950_c11_9db3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2951_c11_fecb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_2500_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2953_c11_dab6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2954_c11_d085_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2955_c11_62ad_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2956_c11_df87_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_a5f6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c7_04b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2888_c2_55dc] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_cond;
     is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output := is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_aa08] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c7_2b44] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output;
     VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_aa08_return_output;
     -- jci[uxn_opcodes_h_l2889_c40_1c1d] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2889_c40_1c1d_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2889_c40_1c1d_phase <= VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_phase;
     jci_uxn_opcodes_h_l2889_c40_1c1d_pc <= VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_pc;
     jci_uxn_opcodes_h_l2889_c40_1c1d_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_previous_stack_read;
     jci_uxn_opcodes_h_l2889_c40_1c1d_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_return_output := jci_uxn_opcodes_h_l2889_c40_1c1d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2890_c1_fbd6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c7_6eb5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output;
     VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2890_c1_fbd6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_iftrue := VAR_jci_uxn_opcodes_h_l2889_c40_1c1d_return_output;
     -- jmi[uxn_opcodes_h_l2890_c40_d8fc] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2890_c40_d8fc_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2890_c40_d8fc_phase <= VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_phase;
     jmi_uxn_opcodes_h_l2890_c40_d8fc_pc <= VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_pc;
     jmi_uxn_opcodes_h_l2890_c40_d8fc_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_return_output := jmi_uxn_opcodes_h_l2890_c40_d8fc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_2074] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c7_60a7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output;
     VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_2074_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_iftrue := VAR_jmi_uxn_opcodes_h_l2890_c40_d8fc_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2892_c1_26a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_return_output;

     -- jsi[uxn_opcodes_h_l2891_c40_08d2] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2891_c40_08d2_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2891_c40_08d2_phase <= VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_phase;
     jsi_uxn_opcodes_h_l2891_c40_08d2_pc <= VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_pc;
     jsi_uxn_opcodes_h_l2891_c40_08d2_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_return_output := jsi_uxn_opcodes_h_l2891_c40_08d2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c7_f20d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output;
     VAR_lit_uxn_opcodes_h_l2892_c40_eba5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2892_c1_26a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_iftrue := VAR_jsi_uxn_opcodes_h_l2891_c40_08d2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c7_f749] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_return_output;

     -- lit[uxn_opcodes_h_l2892_c40_eba5] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2892_c40_eba5_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2892_c40_eba5_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2892_c40_eba5_phase <= VAR_lit_uxn_opcodes_h_l2892_c40_eba5_phase;
     lit_uxn_opcodes_h_l2892_c40_eba5_pc <= VAR_lit_uxn_opcodes_h_l2892_c40_eba5_pc;
     lit_uxn_opcodes_h_l2892_c40_eba5_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2892_c40_eba5_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2892_c40_eba5_return_output := lit_uxn_opcodes_h_l2892_c40_eba5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2893_c1_efd9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c7_f749_return_output;
     VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2893_c1_efd9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_iftrue := VAR_lit_uxn_opcodes_h_l2892_c40_eba5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c7_7087] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_return_output;

     -- lit2[uxn_opcodes_h_l2893_c40_59fa] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2893_c40_59fa_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2893_c40_59fa_phase <= VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_phase;
     lit2_uxn_opcodes_h_l2893_c40_59fa_pc <= VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_pc;
     lit2_uxn_opcodes_h_l2893_c40_59fa_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_return_output := lit2_uxn_opcodes_h_l2893_c40_59fa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2894_c1_964a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c7_7087_return_output;
     VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2894_c1_964a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_iftrue := VAR_lit2_uxn_opcodes_h_l2893_c40_59fa_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2895_c1_8c38] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c7_b5a2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output;

     -- lit[uxn_opcodes_h_l2894_c40_0fd7] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2894_c40_0fd7_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2894_c40_0fd7_phase <= VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_phase;
     lit_uxn_opcodes_h_l2894_c40_0fd7_pc <= VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_pc;
     lit_uxn_opcodes_h_l2894_c40_0fd7_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_return_output := lit_uxn_opcodes_h_l2894_c40_0fd7_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output;
     VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2895_c1_8c38_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_iftrue := VAR_lit_uxn_opcodes_h_l2894_c40_0fd7_return_output;
     -- lit2[uxn_opcodes_h_l2895_c40_fe58] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2895_c40_fe58_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2895_c40_fe58_phase <= VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_phase;
     lit2_uxn_opcodes_h_l2895_c40_fe58_pc <= VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_pc;
     lit2_uxn_opcodes_h_l2895_c40_fe58_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_return_output := lit2_uxn_opcodes_h_l2895_c40_fe58_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c7_37ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2896_c1_9f44] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output;
     VAR_inc_uxn_opcodes_h_l2896_c40_1912_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2896_c1_9f44_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_iftrue := VAR_lit2_uxn_opcodes_h_l2895_c40_fe58_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c7_8d31] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output;

     -- inc[uxn_opcodes_h_l2896_c40_1912] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2896_c40_1912_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2896_c40_1912_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2896_c40_1912_phase <= VAR_inc_uxn_opcodes_h_l2896_c40_1912_phase;
     inc_uxn_opcodes_h_l2896_c40_1912_ins <= VAR_inc_uxn_opcodes_h_l2896_c40_1912_ins;
     inc_uxn_opcodes_h_l2896_c40_1912_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2896_c40_1912_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2896_c40_1912_return_output := inc_uxn_opcodes_h_l2896_c40_1912_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2897_c1_0cd6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output;
     VAR_inc2_uxn_opcodes_h_l2897_c40_2036_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2897_c1_0cd6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_iftrue := VAR_inc_uxn_opcodes_h_l2896_c40_1912_return_output;
     -- inc2[uxn_opcodes_h_l2897_c40_2036] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2897_c40_2036_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2897_c40_2036_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2897_c40_2036_phase <= VAR_inc2_uxn_opcodes_h_l2897_c40_2036_phase;
     inc2_uxn_opcodes_h_l2897_c40_2036_ins <= VAR_inc2_uxn_opcodes_h_l2897_c40_2036_ins;
     inc2_uxn_opcodes_h_l2897_c40_2036_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2897_c40_2036_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2897_c40_2036_return_output := inc2_uxn_opcodes_h_l2897_c40_2036_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c7_fcfc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2898_c1_4822] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output;
     VAR_pop_uxn_opcodes_h_l2898_c40_33f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2898_c1_4822_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_iftrue := VAR_inc2_uxn_opcodes_h_l2897_c40_2036_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2899_c1_f92f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_return_output;

     -- pop[uxn_opcodes_h_l2898_c40_33f1] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2898_c40_33f1_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2898_c40_33f1_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2898_c40_33f1_phase <= VAR_pop_uxn_opcodes_h_l2898_c40_33f1_phase;
     pop_uxn_opcodes_h_l2898_c40_33f1_ins <= VAR_pop_uxn_opcodes_h_l2898_c40_33f1_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2898_c40_33f1_return_output := pop_uxn_opcodes_h_l2898_c40_33f1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c7_8573] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c7_8573_return_output;
     VAR_pop2_uxn_opcodes_h_l2899_c40_caf6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2899_c1_f92f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_iftrue := VAR_pop_uxn_opcodes_h_l2898_c40_33f1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c7_e4fc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output;

     -- pop2[uxn_opcodes_h_l2899_c40_caf6] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2899_c40_caf6_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2899_c40_caf6_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2899_c40_caf6_phase <= VAR_pop2_uxn_opcodes_h_l2899_c40_caf6_phase;
     pop2_uxn_opcodes_h_l2899_c40_caf6_ins <= VAR_pop2_uxn_opcodes_h_l2899_c40_caf6_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2899_c40_caf6_return_output := pop2_uxn_opcodes_h_l2899_c40_caf6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2900_c1_29df] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output;
     VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2900_c1_29df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_iftrue := VAR_pop2_uxn_opcodes_h_l2899_c40_caf6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2901_c1_2675] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_return_output;

     -- nip[uxn_opcodes_h_l2900_c40_c7ad] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2900_c40_c7ad_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2900_c40_c7ad_phase <= VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_phase;
     nip_uxn_opcodes_h_l2900_c40_c7ad_ins <= VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_ins;
     nip_uxn_opcodes_h_l2900_c40_c7ad_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_return_output := nip_uxn_opcodes_h_l2900_c40_c7ad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c7_3192] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c7_3192_return_output;
     VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2901_c1_2675_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_iftrue := VAR_nip_uxn_opcodes_h_l2900_c40_c7ad_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2902_c1_9541] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_return_output;

     -- nip2[uxn_opcodes_h_l2901_c40_2f88] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2901_c40_2f88_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2901_c40_2f88_phase <= VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_phase;
     nip2_uxn_opcodes_h_l2901_c40_2f88_ins <= VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_ins;
     nip2_uxn_opcodes_h_l2901_c40_2f88_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_return_output := nip2_uxn_opcodes_h_l2901_c40_2f88_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c7_fc01] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output;
     VAR_swp_uxn_opcodes_h_l2902_c40_779b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2902_c1_9541_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_iftrue := VAR_nip2_uxn_opcodes_h_l2901_c40_2f88_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c7_4114] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_return_output;

     -- swp[uxn_opcodes_h_l2902_c40_779b] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2902_c40_779b_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2902_c40_779b_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2902_c40_779b_phase <= VAR_swp_uxn_opcodes_h_l2902_c40_779b_phase;
     swp_uxn_opcodes_h_l2902_c40_779b_ins <= VAR_swp_uxn_opcodes_h_l2902_c40_779b_ins;
     swp_uxn_opcodes_h_l2902_c40_779b_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2902_c40_779b_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2902_c40_779b_return_output := swp_uxn_opcodes_h_l2902_c40_779b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2903_c1_cb03] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c7_4114_return_output;
     VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2903_c1_cb03_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_iftrue := VAR_swp_uxn_opcodes_h_l2902_c40_779b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_3474] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_return_output;

     -- swp2[uxn_opcodes_h_l2903_c40_40a2] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2903_c40_40a2_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2903_c40_40a2_phase <= VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_phase;
     swp2_uxn_opcodes_h_l2903_c40_40a2_ins <= VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_ins;
     swp2_uxn_opcodes_h_l2903_c40_40a2_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_return_output := swp2_uxn_opcodes_h_l2903_c40_40a2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c7_9b6d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output;
     VAR_rot_uxn_opcodes_h_l2904_c40_d162_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_3474_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_iftrue := VAR_swp2_uxn_opcodes_h_l2903_c40_40a2_return_output;
     -- rot[uxn_opcodes_h_l2904_c40_d162] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2904_c40_d162_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2904_c40_d162_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2904_c40_d162_phase <= VAR_rot_uxn_opcodes_h_l2904_c40_d162_phase;
     rot_uxn_opcodes_h_l2904_c40_d162_ins <= VAR_rot_uxn_opcodes_h_l2904_c40_d162_ins;
     rot_uxn_opcodes_h_l2904_c40_d162_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2904_c40_d162_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2904_c40_d162_return_output := rot_uxn_opcodes_h_l2904_c40_d162_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c7_0ba6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2905_c1_36a4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output;
     VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2905_c1_36a4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_iftrue := VAR_rot_uxn_opcodes_h_l2904_c40_d162_return_output;
     -- rot2[uxn_opcodes_h_l2905_c40_a0e1] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2905_c40_a0e1_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2905_c40_a0e1_phase <= VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_phase;
     rot2_uxn_opcodes_h_l2905_c40_a0e1_ins <= VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_ins;
     rot2_uxn_opcodes_h_l2905_c40_a0e1_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_return_output := rot2_uxn_opcodes_h_l2905_c40_a0e1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c7_8a17] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2906_c1_8b26] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output;
     VAR_dup_uxn_opcodes_h_l2906_c40_4842_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2906_c1_8b26_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_iftrue := VAR_rot2_uxn_opcodes_h_l2905_c40_a0e1_return_output;
     -- dup[uxn_opcodes_h_l2906_c40_4842] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2906_c40_4842_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2906_c40_4842_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2906_c40_4842_phase <= VAR_dup_uxn_opcodes_h_l2906_c40_4842_phase;
     dup_uxn_opcodes_h_l2906_c40_4842_ins <= VAR_dup_uxn_opcodes_h_l2906_c40_4842_ins;
     dup_uxn_opcodes_h_l2906_c40_4842_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2906_c40_4842_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2906_c40_4842_return_output := dup_uxn_opcodes_h_l2906_c40_4842_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c7_f1b4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2907_c1_16f6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output;
     VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2907_c1_16f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_iftrue := VAR_dup_uxn_opcodes_h_l2906_c40_4842_return_output;
     -- dup2[uxn_opcodes_h_l2907_c40_f42b] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2907_c40_f42b_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2907_c40_f42b_phase <= VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_phase;
     dup2_uxn_opcodes_h_l2907_c40_f42b_ins <= VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_ins;
     dup2_uxn_opcodes_h_l2907_c40_f42b_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_return_output := dup2_uxn_opcodes_h_l2907_c40_f42b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c7_53ac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2908_c1_a4b9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output;
     VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2908_c1_a4b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_iftrue := VAR_dup2_uxn_opcodes_h_l2907_c40_f42b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c7_7a35] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2909_c1_8fe6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_return_output;

     -- ovr[uxn_opcodes_h_l2908_c40_a4fe] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2908_c40_a4fe_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2908_c40_a4fe_phase <= VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_phase;
     ovr_uxn_opcodes_h_l2908_c40_a4fe_ins <= VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_ins;
     ovr_uxn_opcodes_h_l2908_c40_a4fe_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_return_output := ovr_uxn_opcodes_h_l2908_c40_a4fe_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output;
     VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2909_c1_8fe6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_iftrue := VAR_ovr_uxn_opcodes_h_l2908_c40_a4fe_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2910_c1_d95b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c7_10ff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output;

     -- ovr2[uxn_opcodes_h_l2909_c40_8dbf] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2909_c40_8dbf_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2909_c40_8dbf_phase <= VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_phase;
     ovr2_uxn_opcodes_h_l2909_c40_8dbf_ins <= VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_ins;
     ovr2_uxn_opcodes_h_l2909_c40_8dbf_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_return_output := ovr2_uxn_opcodes_h_l2909_c40_8dbf_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output;
     VAR_equ_uxn_opcodes_h_l2910_c40_9012_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2910_c1_d95b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_iftrue := VAR_ovr2_uxn_opcodes_h_l2909_c40_8dbf_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2911_c1_a939] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_return_output;

     -- equ[uxn_opcodes_h_l2910_c40_9012] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2910_c40_9012_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2910_c40_9012_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2910_c40_9012_phase <= VAR_equ_uxn_opcodes_h_l2910_c40_9012_phase;
     equ_uxn_opcodes_h_l2910_c40_9012_ins <= VAR_equ_uxn_opcodes_h_l2910_c40_9012_ins;
     equ_uxn_opcodes_h_l2910_c40_9012_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2910_c40_9012_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2910_c40_9012_return_output := equ_uxn_opcodes_h_l2910_c40_9012_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c7_dfdc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output;
     VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2911_c1_a939_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_iftrue := VAR_equ_uxn_opcodes_h_l2910_c40_9012_return_output;
     -- equ2[uxn_opcodes_h_l2911_c40_fe28] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2911_c40_fe28_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2911_c40_fe28_phase <= VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_phase;
     equ2_uxn_opcodes_h_l2911_c40_fe28_ins <= VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_ins;
     equ2_uxn_opcodes_h_l2911_c40_fe28_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_return_output := equ2_uxn_opcodes_h_l2911_c40_fe28_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c7_f77c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2912_c1_5c29] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output;
     VAR_neq_uxn_opcodes_h_l2912_c40_1abf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2912_c1_5c29_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_iftrue := VAR_equ2_uxn_opcodes_h_l2911_c40_fe28_return_output;
     -- neq[uxn_opcodes_h_l2912_c40_1abf] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2912_c40_1abf_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2912_c40_1abf_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2912_c40_1abf_phase <= VAR_neq_uxn_opcodes_h_l2912_c40_1abf_phase;
     neq_uxn_opcodes_h_l2912_c40_1abf_ins <= VAR_neq_uxn_opcodes_h_l2912_c40_1abf_ins;
     neq_uxn_opcodes_h_l2912_c40_1abf_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2912_c40_1abf_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2912_c40_1abf_return_output := neq_uxn_opcodes_h_l2912_c40_1abf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_2e17] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c7_4e31] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output;
     VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_2e17_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_iftrue := VAR_neq_uxn_opcodes_h_l2912_c40_1abf_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2914_c1_59f2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c7_0136] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_return_output;

     -- neq2[uxn_opcodes_h_l2913_c40_ec26] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2913_c40_ec26_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2913_c40_ec26_phase <= VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_phase;
     neq2_uxn_opcodes_h_l2913_c40_ec26_ins <= VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_ins;
     neq2_uxn_opcodes_h_l2913_c40_ec26_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_return_output := neq2_uxn_opcodes_h_l2913_c40_ec26_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c7_0136_return_output;
     VAR_gth_uxn_opcodes_h_l2914_c40_a832_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2914_c1_59f2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_iftrue := VAR_neq2_uxn_opcodes_h_l2913_c40_ec26_return_output;
     -- gth[uxn_opcodes_h_l2914_c40_a832] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2914_c40_a832_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2914_c40_a832_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2914_c40_a832_phase <= VAR_gth_uxn_opcodes_h_l2914_c40_a832_phase;
     gth_uxn_opcodes_h_l2914_c40_a832_ins <= VAR_gth_uxn_opcodes_h_l2914_c40_a832_ins;
     gth_uxn_opcodes_h_l2914_c40_a832_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2914_c40_a832_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2914_c40_a832_return_output := gth_uxn_opcodes_h_l2914_c40_a832_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2915_c1_072a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c7_d5c2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output;
     VAR_gth2_uxn_opcodes_h_l2915_c40_b990_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2915_c1_072a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_iftrue := VAR_gth_uxn_opcodes_h_l2914_c40_a832_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c7_b7d6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output;

     -- gth2[uxn_opcodes_h_l2915_c40_b990] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2915_c40_b990_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2915_c40_b990_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2915_c40_b990_phase <= VAR_gth2_uxn_opcodes_h_l2915_c40_b990_phase;
     gth2_uxn_opcodes_h_l2915_c40_b990_ins <= VAR_gth2_uxn_opcodes_h_l2915_c40_b990_ins;
     gth2_uxn_opcodes_h_l2915_c40_b990_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2915_c40_b990_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2915_c40_b990_return_output := gth2_uxn_opcodes_h_l2915_c40_b990_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2916_c1_18a0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output;
     VAR_lth_uxn_opcodes_h_l2916_c40_b59f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2916_c1_18a0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_iftrue := VAR_gth2_uxn_opcodes_h_l2915_c40_b990_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2917_c1_fb3f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_return_output;

     -- lth[uxn_opcodes_h_l2916_c40_b59f] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2916_c40_b59f_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2916_c40_b59f_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2916_c40_b59f_phase <= VAR_lth_uxn_opcodes_h_l2916_c40_b59f_phase;
     lth_uxn_opcodes_h_l2916_c40_b59f_ins <= VAR_lth_uxn_opcodes_h_l2916_c40_b59f_ins;
     lth_uxn_opcodes_h_l2916_c40_b59f_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2916_c40_b59f_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2916_c40_b59f_return_output := lth_uxn_opcodes_h_l2916_c40_b59f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c7_906b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c7_906b_return_output;
     VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2917_c1_fb3f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_iftrue := VAR_lth_uxn_opcodes_h_l2916_c40_b59f_return_output;
     -- lth2[uxn_opcodes_h_l2917_c40_85ca] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2917_c40_85ca_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2917_c40_85ca_phase <= VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_phase;
     lth2_uxn_opcodes_h_l2917_c40_85ca_ins <= VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_ins;
     lth2_uxn_opcodes_h_l2917_c40_85ca_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_return_output := lth2_uxn_opcodes_h_l2917_c40_85ca_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c7_abb8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2918_c1_ee44] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output;
     VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2918_c1_ee44_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_iftrue := VAR_lth2_uxn_opcodes_h_l2917_c40_85ca_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c7_4e73] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output;

     -- jmp[uxn_opcodes_h_l2918_c40_a3b4] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2918_c40_a3b4_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2918_c40_a3b4_phase <= VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_phase;
     jmp_uxn_opcodes_h_l2918_c40_a3b4_ins <= VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_ins;
     jmp_uxn_opcodes_h_l2918_c40_a3b4_pc <= VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_pc;
     jmp_uxn_opcodes_h_l2918_c40_a3b4_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_return_output := jmp_uxn_opcodes_h_l2918_c40_a3b4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2919_c1_e34b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output;
     VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2919_c1_e34b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_iftrue := VAR_jmp_uxn_opcodes_h_l2918_c40_a3b4_return_output;
     -- jmp2[uxn_opcodes_h_l2919_c40_efa4] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2919_c40_efa4_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2919_c40_efa4_phase <= VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_phase;
     jmp2_uxn_opcodes_h_l2919_c40_efa4_ins <= VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_ins;
     jmp2_uxn_opcodes_h_l2919_c40_efa4_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_return_output := jmp2_uxn_opcodes_h_l2919_c40_efa4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c7_6fbe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2920_c1_d044] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output;
     VAR_jcn_uxn_opcodes_h_l2920_c40_970c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2920_c1_d044_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_iftrue := VAR_jmp2_uxn_opcodes_h_l2919_c40_efa4_return_output;
     -- jcn[uxn_opcodes_h_l2920_c40_970c] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2920_c40_970c_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2920_c40_970c_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2920_c40_970c_phase <= VAR_jcn_uxn_opcodes_h_l2920_c40_970c_phase;
     jcn_uxn_opcodes_h_l2920_c40_970c_ins <= VAR_jcn_uxn_opcodes_h_l2920_c40_970c_ins;
     jcn_uxn_opcodes_h_l2920_c40_970c_pc <= VAR_jcn_uxn_opcodes_h_l2920_c40_970c_pc;
     jcn_uxn_opcodes_h_l2920_c40_970c_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2920_c40_970c_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2920_c40_970c_return_output := jcn_uxn_opcodes_h_l2920_c40_970c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2921_c1_48dc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c7_e17c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output;
     VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2921_c1_48dc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_iftrue := VAR_jcn_uxn_opcodes_h_l2920_c40_970c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2922_c1_8709] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c7_292a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_return_output;

     -- jcn2[uxn_opcodes_h_l2921_c40_9218] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2921_c40_9218_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2921_c40_9218_phase <= VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_phase;
     jcn2_uxn_opcodes_h_l2921_c40_9218_ins <= VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_ins;
     jcn2_uxn_opcodes_h_l2921_c40_9218_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_return_output := jcn2_uxn_opcodes_h_l2921_c40_9218_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c7_292a_return_output;
     VAR_jsr_uxn_opcodes_h_l2922_c40_92be_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2922_c1_8709_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_iftrue := VAR_jcn2_uxn_opcodes_h_l2921_c40_9218_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c7_4bdf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output;

     -- jsr[uxn_opcodes_h_l2922_c40_92be] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2922_c40_92be_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2922_c40_92be_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2922_c40_92be_phase <= VAR_jsr_uxn_opcodes_h_l2922_c40_92be_phase;
     jsr_uxn_opcodes_h_l2922_c40_92be_ins <= VAR_jsr_uxn_opcodes_h_l2922_c40_92be_ins;
     jsr_uxn_opcodes_h_l2922_c40_92be_pc <= VAR_jsr_uxn_opcodes_h_l2922_c40_92be_pc;
     jsr_uxn_opcodes_h_l2922_c40_92be_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2922_c40_92be_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2922_c40_92be_return_output := jsr_uxn_opcodes_h_l2922_c40_92be_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2923_c1_9460] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output;
     VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2923_c1_9460_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_iftrue := VAR_jsr_uxn_opcodes_h_l2922_c40_92be_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c7_3477] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_return_output;

     -- jsr2[uxn_opcodes_h_l2923_c40_ceaf] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2923_c40_ceaf_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2923_c40_ceaf_phase <= VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_phase;
     jsr2_uxn_opcodes_h_l2923_c40_ceaf_ins <= VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_ins;
     jsr2_uxn_opcodes_h_l2923_c40_ceaf_pc <= VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_pc;
     jsr2_uxn_opcodes_h_l2923_c40_ceaf_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_return_output := jsr2_uxn_opcodes_h_l2923_c40_ceaf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2924_c1_48b7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c7_3477_return_output;
     VAR_sth_uxn_opcodes_h_l2924_c40_8a87_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2924_c1_48b7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_iftrue := VAR_jsr2_uxn_opcodes_h_l2923_c40_ceaf_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2925_c1_26cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_return_output;

     -- sth[uxn_opcodes_h_l2924_c40_8a87] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2924_c40_8a87_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2924_c40_8a87_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2924_c40_8a87_phase <= VAR_sth_uxn_opcodes_h_l2924_c40_8a87_phase;
     sth_uxn_opcodes_h_l2924_c40_8a87_ins <= VAR_sth_uxn_opcodes_h_l2924_c40_8a87_ins;
     sth_uxn_opcodes_h_l2924_c40_8a87_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2924_c40_8a87_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2924_c40_8a87_return_output := sth_uxn_opcodes_h_l2924_c40_8a87_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c7_93c6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output;
     VAR_sth2_uxn_opcodes_h_l2925_c40_b059_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2925_c1_26cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_iftrue := VAR_sth_uxn_opcodes_h_l2924_c40_8a87_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c7_c6a8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output;

     -- sth2[uxn_opcodes_h_l2925_c40_b059] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2925_c40_b059_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2925_c40_b059_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2925_c40_b059_phase <= VAR_sth2_uxn_opcodes_h_l2925_c40_b059_phase;
     sth2_uxn_opcodes_h_l2925_c40_b059_ins <= VAR_sth2_uxn_opcodes_h_l2925_c40_b059_ins;
     sth2_uxn_opcodes_h_l2925_c40_b059_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2925_c40_b059_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2925_c40_b059_return_output := sth2_uxn_opcodes_h_l2925_c40_b059_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2926_c1_0223] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output;
     VAR_ldz_uxn_opcodes_h_l2926_c40_b163_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2926_c1_0223_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_iftrue := VAR_sth2_uxn_opcodes_h_l2925_c40_b059_return_output;
     -- ldz[uxn_opcodes_h_l2926_c40_b163] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2926_c40_b163_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2926_c40_b163_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2926_c40_b163_phase <= VAR_ldz_uxn_opcodes_h_l2926_c40_b163_phase;
     ldz_uxn_opcodes_h_l2926_c40_b163_ins <= VAR_ldz_uxn_opcodes_h_l2926_c40_b163_ins;
     ldz_uxn_opcodes_h_l2926_c40_b163_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2926_c40_b163_previous_stack_read;
     ldz_uxn_opcodes_h_l2926_c40_b163_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2926_c40_b163_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2926_c40_b163_return_output := ldz_uxn_opcodes_h_l2926_c40_b163_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c7_75a9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2927_c1_362f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output;
     VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2927_c1_362f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_iftrue := VAR_ldz_uxn_opcodes_h_l2926_c40_b163_return_output;
     -- ldz2[uxn_opcodes_h_l2927_c40_d69a] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2927_c40_d69a_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2927_c40_d69a_phase <= VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_phase;
     ldz2_uxn_opcodes_h_l2927_c40_d69a_ins <= VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_ins;
     ldz2_uxn_opcodes_h_l2927_c40_d69a_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_previous_stack_read;
     ldz2_uxn_opcodes_h_l2927_c40_d69a_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_return_output := ldz2_uxn_opcodes_h_l2927_c40_d69a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c7_f392] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2928_c1_e157] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c7_f392_return_output;
     VAR_stz_uxn_opcodes_h_l2928_c40_575e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2928_c1_e157_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_iftrue := VAR_ldz2_uxn_opcodes_h_l2927_c40_d69a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2929_c1_cd58] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_return_output;

     -- stz[uxn_opcodes_h_l2928_c40_575e] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2928_c40_575e_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2928_c40_575e_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2928_c40_575e_phase <= VAR_stz_uxn_opcodes_h_l2928_c40_575e_phase;
     stz_uxn_opcodes_h_l2928_c40_575e_ins <= VAR_stz_uxn_opcodes_h_l2928_c40_575e_ins;
     stz_uxn_opcodes_h_l2928_c40_575e_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2928_c40_575e_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2928_c40_575e_return_output := stz_uxn_opcodes_h_l2928_c40_575e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c7_43dc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output;
     VAR_stz2_uxn_opcodes_h_l2929_c40_650d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2929_c1_cd58_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_iftrue := VAR_stz_uxn_opcodes_h_l2928_c40_575e_return_output;
     -- stz2[uxn_opcodes_h_l2929_c40_650d] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2929_c40_650d_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2929_c40_650d_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2929_c40_650d_phase <= VAR_stz2_uxn_opcodes_h_l2929_c40_650d_phase;
     stz2_uxn_opcodes_h_l2929_c40_650d_ins <= VAR_stz2_uxn_opcodes_h_l2929_c40_650d_ins;
     stz2_uxn_opcodes_h_l2929_c40_650d_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2929_c40_650d_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2929_c40_650d_return_output := stz2_uxn_opcodes_h_l2929_c40_650d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c7_bb81] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2930_c1_19ed] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output;
     VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2930_c1_19ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_iftrue := VAR_stz2_uxn_opcodes_h_l2929_c40_650d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c7_68af] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_return_output;

     -- ldr[uxn_opcodes_h_l2930_c40_65e3] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2930_c40_65e3_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2930_c40_65e3_phase <= VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_phase;
     ldr_uxn_opcodes_h_l2930_c40_65e3_ins <= VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_ins;
     ldr_uxn_opcodes_h_l2930_c40_65e3_pc <= VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_pc;
     ldr_uxn_opcodes_h_l2930_c40_65e3_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_previous_stack_read;
     ldr_uxn_opcodes_h_l2930_c40_65e3_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_return_output := ldr_uxn_opcodes_h_l2930_c40_65e3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2931_c1_c185] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c7_68af_return_output;
     VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2931_c1_c185_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_iftrue := VAR_ldr_uxn_opcodes_h_l2930_c40_65e3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c7_1577] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2932_c1_d2fe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_return_output;

     -- ldr2[uxn_opcodes_h_l2931_c40_936e] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2931_c40_936e_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2931_c40_936e_phase <= VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_phase;
     ldr2_uxn_opcodes_h_l2931_c40_936e_ins <= VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_ins;
     ldr2_uxn_opcodes_h_l2931_c40_936e_pc <= VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_pc;
     ldr2_uxn_opcodes_h_l2931_c40_936e_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_previous_stack_read;
     ldr2_uxn_opcodes_h_l2931_c40_936e_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_return_output := ldr2_uxn_opcodes_h_l2931_c40_936e_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c7_1577_return_output;
     VAR_str1_uxn_opcodes_h_l2932_c40_3137_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2932_c1_d2fe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_iftrue := VAR_ldr2_uxn_opcodes_h_l2931_c40_936e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2933_c1_1a9e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_return_output;

     -- str1[uxn_opcodes_h_l2932_c40_3137] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2932_c40_3137_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2932_c40_3137_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2932_c40_3137_phase <= VAR_str1_uxn_opcodes_h_l2932_c40_3137_phase;
     str1_uxn_opcodes_h_l2932_c40_3137_ins <= VAR_str1_uxn_opcodes_h_l2932_c40_3137_ins;
     str1_uxn_opcodes_h_l2932_c40_3137_pc <= VAR_str1_uxn_opcodes_h_l2932_c40_3137_pc;
     str1_uxn_opcodes_h_l2932_c40_3137_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2932_c40_3137_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2932_c40_3137_return_output := str1_uxn_opcodes_h_l2932_c40_3137_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c7_098f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c7_098f_return_output;
     VAR_str2_uxn_opcodes_h_l2933_c40_587f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2933_c1_1a9e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_iftrue := VAR_str1_uxn_opcodes_h_l2932_c40_3137_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2934_c1_2ebe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_return_output;

     -- str2[uxn_opcodes_h_l2933_c40_587f] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2933_c40_587f_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2933_c40_587f_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2933_c40_587f_phase <= VAR_str2_uxn_opcodes_h_l2933_c40_587f_phase;
     str2_uxn_opcodes_h_l2933_c40_587f_ins <= VAR_str2_uxn_opcodes_h_l2933_c40_587f_ins;
     str2_uxn_opcodes_h_l2933_c40_587f_pc <= VAR_str2_uxn_opcodes_h_l2933_c40_587f_pc;
     str2_uxn_opcodes_h_l2933_c40_587f_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2933_c40_587f_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2933_c40_587f_return_output := str2_uxn_opcodes_h_l2933_c40_587f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c7_0065] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c7_0065_return_output;
     VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2934_c1_2ebe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_iftrue := VAR_str2_uxn_opcodes_h_l2933_c40_587f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2935_c1_3f21] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c7_fdc3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output;

     -- lda[uxn_opcodes_h_l2934_c40_d8ae] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2934_c40_d8ae_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2934_c40_d8ae_phase <= VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_phase;
     lda_uxn_opcodes_h_l2934_c40_d8ae_ins <= VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_ins;
     lda_uxn_opcodes_h_l2934_c40_d8ae_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_previous_stack_read;
     lda_uxn_opcodes_h_l2934_c40_d8ae_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_return_output := lda_uxn_opcodes_h_l2934_c40_d8ae_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output;
     VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2935_c1_3f21_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_iftrue := VAR_lda_uxn_opcodes_h_l2934_c40_d8ae_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2936_c1_bf90] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c7_42c3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output;

     -- lda2[uxn_opcodes_h_l2935_c40_c21e] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2935_c40_c21e_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2935_c40_c21e_phase <= VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_phase;
     lda2_uxn_opcodes_h_l2935_c40_c21e_ins <= VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_ins;
     lda2_uxn_opcodes_h_l2935_c40_c21e_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_previous_stack_read;
     lda2_uxn_opcodes_h_l2935_c40_c21e_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_return_output := lda2_uxn_opcodes_h_l2935_c40_c21e_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output;
     VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2936_c1_bf90_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_iftrue := VAR_lda2_uxn_opcodes_h_l2935_c40_c21e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c7_e369] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2937_c1_539c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_return_output;

     -- sta[uxn_opcodes_h_l2936_c40_6e8d] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2936_c40_6e8d_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2936_c40_6e8d_phase <= VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_phase;
     sta_uxn_opcodes_h_l2936_c40_6e8d_ins <= VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_ins;
     sta_uxn_opcodes_h_l2936_c40_6e8d_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_return_output := sta_uxn_opcodes_h_l2936_c40_6e8d_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c7_e369_return_output;
     VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2937_c1_539c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_iftrue := VAR_sta_uxn_opcodes_h_l2936_c40_6e8d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2938_c1_f37b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c7_e2c3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output;

     -- sta2[uxn_opcodes_h_l2937_c40_a4fa] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2937_c40_a4fa_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2937_c40_a4fa_phase <= VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_phase;
     sta2_uxn_opcodes_h_l2937_c40_a4fa_ins <= VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_ins;
     sta2_uxn_opcodes_h_l2937_c40_a4fa_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_return_output := sta2_uxn_opcodes_h_l2937_c40_a4fa_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output;
     VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2938_c1_f37b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_iftrue := VAR_sta2_uxn_opcodes_h_l2937_c40_a4fa_return_output;
     -- dei[uxn_opcodes_h_l2938_c40_ad7d] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2938_c40_ad7d_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2938_c40_ad7d_phase <= VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_phase;
     dei_uxn_opcodes_h_l2938_c40_ad7d_ins <= VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_ins;
     dei_uxn_opcodes_h_l2938_c40_ad7d_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_previous_stack_read;
     dei_uxn_opcodes_h_l2938_c40_ad7d_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_return_output := dei_uxn_opcodes_h_l2938_c40_ad7d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2939_c1_240d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c7_15f9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output;
     VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2939_c1_240d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_iftrue := VAR_dei_uxn_opcodes_h_l2938_c40_ad7d_return_output;
     -- dei2[uxn_opcodes_h_l2939_c40_d10b] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2939_c40_d10b_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2939_c40_d10b_phase <= VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_phase;
     dei2_uxn_opcodes_h_l2939_c40_d10b_ins <= VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_ins;
     dei2_uxn_opcodes_h_l2939_c40_d10b_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_previous_stack_read;
     dei2_uxn_opcodes_h_l2939_c40_d10b_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_return_output := dei2_uxn_opcodes_h_l2939_c40_d10b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c7_03a2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2940_c1_0fb8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output;
     VAR_deo_uxn_opcodes_h_l2940_c40_f622_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2940_c1_0fb8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_iftrue := VAR_dei2_uxn_opcodes_h_l2939_c40_d10b_return_output;
     -- deo[uxn_opcodes_h_l2940_c40_f622] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2940_c40_f622_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2940_c40_f622_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2940_c40_f622_phase <= VAR_deo_uxn_opcodes_h_l2940_c40_f622_phase;
     deo_uxn_opcodes_h_l2940_c40_f622_ins <= VAR_deo_uxn_opcodes_h_l2940_c40_f622_ins;
     deo_uxn_opcodes_h_l2940_c40_f622_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2940_c40_f622_previous_stack_read;
     deo_uxn_opcodes_h_l2940_c40_f622_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2940_c40_f622_previous_device_ram_read;
     deo_uxn_opcodes_h_l2940_c40_f622_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2940_c40_f622_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2940_c40_f622_return_output := deo_uxn_opcodes_h_l2940_c40_f622_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2941_c1_d27d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c7_81ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output;
     VAR_deo2_uxn_opcodes_h_l2941_c40_4576_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2941_c1_d27d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_iftrue := VAR_deo_uxn_opcodes_h_l2940_c40_f622_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2942_c1_b571] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c7_76ee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output;

     -- deo2[uxn_opcodes_h_l2941_c40_4576] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2941_c40_4576_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2941_c40_4576_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2941_c40_4576_phase <= VAR_deo2_uxn_opcodes_h_l2941_c40_4576_phase;
     deo2_uxn_opcodes_h_l2941_c40_4576_ins <= VAR_deo2_uxn_opcodes_h_l2941_c40_4576_ins;
     deo2_uxn_opcodes_h_l2941_c40_4576_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2941_c40_4576_previous_stack_read;
     deo2_uxn_opcodes_h_l2941_c40_4576_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2941_c40_4576_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2941_c40_4576_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2941_c40_4576_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2941_c40_4576_return_output := deo2_uxn_opcodes_h_l2941_c40_4576_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output;
     VAR_add_uxn_opcodes_h_l2942_c40_a15e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2942_c1_b571_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_iftrue := VAR_deo2_uxn_opcodes_h_l2941_c40_4576_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c7_64af] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_return_output;

     -- add[uxn_opcodes_h_l2942_c40_a15e] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2942_c40_a15e_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2942_c40_a15e_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2942_c40_a15e_phase <= VAR_add_uxn_opcodes_h_l2942_c40_a15e_phase;
     add_uxn_opcodes_h_l2942_c40_a15e_ins <= VAR_add_uxn_opcodes_h_l2942_c40_a15e_ins;
     add_uxn_opcodes_h_l2942_c40_a15e_previous_stack_read <= VAR_add_uxn_opcodes_h_l2942_c40_a15e_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2942_c40_a15e_return_output := add_uxn_opcodes_h_l2942_c40_a15e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2943_c1_20c2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c7_64af_return_output;
     VAR_add2_uxn_opcodes_h_l2943_c40_3f93_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2943_c1_20c2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_iftrue := VAR_add_uxn_opcodes_h_l2942_c40_a15e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c7_f73f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output;

     -- add2[uxn_opcodes_h_l2943_c40_3f93] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2943_c40_3f93_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2943_c40_3f93_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2943_c40_3f93_phase <= VAR_add2_uxn_opcodes_h_l2943_c40_3f93_phase;
     add2_uxn_opcodes_h_l2943_c40_3f93_ins <= VAR_add2_uxn_opcodes_h_l2943_c40_3f93_ins;
     add2_uxn_opcodes_h_l2943_c40_3f93_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2943_c40_3f93_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2943_c40_3f93_return_output := add2_uxn_opcodes_h_l2943_c40_3f93_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2944_c1_e5f8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output;
     VAR_sub_uxn_opcodes_h_l2944_c40_06f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2944_c1_e5f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_iftrue := VAR_add2_uxn_opcodes_h_l2943_c40_3f93_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c7_26bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2945_c1_1a70] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_return_output;

     -- sub[uxn_opcodes_h_l2944_c40_06f0] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2944_c40_06f0_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2944_c40_06f0_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2944_c40_06f0_phase <= VAR_sub_uxn_opcodes_h_l2944_c40_06f0_phase;
     sub_uxn_opcodes_h_l2944_c40_06f0_ins <= VAR_sub_uxn_opcodes_h_l2944_c40_06f0_ins;
     sub_uxn_opcodes_h_l2944_c40_06f0_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2944_c40_06f0_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2944_c40_06f0_return_output := sub_uxn_opcodes_h_l2944_c40_06f0_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output;
     VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2945_c1_1a70_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_iftrue := VAR_sub_uxn_opcodes_h_l2944_c40_06f0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2946_c1_0308] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c7_eb75] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output;

     -- sub2[uxn_opcodes_h_l2945_c40_e61d] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2945_c40_e61d_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2945_c40_e61d_phase <= VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_phase;
     sub2_uxn_opcodes_h_l2945_c40_e61d_ins <= VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_ins;
     sub2_uxn_opcodes_h_l2945_c40_e61d_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_return_output := sub2_uxn_opcodes_h_l2945_c40_e61d_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output;
     VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2946_c1_0308_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_iftrue := VAR_sub2_uxn_opcodes_h_l2945_c40_e61d_return_output;
     -- mul[uxn_opcodes_h_l2946_c40_d2e1] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2946_c40_d2e1_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2946_c40_d2e1_phase <= VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_phase;
     mul_uxn_opcodes_h_l2946_c40_d2e1_ins <= VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_ins;
     mul_uxn_opcodes_h_l2946_c40_d2e1_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_return_output := mul_uxn_opcodes_h_l2946_c40_d2e1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2947_c1_d2c5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c7_1435] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c7_1435_return_output;
     VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2947_c1_d2c5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_iftrue := VAR_mul_uxn_opcodes_h_l2946_c40_d2e1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2948_c1_b85d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_return_output;

     -- mul2[uxn_opcodes_h_l2947_c40_01f6] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2947_c40_01f6_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2947_c40_01f6_phase <= VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_phase;
     mul2_uxn_opcodes_h_l2947_c40_01f6_ins <= VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_ins;
     mul2_uxn_opcodes_h_l2947_c40_01f6_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_return_output := mul2_uxn_opcodes_h_l2947_c40_01f6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c7_a6be] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output;
     VAR_div_uxn_opcodes_h_l2948_c40_4cc1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2948_c1_b85d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_iftrue := VAR_mul2_uxn_opcodes_h_l2947_c40_01f6_return_output;
     -- div[uxn_opcodes_h_l2948_c40_4cc1] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2948_c40_4cc1_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2948_c40_4cc1_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2948_c40_4cc1_phase <= VAR_div_uxn_opcodes_h_l2948_c40_4cc1_phase;
     div_uxn_opcodes_h_l2948_c40_4cc1_ins <= VAR_div_uxn_opcodes_h_l2948_c40_4cc1_ins;
     div_uxn_opcodes_h_l2948_c40_4cc1_previous_stack_read <= VAR_div_uxn_opcodes_h_l2948_c40_4cc1_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2948_c40_4cc1_return_output := div_uxn_opcodes_h_l2948_c40_4cc1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c7_c600] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2949_c1_6956] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c7_c600_return_output;
     VAR_div2_uxn_opcodes_h_l2949_c40_64e2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2949_c1_6956_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_iftrue := VAR_div_uxn_opcodes_h_l2948_c40_4cc1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2950_c1_ec18] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_return_output;

     -- div2[uxn_opcodes_h_l2949_c40_64e2] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2949_c40_64e2_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2949_c40_64e2_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2949_c40_64e2_phase <= VAR_div2_uxn_opcodes_h_l2949_c40_64e2_phase;
     div2_uxn_opcodes_h_l2949_c40_64e2_ins <= VAR_div2_uxn_opcodes_h_l2949_c40_64e2_ins;
     div2_uxn_opcodes_h_l2949_c40_64e2_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2949_c40_64e2_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2949_c40_64e2_return_output := div2_uxn_opcodes_h_l2949_c40_64e2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c7_bc37] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output;
     VAR_and_uxn_opcodes_h_l2950_c40_c59f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2950_c1_ec18_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_iftrue := VAR_div2_uxn_opcodes_h_l2949_c40_64e2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c7_f515] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_return_output;

     -- and[uxn_opcodes_h_l2950_c40_c59f] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2950_c40_c59f_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2950_c40_c59f_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2950_c40_c59f_phase <= VAR_and_uxn_opcodes_h_l2950_c40_c59f_phase;
     and_uxn_opcodes_h_l2950_c40_c59f_ins <= VAR_and_uxn_opcodes_h_l2950_c40_c59f_ins;
     and_uxn_opcodes_h_l2950_c40_c59f_previous_stack_read <= VAR_and_uxn_opcodes_h_l2950_c40_c59f_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2950_c40_c59f_return_output := and_uxn_opcodes_h_l2950_c40_c59f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2951_c1_de3f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c7_f515_return_output;
     VAR_and2_uxn_opcodes_h_l2951_c40_ae80_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2951_c1_de3f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_iftrue := VAR_and_uxn_opcodes_h_l2950_c40_c59f_return_output;
     -- and2[uxn_opcodes_h_l2951_c40_ae80] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2951_c40_ae80_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2951_c40_ae80_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2951_c40_ae80_phase <= VAR_and2_uxn_opcodes_h_l2951_c40_ae80_phase;
     and2_uxn_opcodes_h_l2951_c40_ae80_ins <= VAR_and2_uxn_opcodes_h_l2951_c40_ae80_ins;
     and2_uxn_opcodes_h_l2951_c40_ae80_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2951_c40_ae80_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2951_c40_ae80_return_output := and2_uxn_opcodes_h_l2951_c40_ae80_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2952_c1_4121] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c7_70e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output;
     VAR_ora_uxn_opcodes_h_l2952_c40_b07d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2952_c1_4121_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_iftrue := VAR_and2_uxn_opcodes_h_l2951_c40_ae80_return_output;
     -- ora[uxn_opcodes_h_l2952_c40_b07d] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2952_c40_b07d_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2952_c40_b07d_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2952_c40_b07d_phase <= VAR_ora_uxn_opcodes_h_l2952_c40_b07d_phase;
     ora_uxn_opcodes_h_l2952_c40_b07d_ins <= VAR_ora_uxn_opcodes_h_l2952_c40_b07d_ins;
     ora_uxn_opcodes_h_l2952_c40_b07d_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2952_c40_b07d_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2952_c40_b07d_return_output := ora_uxn_opcodes_h_l2952_c40_b07d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c7_e9d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2953_c1_39be] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output;
     VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2953_c1_39be_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_iftrue := VAR_ora_uxn_opcodes_h_l2952_c40_b07d_return_output;
     -- ora2[uxn_opcodes_h_l2953_c40_d3c9] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2953_c40_d3c9_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2953_c40_d3c9_phase <= VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_phase;
     ora2_uxn_opcodes_h_l2953_c40_d3c9_ins <= VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_ins;
     ora2_uxn_opcodes_h_l2953_c40_d3c9_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_return_output := ora2_uxn_opcodes_h_l2953_c40_d3c9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2954_c1_d219] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c7_c851] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c7_c851_return_output;
     VAR_eor_uxn_opcodes_h_l2954_c40_9707_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2954_c1_d219_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_iftrue := VAR_ora2_uxn_opcodes_h_l2953_c40_d3c9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2955_c1_2499] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_return_output;

     -- eor[uxn_opcodes_h_l2954_c40_9707] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2954_c40_9707_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2954_c40_9707_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2954_c40_9707_phase <= VAR_eor_uxn_opcodes_h_l2954_c40_9707_phase;
     eor_uxn_opcodes_h_l2954_c40_9707_ins <= VAR_eor_uxn_opcodes_h_l2954_c40_9707_ins;
     eor_uxn_opcodes_h_l2954_c40_9707_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2954_c40_9707_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2954_c40_9707_return_output := eor_uxn_opcodes_h_l2954_c40_9707_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c7_3f73] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output;
     VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2955_c1_2499_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_iftrue := VAR_eor_uxn_opcodes_h_l2954_c40_9707_return_output;
     -- eor2[uxn_opcodes_h_l2955_c40_eb72] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2955_c40_eb72_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2955_c40_eb72_phase <= VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_phase;
     eor2_uxn_opcodes_h_l2955_c40_eb72_ins <= VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_ins;
     eor2_uxn_opcodes_h_l2955_c40_eb72_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_return_output := eor2_uxn_opcodes_h_l2955_c40_eb72_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2956_c1_1f88] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c7_50f2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c7_50f2_return_output;
     VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2956_c1_1f88_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_iftrue := VAR_eor2_uxn_opcodes_h_l2955_c40_eb72_return_output;
     -- sft[uxn_opcodes_h_l2956_c40_e6a7] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2956_c40_e6a7_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2956_c40_e6a7_phase <= VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_phase;
     sft_uxn_opcodes_h_l2956_c40_e6a7_ins <= VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_ins;
     sft_uxn_opcodes_h_l2956_c40_e6a7_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_return_output := sft_uxn_opcodes_h_l2956_c40_e6a7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2957_c1_6926] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2957_c1_6926_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_iftrue := VAR_sft_uxn_opcodes_h_l2956_c40_e6a7_return_output;
     -- sft2[uxn_opcodes_h_l2957_c40_7e12] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2957_c40_7e12_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2957_c40_7e12_phase <= VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_phase;
     sft2_uxn_opcodes_h_l2957_c40_7e12_ins <= VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_ins;
     sft2_uxn_opcodes_h_l2957_c40_7e12_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_return_output := sft2_uxn_opcodes_h_l2957_c40_7e12_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_iftrue := VAR_sft2_uxn_opcodes_h_l2957_c40_7e12_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2957_c7_50f2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_cond;
     opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_return_output := opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2957_c7_50f2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2956_c7_3f73] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_cond;
     opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output := opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2956_c7_3f73_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2955_c7_c851] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_cond;
     opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_return_output := opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2955_c7_c851_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2954_c7_e9d5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_cond;
     opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output := opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2954_c7_e9d5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2953_c7_70e6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_cond;
     opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output := opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2953_c7_70e6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2952_c7_f515] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_cond;
     opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_return_output := opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2952_c7_f515_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2951_c7_bc37] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_cond;
     opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output := opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2951_c7_bc37_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2950_c7_c600] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_cond;
     opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_return_output := opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2950_c7_c600_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2949_c7_a6be] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_cond;
     opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output := opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2949_c7_a6be_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2948_c7_1435] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_cond;
     opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_return_output := opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2948_c7_1435_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2947_c7_eb75] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_cond;
     opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output := opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2947_c7_eb75_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2946_c7_26bf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_cond;
     opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output := opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2946_c7_26bf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2945_c7_f73f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_cond;
     opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output := opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2945_c7_f73f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2944_c7_64af] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_cond;
     opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_return_output := opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2944_c7_64af_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2943_c7_76ee] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_cond;
     opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output := opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2943_c7_76ee_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2942_c7_81ec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_cond;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output := opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2942_c7_81ec_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2941_c7_03a2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_cond;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output := opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2941_c7_03a2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2940_c7_15f9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_cond;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output := opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2940_c7_15f9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2939_c7_e2c3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_cond;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output := opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2939_c7_e2c3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2938_c7_e369] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_cond;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_return_output := opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2938_c7_e369_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2937_c7_42c3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_cond;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output := opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2937_c7_42c3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2936_c7_fdc3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_cond;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output := opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2936_c7_fdc3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2935_c7_0065] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_cond;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_return_output := opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2935_c7_0065_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2934_c7_098f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_cond;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_return_output := opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2934_c7_098f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2933_c7_1577] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_cond;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_return_output := opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2933_c7_1577_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2932_c7_68af] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_cond;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_return_output := opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2932_c7_68af_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2931_c7_bb81] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_cond;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output := opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2931_c7_bb81_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2930_c7_43dc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_cond;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output := opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2930_c7_43dc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2929_c7_f392] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_cond;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_return_output := opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2929_c7_f392_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2928_c7_75a9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_cond;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output := opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2928_c7_75a9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2927_c7_c6a8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_cond;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output := opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2927_c7_c6a8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2926_c7_93c6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_cond;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output := opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2926_c7_93c6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2925_c7_3477] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_cond;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_return_output := opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2925_c7_3477_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2924_c7_4bdf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_cond;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output := opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2924_c7_4bdf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2923_c7_292a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_cond;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_return_output := opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2923_c7_292a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2922_c7_e17c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_cond;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output := opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2922_c7_e17c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2921_c7_6fbe] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_cond;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output := opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2921_c7_6fbe_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2920_c7_4e73] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_cond;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output := opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2920_c7_4e73_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2919_c7_abb8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_cond;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output := opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2919_c7_abb8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2918_c7_906b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_cond;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_return_output := opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2918_c7_906b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2917_c7_b7d6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_cond;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output := opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2917_c7_b7d6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2916_c7_d5c2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_cond;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output := opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2916_c7_d5c2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2915_c7_0136] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_cond;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_return_output := opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2915_c7_0136_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2914_c7_4e31] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_cond;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output := opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2914_c7_4e31_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2913_c7_f77c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_cond;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output := opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2913_c7_f77c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2912_c7_dfdc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_cond;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output := opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2912_c7_dfdc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2911_c7_10ff] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_cond;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output := opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2911_c7_10ff_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2910_c7_7a35] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_cond;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output := opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2910_c7_7a35_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2909_c7_53ac] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_cond;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output := opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2909_c7_53ac_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2908_c7_f1b4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_cond;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output := opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2908_c7_f1b4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2907_c7_8a17] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_cond;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output := opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2907_c7_8a17_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2906_c7_0ba6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_cond;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output := opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2906_c7_0ba6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2905_c7_9b6d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_cond;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output := opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2905_c7_9b6d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2904_c7_4114] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_cond;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_return_output := opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2904_c7_4114_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2903_c7_fc01] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_cond;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output := opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2903_c7_fc01_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2902_c7_3192] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_cond;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_return_output := opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2902_c7_3192_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2901_c7_e4fc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_cond;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output := opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2901_c7_e4fc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2900_c7_8573] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_cond;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_return_output := opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2900_c7_8573_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2899_c7_fcfc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_cond;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output := opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2899_c7_fcfc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2898_c7_8d31] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_cond;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output := opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2898_c7_8d31_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2897_c7_37ef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_cond;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output := opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2897_c7_37ef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2896_c7_b5a2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_cond;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output := opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2896_c7_b5a2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2895_c7_7087] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_cond;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_return_output := opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2895_c7_7087_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2894_c7_f749] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_cond;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_return_output := opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2894_c7_f749_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2893_c7_f20d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_cond;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output := opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2893_c7_f20d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2892_c7_60a7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_cond;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output := opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2892_c7_60a7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2891_c7_6eb5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_cond;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output := opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2891_c7_6eb5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2890_c7_2b44] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_cond;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output := opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2890_c7_2b44_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2889_c7_04b4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_cond;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output := opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2889_c7_04b4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c2_55dc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2984_c37_a061] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2984_c37_a061_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2978_c39_4f7b] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2978_c39_4f7b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output.device_ram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2985_l2973_DUPLICATE_8e5c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2985_l2973_DUPLICATE_8e5c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2981_c30_5c0a] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2981_c30_5c0a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2960_c17_1690] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2960_c17_1690_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2980_c34_592e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2980_c34_592e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2986_c32_dd52] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2986_c32_dd52_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2968_c68_0d66] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2968_c68_0d66_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2982_c33_f5f4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2982_c33_f5f4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2963_l2965_DUPLICATE_a7a5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2963_l2965_DUPLICATE_a7a5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2974_c3_36af] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2974_c3_36af_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2979_c40_201d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2979_c40_201d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2983_c34_e4b4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2983_c34_e4b4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output.is_vram_write;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2960_c17_1690_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2974_c3_36af_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2985_l2973_DUPLICATE_8e5c_return_output;
     -- BIN_OP_XOR[uxn_opcodes_h_l2960_c2_6cd8] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_left;
     BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_return_output := BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_return_output;

     -- CAST_TO_uint9_t[uxn_opcodes_h_l2968_c58_79b5] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2968_c58_79b5_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2968_c68_0d66_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2963_l2965_DUPLICATE_be96 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2963_l2965_DUPLICATE_be96_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2963_l2965_DUPLICATE_a7a5_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2988_l2865_DUPLICATE_99e6 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2988_l2865_DUPLICATE_99e6_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2888_c2_55dc_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2978_c39_4f7b_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2979_c40_201d_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2980_c34_592e_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2981_c30_5c0a_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2982_c33_f5f4_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2983_c34_e4b4_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2984_c37_a061_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2985_l2973_DUPLICATE_8e5c_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2986_c32_dd52_return_output);

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2968_c29_22ba_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_return_output;
     VAR_MUX_uxn_opcodes_h_l2969_c20_878e_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_c726_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_c726_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2960_c2_6cd8_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2963_l2965_DUPLICATE_be96_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2963_l2965_DUPLICATE_be96_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2968_c58_79b5_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2988_l2865_DUPLICATE_99e6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2988_l2865_DUPLICATE_99e6_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2963_c3_13d9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2965_c3_e127] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_return_output;

     -- MUX[uxn_opcodes_h_l2969_c20_878e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2969_c20_878e_cond <= VAR_MUX_uxn_opcodes_h_l2969_c20_878e_cond;
     MUX_uxn_opcodes_h_l2969_c20_878e_iftrue <= VAR_MUX_uxn_opcodes_h_l2969_c20_878e_iftrue;
     MUX_uxn_opcodes_h_l2969_c20_878e_iffalse <= VAR_MUX_uxn_opcodes_h_l2969_c20_878e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2969_c20_878e_return_output := MUX_uxn_opcodes_h_l2969_c20_878e_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2963_c3_f63e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2963_c3_13d9_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2965_c3_ba3b := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2965_c3_e127_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_right := VAR_MUX_uxn_opcodes_h_l2969_c20_878e_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_c726_iffalse := VAR_sp0_uxn_opcodes_h_l2965_c3_ba3b;
     VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_c726_iftrue := VAR_sp1_uxn_opcodes_h_l2963_c3_f63e;
     -- sp0_MUX[uxn_opcodes_h_l2962_c2_c726] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2962_c2_c726_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_c726_cond;
     sp0_MUX_uxn_opcodes_h_l2962_c2_c726_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_c726_iftrue;
     sp0_MUX_uxn_opcodes_h_l2962_c2_c726_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_c726_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_c726_return_output := sp0_MUX_uxn_opcodes_h_l2962_c2_c726_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2962_c2_c726] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2962_c2_c726_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_c726_cond;
     sp1_MUX_uxn_opcodes_h_l2962_c2_c726_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_c726_iftrue;
     sp1_MUX_uxn_opcodes_h_l2962_c2_c726_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_c726_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_c726_return_output := sp1_MUX_uxn_opcodes_h_l2962_c2_c726_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2968_c29_22ba_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_c726_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2962_c2_c726_return_output;
     VAR_MUX_uxn_opcodes_h_l2968_c29_22ba_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_c726_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2962_c2_c726_return_output;
     -- MUX[uxn_opcodes_h_l2968_c29_22ba] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2968_c29_22ba_cond <= VAR_MUX_uxn_opcodes_h_l2968_c29_22ba_cond;
     MUX_uxn_opcodes_h_l2968_c29_22ba_iftrue <= VAR_MUX_uxn_opcodes_h_l2968_c29_22ba_iftrue;
     MUX_uxn_opcodes_h_l2968_c29_22ba_iffalse <= VAR_MUX_uxn_opcodes_h_l2968_c29_22ba_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2968_c29_22ba_return_output := MUX_uxn_opcodes_h_l2968_c29_22ba_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2968_c19_90e1] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2968_c19_90e1_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2968_c29_22ba_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2968_c19_90e1_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2968_c19_7d2c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_return_output;

     -- Submodule level 156
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2968_c19_7d2c_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2969_c2_47c4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_return_output;

     -- Submodule level 157
     VAR_stack_address_uxn_opcodes_h_l2969_c2_83b2 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2969_c2_47c4_return_output, 9);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2969_c2_83b2;
     VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_stack_address := VAR_stack_address_uxn_opcodes_h_l2969_c2_83b2;
     -- stack_ram_update[uxn_opcodes_h_l2971_c24_3dbc] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_stack_address;
     stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_value <= VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_value;
     stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_return_output := stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2971_c24_3dbc_return_output;
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
