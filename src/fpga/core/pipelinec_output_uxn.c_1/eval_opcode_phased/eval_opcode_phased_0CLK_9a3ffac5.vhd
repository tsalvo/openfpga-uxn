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
-- Submodules: 388
entity eval_opcode_phased_0CLK_9a3ffac5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_9a3ffac5;
architecture arch of eval_opcode_phased_0CLK_9a3ffac5 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal sp0 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal sp1 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc : unsigned(11 downto 0) := to_unsigned(0, 12);
signal stack_index : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_stack_read : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_stack_write : unsigned(0 downto 0) := to_unsigned(0, 1);
signal stack_address : unsigned(15 downto 0) := to_unsigned(0, 16);
signal stack_write_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal stack_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_ram_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc_result : opcode_result_t := (
is_pc_updated => to_unsigned(0, 1),
pc => to_unsigned(0, 16),
is_stack_index_flipped => to_unsigned(0, 1),
is_sp_shift => to_unsigned(0, 1),
sp_relative_shift => to_signed(0, 8),
is_stack_read => to_unsigned(0, 1),
is_stack_write => to_unsigned(0, 1),
stack_address_sp_offset => to_unsigned(0, 8),
stack_value => to_unsigned(0, 8),
is_ram_read => to_unsigned(0, 1),
is_ram_write => to_unsigned(0, 1),
ram_addr => to_unsigned(0, 16),
ram_value => to_unsigned(0, 8),
is_device_ram_read => to_unsigned(0, 1),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
device_ram_value => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
vram_value => to_unsigned(0, 2),
is_opc_done => to_unsigned(0, 1))
;
signal opc_eval_result : eval_opcode_result_t := (
is_pc_updated => to_unsigned(0, 1),
pc => to_unsigned(0, 16),
is_ram_read => to_unsigned(0, 1),
is_ram_write => to_unsigned(0, 1),
ram_addr => to_unsigned(0, 16),
ram_value => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
vram_value => to_unsigned(0, 2),
is_opc_done => to_unsigned(0, 1))
;
signal REG_COMB_sp0 : unsigned(7 downto 0);
signal REG_COMB_sp1 : unsigned(7 downto 0);
signal REG_COMB_opc : unsigned(11 downto 0);
signal REG_COMB_stack_index : unsigned(0 downto 0);
signal REG_COMB_is_stack_read : unsigned(0 downto 0);
signal REG_COMB_is_stack_write : unsigned(0 downto 0);
signal REG_COMB_stack_address : unsigned(15 downto 0);
signal REG_COMB_stack_write_value : unsigned(7 downto 0);
signal REG_COMB_stack_read_value : unsigned(7 downto 0);
signal REG_COMB_device_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_opc_result : opcode_result_t;
signal REG_COMB_opc_eval_result : eval_opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_opcodes_h_l2814_c10_e5d1]
signal BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2814_c10_c488]
signal BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2814_c41_6b5b]
signal BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l2814_c57_7524]
signal CONST_SL_4_uxn_opcodes_h_l2814_c57_7524_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l2814_c57_7524_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2814_c10_6f1c]
signal MUX_uxn_opcodes_h_l2814_c10_6f1c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2814_c10_6f1c_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2814_c10_6f1c_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2814_c10_6f1c_return_output : unsigned(11 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2815_c18_d63c]
signal BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2815_c18_a58f]
signal BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2815_c18_fa40]
signal MUX_uxn_opcodes_h_l2815_c18_fa40_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2815_c18_fa40_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2815_c18_fa40_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2815_c18_fa40_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2817_c2_0556[uxn_opcodes_h_l2817_c2_0556]
signal printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2819_c6_871d]
signal BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2820_c7_6e17]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2819_c2_dc0e]
signal opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2820_c11_e0ce]
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2820_c1_a46f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2821_c7_8a90]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2820_c7_6e17]
signal opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2820_c41_b66f]
signal jci_uxn_opcodes_h_l2820_c41_b66f_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2820_c41_b66f_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2820_c41_b66f_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2820_c41_b66f_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2820_c41_b66f_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2820_c41_b66f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2821_c11_1497]
signal BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2821_c1_97ef]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2822_c7_1ee4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2821_c7_8a90]
signal opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2821_c41_8f32]
signal jmi_uxn_opcodes_h_l2821_c41_8f32_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2821_c41_8f32_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2821_c41_8f32_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2821_c41_8f32_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2821_c41_8f32_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2822_c11_391c]
signal BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2822_c1_7ede]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2823_c7_83e4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2822_c7_1ee4]
signal opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2822_c41_c636]
signal jsi_uxn_opcodes_h_l2822_c41_c636_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2822_c41_c636_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2822_c41_c636_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2822_c41_c636_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2822_c41_c636_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2823_c11_0e06]
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2823_c1_4849]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2824_c7_bc2c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2823_c7_83e4]
signal opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2823_c41_cf7a]
signal lit_uxn_opcodes_h_l2823_c41_cf7a_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2823_c41_cf7a_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2823_c41_cf7a_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2823_c41_cf7a_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2823_c41_cf7a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2824_c11_6598]
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2824_c1_f153]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2825_c7_1268]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2824_c7_bc2c]
signal opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2824_c41_ee2d]
signal lit2_uxn_opcodes_h_l2824_c41_ee2d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2824_c41_ee2d_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2824_c41_ee2d_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2824_c41_ee2d_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2824_c41_ee2d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2825_c11_8564]
signal BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2825_c1_1f64]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2826_c7_b031]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2825_c7_1268]
signal opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2825_c41_384c]
signal lit_uxn_opcodes_h_l2825_c41_384c_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2825_c41_384c_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2825_c41_384c_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2825_c41_384c_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2825_c41_384c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2826_c11_80ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2826_c1_f7c4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2827_c7_837e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2826_c7_b031]
signal opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2826_c41_5423]
signal lit2_uxn_opcodes_h_l2826_c41_5423_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2826_c41_5423_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2826_c41_5423_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2826_c41_5423_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2826_c41_5423_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2827_c11_cf72]
signal BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2827_c1_782a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2828_c7_9e38]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2827_c7_837e]
signal opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2827_c41_62a8]
signal inc_uxn_opcodes_h_l2827_c41_62a8_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2827_c41_62a8_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2827_c41_62a8_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2827_c41_62a8_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2827_c41_62a8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2828_c11_698a]
signal BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2828_c1_3130]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2829_c7_2877]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2828_c7_9e38]
signal opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2828_c41_13e7]
signal inc2_uxn_opcodes_h_l2828_c41_13e7_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2828_c41_13e7_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2828_c41_13e7_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2828_c41_13e7_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2828_c41_13e7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2829_c11_9d98]
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2829_c1_0bd4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2830_c7_d1a1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2829_c7_2877]
signal opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2829_c41_a8da]
signal pop_uxn_opcodes_h_l2829_c41_a8da_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2829_c41_a8da_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2829_c41_a8da_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2829_c41_a8da_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2830_c11_0fa7]
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2830_c1_e24c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2831_c7_d8a8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2830_c7_d1a1]
signal opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2830_c41_835f]
signal pop2_uxn_opcodes_h_l2830_c41_835f_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2830_c41_835f_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2830_c41_835f_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2830_c41_835f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2831_c11_7389]
signal BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2831_c1_f870]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2832_c7_664c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2831_c7_d8a8]
signal opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2831_c41_2170]
signal nip_uxn_opcodes_h_l2831_c41_2170_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2831_c41_2170_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2831_c41_2170_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2831_c41_2170_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2831_c41_2170_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2832_c11_f603]
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2832_c1_b701]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2833_c7_c12d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2832_c7_664c]
signal opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2832_c41_632e]
signal nip2_uxn_opcodes_h_l2832_c41_632e_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2832_c41_632e_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2832_c41_632e_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2832_c41_632e_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2832_c41_632e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2833_c11_a1e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2833_c1_9cba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2834_c7_caee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2833_c7_c12d]
signal opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2833_c41_b5c6]
signal swp_uxn_opcodes_h_l2833_c41_b5c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2833_c41_b5c6_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2833_c41_b5c6_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2833_c41_b5c6_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2833_c41_b5c6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2834_c11_645e]
signal BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2834_c1_0a68]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2835_c7_c5d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2834_c7_caee]
signal opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2834_c41_2f2a]
signal swp2_uxn_opcodes_h_l2834_c41_2f2a_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2834_c41_2f2a_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2834_c41_2f2a_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2834_c41_2f2a_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2834_c41_2f2a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2835_c11_8ffd]
signal BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2835_c1_f65d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2836_c7_8556]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2835_c7_c5d5]
signal opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2835_c41_c1c5]
signal rot_uxn_opcodes_h_l2835_c41_c1c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2835_c41_c1c5_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2835_c41_c1c5_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2835_c41_c1c5_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2835_c41_c1c5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2836_c11_e2bb]
signal BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2836_c1_4f05]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2837_c7_33f6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2836_c7_8556]
signal opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2836_c41_cd96]
signal rot2_uxn_opcodes_h_l2836_c41_cd96_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2836_c41_cd96_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2836_c41_cd96_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2836_c41_cd96_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2836_c41_cd96_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2837_c11_0f34]
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2837_c1_8b0c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2838_c7_fb52]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2837_c7_33f6]
signal opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2837_c41_6aaf]
signal dup_uxn_opcodes_h_l2837_c41_6aaf_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2837_c41_6aaf_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2837_c41_6aaf_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2837_c41_6aaf_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2837_c41_6aaf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2838_c11_99f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2838_c1_d077]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2839_c7_0a9e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2838_c7_fb52]
signal opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2838_c41_1cb4]
signal dup2_uxn_opcodes_h_l2838_c41_1cb4_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2838_c41_1cb4_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2838_c41_1cb4_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2838_c41_1cb4_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2838_c41_1cb4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2839_c11_5bb1]
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2839_c1_b8f8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2840_c7_6e5b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2839_c7_0a9e]
signal opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2839_c41_f5f0]
signal ovr_uxn_opcodes_h_l2839_c41_f5f0_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2839_c41_f5f0_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2839_c41_f5f0_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2839_c41_f5f0_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2839_c41_f5f0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2840_c11_f537]
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2840_c1_f606]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2841_c7_d3e4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2840_c7_6e5b]
signal opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2840_c41_ae37]
signal ovr2_uxn_opcodes_h_l2840_c41_ae37_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2840_c41_ae37_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2840_c41_ae37_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2840_c41_ae37_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2840_c41_ae37_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2841_c11_5460]
signal BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2841_c1_add8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2842_c7_aff1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2841_c7_d3e4]
signal opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2841_c41_2c29]
signal equ_uxn_opcodes_h_l2841_c41_2c29_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2841_c41_2c29_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2841_c41_2c29_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2841_c41_2c29_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2841_c41_2c29_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2842_c11_cb95]
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2842_c1_115f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2843_c7_4152]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2842_c7_aff1]
signal opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2842_c41_f401]
signal equ2_uxn_opcodes_h_l2842_c41_f401_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2842_c41_f401_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2842_c41_f401_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2842_c41_f401_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2842_c41_f401_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2843_c11_0b7e]
signal BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2843_c1_85c7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2844_c7_c09e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2843_c7_4152]
signal opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2843_c41_6261]
signal neq_uxn_opcodes_h_l2843_c41_6261_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2843_c41_6261_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2843_c41_6261_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2843_c41_6261_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2843_c41_6261_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2844_c11_6d42]
signal BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2844_c1_ac6d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2845_c7_19f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2844_c7_c09e]
signal opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2844_c41_cbcb]
signal neq2_uxn_opcodes_h_l2844_c41_cbcb_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2844_c41_cbcb_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2844_c41_cbcb_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2844_c41_cbcb_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2844_c41_cbcb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2845_c11_86f9]
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2845_c1_867a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2846_c7_8936]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2845_c7_19f0]
signal opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2845_c41_8aa3]
signal gth_uxn_opcodes_h_l2845_c41_8aa3_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2845_c41_8aa3_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2845_c41_8aa3_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2845_c41_8aa3_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2845_c41_8aa3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2846_c11_3fe7]
signal BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2846_c1_da7e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2847_c7_8bfa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2846_c7_8936]
signal opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2846_c41_8821]
signal gth2_uxn_opcodes_h_l2846_c41_8821_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2846_c41_8821_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2846_c41_8821_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2846_c41_8821_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2846_c41_8821_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2847_c11_2f79]
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2847_c1_ade3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2848_c7_fe16]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2847_c7_8bfa]
signal opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2847_c41_50ec]
signal lth_uxn_opcodes_h_l2847_c41_50ec_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2847_c41_50ec_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2847_c41_50ec_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2847_c41_50ec_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2847_c41_50ec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2848_c11_49c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2848_c1_7cd2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2849_c7_39cd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2848_c7_fe16]
signal opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2848_c41_c2e6]
signal lth2_uxn_opcodes_h_l2848_c41_c2e6_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2848_c41_c2e6_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2848_c41_c2e6_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2848_c41_c2e6_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2848_c41_c2e6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2849_c11_0f8a]
signal BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2849_c1_4c88]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2850_c7_e073]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2849_c7_39cd]
signal opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2849_c41_fbf4]
signal jmp_uxn_opcodes_h_l2849_c41_fbf4_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2849_c41_fbf4_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2849_c41_fbf4_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2849_c41_fbf4_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2849_c41_fbf4_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2849_c41_fbf4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2850_c11_6234]
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2850_c1_15f5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2851_c7_6d46]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2850_c7_e073]
signal opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2850_c41_63a6]
signal jmp2_uxn_opcodes_h_l2850_c41_63a6_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2850_c41_63a6_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2850_c41_63a6_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2850_c41_63a6_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2850_c41_63a6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2851_c11_4380]
signal BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2851_c1_dae1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2852_c7_19f1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2851_c7_6d46]
signal opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2851_c28_bb93[uxn_opcodes_h_l2851_c28_bb93]
signal printf_uxn_opcodes_h_l2851_c28_bb93_uxn_opcodes_h_l2851_c28_bb93_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2851_c28_bb93_uxn_opcodes_h_l2851_c28_bb93_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2852_c11_54ff]
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2852_c1_fd5b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2853_c7_1435]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2852_c7_19f1]
signal opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2852_c41_5028]
signal jcn2_uxn_opcodes_h_l2852_c41_5028_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2852_c41_5028_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2852_c41_5028_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2852_c41_5028_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2852_c41_5028_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2853_c11_da3f]
signal BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2853_c1_48ed]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2854_c7_40d7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2853_c7_1435]
signal opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2853_c28_04aa[uxn_opcodes_h_l2853_c28_04aa]
signal printf_uxn_opcodes_h_l2853_c28_04aa_uxn_opcodes_h_l2853_c28_04aa_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2853_c28_04aa_uxn_opcodes_h_l2853_c28_04aa_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2854_c11_2ee7]
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2854_c1_e039]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2855_c7_6700]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2854_c7_40d7]
signal opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2854_c41_4918]
signal jsr2_uxn_opcodes_h_l2854_c41_4918_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2854_c41_4918_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2854_c41_4918_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2854_c41_4918_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2854_c41_4918_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2855_c11_19ce]
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2855_c1_32fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2856_c7_d306]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2855_c7_6700]
signal opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2855_c28_0288[uxn_opcodes_h_l2855_c28_0288]
signal printf_uxn_opcodes_h_l2855_c28_0288_uxn_opcodes_h_l2855_c28_0288_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2855_c28_0288_uxn_opcodes_h_l2855_c28_0288_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2856_c11_8a62]
signal BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2856_c1_717b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2857_c7_8f3d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2856_c7_d306]
signal opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2856_c41_6507]
signal sth2_uxn_opcodes_h_l2856_c41_6507_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2856_c41_6507_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2856_c41_6507_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2856_c41_6507_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2856_c41_6507_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2857_c11_3a3c]
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2857_c1_55bc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2858_c7_1dff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2857_c7_8f3d]
signal opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2857_c41_dd23]
signal ldz_uxn_opcodes_h_l2857_c41_dd23_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2857_c41_dd23_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2857_c41_dd23_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2857_c41_dd23_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2857_c41_dd23_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2857_c41_dd23_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2858_c11_c6b9]
signal BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2858_c1_2c20]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2859_c7_c768]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2858_c7_1dff]
signal opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2858_c41_3c06]
signal ldz2_uxn_opcodes_h_l2858_c41_3c06_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2858_c41_3c06_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2858_c41_3c06_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2858_c41_3c06_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2858_c41_3c06_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2858_c41_3c06_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2859_c11_c029]
signal BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2859_c1_cc22]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2860_c7_d43c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2859_c7_c768]
signal opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2859_c28_76fe[uxn_opcodes_h_l2859_c28_76fe]
signal printf_uxn_opcodes_h_l2859_c28_76fe_uxn_opcodes_h_l2859_c28_76fe_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2859_c28_76fe_uxn_opcodes_h_l2859_c28_76fe_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2860_c11_566e]
signal BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2860_c1_4fa1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2861_c7_60c2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2860_c7_d43c]
signal opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2860_c28_ab52[uxn_opcodes_h_l2860_c28_ab52]
signal printf_uxn_opcodes_h_l2860_c28_ab52_uxn_opcodes_h_l2860_c28_ab52_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2860_c28_ab52_uxn_opcodes_h_l2860_c28_ab52_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2861_c11_bcfe]
signal BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2861_c1_4a36]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2862_c7_5cdf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2861_c7_60c2]
signal opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2861_c28_9d7f[uxn_opcodes_h_l2861_c28_9d7f]
signal printf_uxn_opcodes_h_l2861_c28_9d7f_uxn_opcodes_h_l2861_c28_9d7f_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2861_c28_9d7f_uxn_opcodes_h_l2861_c28_9d7f_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2862_c11_5863]
signal BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2862_c1_10db]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2863_c7_ef0d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2862_c7_5cdf]
signal opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2862_c28_eb8a[uxn_opcodes_h_l2862_c28_eb8a]
signal printf_uxn_opcodes_h_l2862_c28_eb8a_uxn_opcodes_h_l2862_c28_eb8a_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2862_c28_eb8a_uxn_opcodes_h_l2862_c28_eb8a_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2863_c11_fb93]
signal BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2863_c1_2ef1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2864_c7_ad9f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2863_c7_ef0d]
signal opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2863_c28_8ea1[uxn_opcodes_h_l2863_c28_8ea1]
signal printf_uxn_opcodes_h_l2863_c28_8ea1_uxn_opcodes_h_l2863_c28_8ea1_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2863_c28_8ea1_uxn_opcodes_h_l2863_c28_8ea1_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2864_c11_2117]
signal BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2864_c1_e93f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2865_c7_5c25]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2864_c7_ad9f]
signal opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2864_c28_3f4e[uxn_opcodes_h_l2864_c28_3f4e]
signal printf_uxn_opcodes_h_l2864_c28_3f4e_uxn_opcodes_h_l2864_c28_3f4e_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2864_c28_3f4e_uxn_opcodes_h_l2864_c28_3f4e_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2865_c11_95b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2865_c1_5f9f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2866_c7_b240]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2865_c7_5c25]
signal opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2865_c41_bdc2]
signal lda_uxn_opcodes_h_l2865_c41_bdc2_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2865_c41_bdc2_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2865_c41_bdc2_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2865_c41_bdc2_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2865_c41_bdc2_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2865_c41_bdc2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2866_c11_e832]
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2866_c1_c58d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2867_c7_d897]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2866_c7_b240]
signal opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2866_c41_967b]
signal lda2_uxn_opcodes_h_l2866_c41_967b_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2866_c41_967b_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2866_c41_967b_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2866_c41_967b_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2866_c41_967b_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2866_c41_967b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2867_c11_4148]
signal BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2867_c1_defd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2868_c7_23c4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2867_c7_d897]
signal opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2867_c41_a152]
signal sta_uxn_opcodes_h_l2867_c41_a152_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2867_c41_a152_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2867_c41_a152_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2867_c41_a152_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2867_c41_a152_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2868_c11_a801]
signal BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2868_c1_6f6e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2869_c7_cdac]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2868_c7_23c4]
signal opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2868_c41_f335]
signal sta2_uxn_opcodes_h_l2868_c41_f335_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2868_c41_f335_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2868_c41_f335_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2868_c41_f335_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2868_c41_f335_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2869_c11_7e60]
signal BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2869_c1_e834]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2870_c7_32c7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2869_c7_cdac]
signal opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2869_c28_a342[uxn_opcodes_h_l2869_c28_a342]
signal printf_uxn_opcodes_h_l2869_c28_a342_uxn_opcodes_h_l2869_c28_a342_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2869_c28_a342_uxn_opcodes_h_l2869_c28_a342_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2870_c11_e63b]
signal BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2870_c1_b519]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2871_c7_b9bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2870_c7_32c7]
signal opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2870_c28_16e1[uxn_opcodes_h_l2870_c28_16e1]
signal printf_uxn_opcodes_h_l2870_c28_16e1_uxn_opcodes_h_l2870_c28_16e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2870_c28_16e1_uxn_opcodes_h_l2870_c28_16e1_arg0 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2871_c11_c973]
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2871_c1_d229]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c7_7495]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2871_c7_b9bf]
signal opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2871_c41_bae1]
signal deo_uxn_opcodes_h_l2871_c41_bae1_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2871_c41_bae1_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2871_c41_bae1_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2871_c41_bae1_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2871_c41_bae1_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2871_c41_bae1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2872_c11_6b4d]
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c1_2fda]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_f2d9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2872_c7_7495]
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2872_c41_7ca8]
signal deo2_uxn_opcodes_h_l2872_c41_7ca8_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2872_c41_7ca8_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2872_c41_7ca8_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2872_c41_7ca8_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2872_c41_7ca8_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2872_c41_7ca8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_5a66]
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_0a05]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_0be5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2873_c7_f2d9]
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2873_c41_c724]
signal add_uxn_opcodes_h_l2873_c41_c724_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2873_c41_c724_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2873_c41_c724_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2873_c41_c724_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2873_c41_c724_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_8f0b]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_9e9e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_f0f1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2874_c7_0be5]
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2874_c41_b4f3]
signal add2_uxn_opcodes_h_l2874_c41_b4f3_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2874_c41_b4f3_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2874_c41_b4f3_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2874_c41_b4f3_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2874_c41_b4f3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_6581]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_4ff6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_35be]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2875_c7_f0f1]
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2875_c41_e520]
signal sub_uxn_opcodes_h_l2875_c41_e520_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2875_c41_e520_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2875_c41_e520_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2875_c41_e520_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2875_c41_e520_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_5716]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_98d2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_41a5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2876_c7_35be]
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2876_c41_9e98]
signal sub2_uxn_opcodes_h_l2876_c41_9e98_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2876_c41_9e98_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2876_c41_9e98_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2876_c41_9e98_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2876_c41_9e98_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_d02d]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_cdd6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_8a01]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2877_c7_41a5]
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2877_c41_77f1]
signal mul_uxn_opcodes_h_l2877_c41_77f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2877_c41_77f1_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2877_c41_77f1_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2877_c41_77f1_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2877_c41_77f1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_f865]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_2f8e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_971e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2878_c7_8a01]
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2878_c41_0c5d]
signal mul2_uxn_opcodes_h_l2878_c41_0c5d_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2878_c41_0c5d_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2878_c41_0c5d_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2878_c41_0c5d_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2878_c41_0c5d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_c550]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_de39]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_66a7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2879_c7_971e]
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2879_c41_9c4a]
signal div_uxn_opcodes_h_l2879_c41_9c4a_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2879_c41_9c4a_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2879_c41_9c4a_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2879_c41_9c4a_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2879_c41_9c4a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_6b76]
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_c5cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_2937]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2880_c7_66a7]
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2880_c41_4cf3]
signal div2_uxn_opcodes_h_l2880_c41_4cf3_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2880_c41_4cf3_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2880_c41_4cf3_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2880_c41_4cf3_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2880_c41_4cf3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_cb86]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_27f2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_b9df]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2881_c7_2937]
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2881_c41_c454]
signal and_uxn_opcodes_h_l2881_c41_c454_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2881_c41_c454_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2881_c41_c454_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2881_c41_c454_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2881_c41_c454_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_a304]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_f6b3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_67d3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2882_c7_b9df]
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2882_c41_9569]
signal and2_uxn_opcodes_h_l2882_c41_9569_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2882_c41_9569_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2882_c41_9569_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2882_c41_9569_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2882_c41_9569_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_7892]
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_8d55]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_c389]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2883_c7_67d3]
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2883_c41_0ab5]
signal ora_uxn_opcodes_h_l2883_c41_0ab5_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2883_c41_0ab5_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2883_c41_0ab5_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2883_c41_0ab5_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2883_c41_0ab5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_7a71]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_6449]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_555b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2884_c7_c389]
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2884_c41_11b5]
signal ora2_uxn_opcodes_h_l2884_c41_11b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2884_c41_11b5_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2884_c41_11b5_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2884_c41_11b5_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2884_c41_11b5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_152b]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_26a8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_7335]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2885_c7_555b]
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2885_c41_189f]
signal eor_uxn_opcodes_h_l2885_c41_189f_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2885_c41_189f_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2885_c41_189f_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2885_c41_189f_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2885_c41_189f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_97d8]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_d07e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_0d0e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2886_c7_7335]
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2886_c41_cd48]
signal eor2_uxn_opcodes_h_l2886_c41_cd48_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2886_c41_cd48_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2886_c41_cd48_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2886_c41_cd48_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2886_c41_cd48_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_2298]
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_3bea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_dd32]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2887_c7_0d0e]
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2887_c41_1736]
signal sft_uxn_opcodes_h_l2887_c41_1736_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2887_c41_1736_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2887_c41_1736_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2887_c41_1736_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2887_c41_1736_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_4db0]
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_ad50]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_fcde]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2888_c7_dd32]
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2888_c41_eabf]
signal sft2_uxn_opcodes_h_l2888_c41_eabf_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2888_c41_eabf_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2888_c41_eabf_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2888_c41_eabf_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2888_c41_eabf_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2889_c9_3026[uxn_opcodes_h_l2889_c9_3026]
signal printf_uxn_opcodes_h_l2889_c9_3026_uxn_opcodes_h_l2889_c9_3026_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2889_c9_3026_uxn_opcodes_h_l2889_c9_3026_arg0 : unsigned(31 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2891_c2_09ca]
signal sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2891_c2_09ca]
signal sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2892_c3_4939]
signal sp0_MUX_uxn_opcodes_h_l2892_c3_4939_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2892_c3_4939_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2892_c3_4939_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2892_c3_4939_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2892_c3_4939]
signal sp1_MUX_uxn_opcodes_h_l2892_c3_4939_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2892_c3_4939_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2892_c3_4939_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2892_c3_4939_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2893_c4_0761]
signal BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2895_c4_55b5]
signal BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2901_c19_c2bb]
signal MUX_uxn_opcodes_h_l2901_c19_c2bb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2901_c19_c2bb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2901_c19_c2bb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2901_c19_c2bb_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2901_c19_c917]
signal BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_f062]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_4ce8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_return_output : unsigned(0 downto 0);

-- stack_read_value_MUX[uxn_opcodes_h_l2904_c2_1899]
signal stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_cond : unsigned(0 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_iftrue : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_iffalse : unsigned(7 downto 0);
signal stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_return_output : unsigned(7 downto 0);

-- stack_r_ram_update[uxn_opcodes_h_l2905_c22_9e88]
signal stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_address0 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_write0_value : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_write0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_read0_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_address1 : unsigned(7 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_read1_enable : unsigned(0 downto 0);
signal stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_return_output : unsigned(15 downto 0);

-- stack_w_ram_update[uxn_opcodes_h_l2914_c22_79a3]
signal stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_address0 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_write0_value : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_write0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_read0_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_address1 : unsigned(7 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_read1_enable : unsigned(0 downto 0);
signal stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_return_output : unsigned(15 downto 0);

-- device_ram_update[uxn_opcodes_h_l2924_c26_7002]
signal device_ram_update_uxn_opcodes_h_l2924_c26_7002_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2924_c26_7002_address0 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2924_c26_7002_write0_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2924_c26_7002_write0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2924_c26_7002_read0_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2924_c26_7002_address1 : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l2924_c26_7002_read1_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l2924_c26_7002_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_return_output : unsigned(0 downto 0);

function CAST_TO_uint12_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(11 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,12)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314( ref_toks_0 : unsigned;
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
      base.is_pc_updated := ref_toks_0;
      base.pc := ref_toks_1;
      base.is_ram_read := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.ram_value := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.vram_address := ref_toks_7;
      base.vram_value := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1
BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_left,
BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_right,
BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488
BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_left,
BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_right,
BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b
BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_left,
BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_right,
BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_return_output);

-- CONST_SL_4_uxn_opcodes_h_l2814_c57_7524
CONST_SL_4_uxn_opcodes_h_l2814_c57_7524 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l2814_c57_7524_x,
CONST_SL_4_uxn_opcodes_h_l2814_c57_7524_return_output);

-- MUX_uxn_opcodes_h_l2814_c10_6f1c
MUX_uxn_opcodes_h_l2814_c10_6f1c : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2814_c10_6f1c_cond,
MUX_uxn_opcodes_h_l2814_c10_6f1c_iftrue,
MUX_uxn_opcodes_h_l2814_c10_6f1c_iffalse,
MUX_uxn_opcodes_h_l2814_c10_6f1c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c
BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_left,
BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_right,
BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f
BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_left,
BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_right,
BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_return_output);

-- MUX_uxn_opcodes_h_l2815_c18_fa40
MUX_uxn_opcodes_h_l2815_c18_fa40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2815_c18_fa40_cond,
MUX_uxn_opcodes_h_l2815_c18_fa40_iftrue,
MUX_uxn_opcodes_h_l2815_c18_fa40_iffalse,
MUX_uxn_opcodes_h_l2815_c18_fa40_return_output);

-- printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556
printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556 : entity work.printf_uxn_opcodes_h_l2817_c2_0556_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg0,
printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg1,
printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d
BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_left,
BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_right,
BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e
opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_cond,
opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_left,
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_right,
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17
opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_cond,
opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_iftrue,
opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_iffalse,
opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output);

-- jci_uxn_opcodes_h_l2820_c41_b66f
jci_uxn_opcodes_h_l2820_c41_b66f : entity work.jci_0CLK_bbbe252c port map (
clk,
jci_uxn_opcodes_h_l2820_c41_b66f_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2820_c41_b66f_phase,
jci_uxn_opcodes_h_l2820_c41_b66f_pc,
jci_uxn_opcodes_h_l2820_c41_b66f_previous_stack_read,
jci_uxn_opcodes_h_l2820_c41_b66f_previous_ram_read,
jci_uxn_opcodes_h_l2820_c41_b66f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_left,
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_right,
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90
opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_cond,
opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_iftrue,
opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_iffalse,
opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output);

-- jmi_uxn_opcodes_h_l2821_c41_8f32
jmi_uxn_opcodes_h_l2821_c41_8f32 : entity work.jmi_0CLK_b30fc8f1 port map (
clk,
jmi_uxn_opcodes_h_l2821_c41_8f32_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2821_c41_8f32_phase,
jmi_uxn_opcodes_h_l2821_c41_8f32_pc,
jmi_uxn_opcodes_h_l2821_c41_8f32_previous_ram_read,
jmi_uxn_opcodes_h_l2821_c41_8f32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c
BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_left,
BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_right,
BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4
opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_cond,
opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output);

-- jsi_uxn_opcodes_h_l2822_c41_c636
jsi_uxn_opcodes_h_l2822_c41_c636 : entity work.jsi_0CLK_a05d6369 port map (
clk,
jsi_uxn_opcodes_h_l2822_c41_c636_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2822_c41_c636_phase,
jsi_uxn_opcodes_h_l2822_c41_c636_pc,
jsi_uxn_opcodes_h_l2822_c41_c636_previous_ram_read,
jsi_uxn_opcodes_h_l2822_c41_c636_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_left,
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_right,
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4
opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_cond,
opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output);

-- lit_uxn_opcodes_h_l2823_c41_cf7a
lit_uxn_opcodes_h_l2823_c41_cf7a : entity work.lit_0CLK_3220bbf1 port map (
clk,
lit_uxn_opcodes_h_l2823_c41_cf7a_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2823_c41_cf7a_phase,
lit_uxn_opcodes_h_l2823_c41_cf7a_pc,
lit_uxn_opcodes_h_l2823_c41_cf7a_previous_ram_read,
lit_uxn_opcodes_h_l2823_c41_cf7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598
BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_left,
BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_right,
BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c
opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_cond,
opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output);

-- lit2_uxn_opcodes_h_l2824_c41_ee2d
lit2_uxn_opcodes_h_l2824_c41_ee2d : entity work.lit2_0CLK_bbbe252c port map (
clk,
lit2_uxn_opcodes_h_l2824_c41_ee2d_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2824_c41_ee2d_phase,
lit2_uxn_opcodes_h_l2824_c41_ee2d_pc,
lit2_uxn_opcodes_h_l2824_c41_ee2d_previous_ram_read,
lit2_uxn_opcodes_h_l2824_c41_ee2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_left,
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_right,
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2825_c7_1268
opc_result_MUX_uxn_opcodes_h_l2825_c7_1268 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_cond,
opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_iftrue,
opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_iffalse,
opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_return_output);

-- lit_uxn_opcodes_h_l2825_c41_384c
lit_uxn_opcodes_h_l2825_c41_384c : entity work.lit_0CLK_3220bbf1 port map (
clk,
lit_uxn_opcodes_h_l2825_c41_384c_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2825_c41_384c_phase,
lit_uxn_opcodes_h_l2825_c41_384c_pc,
lit_uxn_opcodes_h_l2825_c41_384c_previous_ram_read,
lit_uxn_opcodes_h_l2825_c41_384c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2826_c7_b031
opc_result_MUX_uxn_opcodes_h_l2826_c7_b031 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_cond,
opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_iftrue,
opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_iffalse,
opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_return_output);

-- lit2_uxn_opcodes_h_l2826_c41_5423
lit2_uxn_opcodes_h_l2826_c41_5423 : entity work.lit2_0CLK_bbbe252c port map (
clk,
lit2_uxn_opcodes_h_l2826_c41_5423_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2826_c41_5423_phase,
lit2_uxn_opcodes_h_l2826_c41_5423_pc,
lit2_uxn_opcodes_h_l2826_c41_5423_previous_ram_read,
lit2_uxn_opcodes_h_l2826_c41_5423_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_left,
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_right,
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2827_c7_837e
opc_result_MUX_uxn_opcodes_h_l2827_c7_837e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_cond,
opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_return_output);

-- inc_uxn_opcodes_h_l2827_c41_62a8
inc_uxn_opcodes_h_l2827_c41_62a8 : entity work.inc_0CLK_66ba3dc0 port map (
clk,
inc_uxn_opcodes_h_l2827_c41_62a8_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2827_c41_62a8_phase,
inc_uxn_opcodes_h_l2827_c41_62a8_ins,
inc_uxn_opcodes_h_l2827_c41_62a8_previous_stack_read,
inc_uxn_opcodes_h_l2827_c41_62a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_left,
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_right,
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38
opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_cond,
opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_iftrue,
opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_iffalse,
opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output);

-- inc2_uxn_opcodes_h_l2828_c41_13e7
inc2_uxn_opcodes_h_l2828_c41_13e7 : entity work.inc2_0CLK_26f67814 port map (
clk,
inc2_uxn_opcodes_h_l2828_c41_13e7_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2828_c41_13e7_phase,
inc2_uxn_opcodes_h_l2828_c41_13e7_ins,
inc2_uxn_opcodes_h_l2828_c41_13e7_previous_stack_read,
inc2_uxn_opcodes_h_l2828_c41_13e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_left,
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_right,
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2829_c7_2877
opc_result_MUX_uxn_opcodes_h_l2829_c7_2877 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_cond,
opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_iftrue,
opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_iffalse,
opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_return_output);

-- pop_uxn_opcodes_h_l2829_c41_a8da
pop_uxn_opcodes_h_l2829_c41_a8da : entity work.pop_0CLK_10d8c973 port map (
clk,
pop_uxn_opcodes_h_l2829_c41_a8da_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2829_c41_a8da_phase,
pop_uxn_opcodes_h_l2829_c41_a8da_ins,
pop_uxn_opcodes_h_l2829_c41_a8da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_left,
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_right,
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1
opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_cond,
opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output);

-- pop2_uxn_opcodes_h_l2830_c41_835f
pop2_uxn_opcodes_h_l2830_c41_835f : entity work.pop2_0CLK_10d8c973 port map (
clk,
pop2_uxn_opcodes_h_l2830_c41_835f_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2830_c41_835f_phase,
pop2_uxn_opcodes_h_l2830_c41_835f_ins,
pop2_uxn_opcodes_h_l2830_c41_835f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389
BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_left,
BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_right,
BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8
opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_cond,
opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output);

-- nip_uxn_opcodes_h_l2831_c41_2170
nip_uxn_opcodes_h_l2831_c41_2170 : entity work.nip_0CLK_6481cb28 port map (
clk,
nip_uxn_opcodes_h_l2831_c41_2170_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2831_c41_2170_phase,
nip_uxn_opcodes_h_l2831_c41_2170_ins,
nip_uxn_opcodes_h_l2831_c41_2170_previous_stack_read,
nip_uxn_opcodes_h_l2831_c41_2170_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_left,
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_right,
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2832_c7_664c
opc_result_MUX_uxn_opcodes_h_l2832_c7_664c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_cond,
opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_return_output);

-- nip2_uxn_opcodes_h_l2832_c41_632e
nip2_uxn_opcodes_h_l2832_c41_632e : entity work.nip2_0CLK_50a1b8d0 port map (
clk,
nip2_uxn_opcodes_h_l2832_c41_632e_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2832_c41_632e_phase,
nip2_uxn_opcodes_h_l2832_c41_632e_ins,
nip2_uxn_opcodes_h_l2832_c41_632e_previous_stack_read,
nip2_uxn_opcodes_h_l2832_c41_632e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d
opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_cond,
opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output);

-- swp_uxn_opcodes_h_l2833_c41_b5c6
swp_uxn_opcodes_h_l2833_c41_b5c6 : entity work.swp_0CLK_90fc2573 port map (
clk,
swp_uxn_opcodes_h_l2833_c41_b5c6_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2833_c41_b5c6_phase,
swp_uxn_opcodes_h_l2833_c41_b5c6_ins,
swp_uxn_opcodes_h_l2833_c41_b5c6_previous_stack_read,
swp_uxn_opcodes_h_l2833_c41_b5c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_left,
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_right,
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2834_c7_caee
opc_result_MUX_uxn_opcodes_h_l2834_c7_caee : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_cond,
opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_iftrue,
opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_iffalse,
opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_return_output);

-- swp2_uxn_opcodes_h_l2834_c41_2f2a
swp2_uxn_opcodes_h_l2834_c41_2f2a : entity work.swp2_0CLK_04f7be23 port map (
clk,
swp2_uxn_opcodes_h_l2834_c41_2f2a_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2834_c41_2f2a_phase,
swp2_uxn_opcodes_h_l2834_c41_2f2a_ins,
swp2_uxn_opcodes_h_l2834_c41_2f2a_previous_stack_read,
swp2_uxn_opcodes_h_l2834_c41_2f2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd
BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_left,
BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_right,
BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5
opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_cond,
opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output);

-- rot_uxn_opcodes_h_l2835_c41_c1c5
rot_uxn_opcodes_h_l2835_c41_c1c5 : entity work.rot_0CLK_9c3c4e32 port map (
clk,
rot_uxn_opcodes_h_l2835_c41_c1c5_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2835_c41_c1c5_phase,
rot_uxn_opcodes_h_l2835_c41_c1c5_ins,
rot_uxn_opcodes_h_l2835_c41_c1c5_previous_stack_read,
rot_uxn_opcodes_h_l2835_c41_c1c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb
BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_left,
BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_right,
BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2836_c7_8556
opc_result_MUX_uxn_opcodes_h_l2836_c7_8556 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_cond,
opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_iftrue,
opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_iffalse,
opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_return_output);

-- rot2_uxn_opcodes_h_l2836_c41_cd96
rot2_uxn_opcodes_h_l2836_c41_cd96 : entity work.rot2_0CLK_79985188 port map (
clk,
rot2_uxn_opcodes_h_l2836_c41_cd96_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2836_c41_cd96_phase,
rot2_uxn_opcodes_h_l2836_c41_cd96_ins,
rot2_uxn_opcodes_h_l2836_c41_cd96_previous_stack_read,
rot2_uxn_opcodes_h_l2836_c41_cd96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_left,
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_right,
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6
opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_cond,
opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output);

-- dup_uxn_opcodes_h_l2837_c41_6aaf
dup_uxn_opcodes_h_l2837_c41_6aaf : entity work.dup_0CLK_a148083c port map (
clk,
dup_uxn_opcodes_h_l2837_c41_6aaf_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2837_c41_6aaf_phase,
dup_uxn_opcodes_h_l2837_c41_6aaf_ins,
dup_uxn_opcodes_h_l2837_c41_6aaf_previous_stack_read,
dup_uxn_opcodes_h_l2837_c41_6aaf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6
BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52
opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_cond,
opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_iftrue,
opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_iffalse,
opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output);

-- dup2_uxn_opcodes_h_l2838_c41_1cb4
dup2_uxn_opcodes_h_l2838_c41_1cb4 : entity work.dup2_0CLK_8f02dccf port map (
clk,
dup2_uxn_opcodes_h_l2838_c41_1cb4_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2838_c41_1cb4_phase,
dup2_uxn_opcodes_h_l2838_c41_1cb4_ins,
dup2_uxn_opcodes_h_l2838_c41_1cb4_previous_stack_read,
dup2_uxn_opcodes_h_l2838_c41_1cb4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_left,
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_right,
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e
opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_cond,
opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output);

-- ovr_uxn_opcodes_h_l2839_c41_f5f0
ovr_uxn_opcodes_h_l2839_c41_f5f0 : entity work.ovr_0CLK_cf70ec0f port map (
clk,
ovr_uxn_opcodes_h_l2839_c41_f5f0_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2839_c41_f5f0_phase,
ovr_uxn_opcodes_h_l2839_c41_f5f0_ins,
ovr_uxn_opcodes_h_l2839_c41_f5f0_previous_stack_read,
ovr_uxn_opcodes_h_l2839_c41_f5f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_left,
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_right,
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b
opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_cond,
opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output);

-- ovr2_uxn_opcodes_h_l2840_c41_ae37
ovr2_uxn_opcodes_h_l2840_c41_ae37 : entity work.ovr2_0CLK_084aa6da port map (
clk,
ovr2_uxn_opcodes_h_l2840_c41_ae37_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2840_c41_ae37_phase,
ovr2_uxn_opcodes_h_l2840_c41_ae37_ins,
ovr2_uxn_opcodes_h_l2840_c41_ae37_previous_stack_read,
ovr2_uxn_opcodes_h_l2840_c41_ae37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460
BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_left,
BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_right,
BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4
opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_cond,
opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output);

-- equ_uxn_opcodes_h_l2841_c41_2c29
equ_uxn_opcodes_h_l2841_c41_2c29 : entity work.equ_0CLK_7c2e709f port map (
clk,
equ_uxn_opcodes_h_l2841_c41_2c29_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2841_c41_2c29_phase,
equ_uxn_opcodes_h_l2841_c41_2c29_ins,
equ_uxn_opcodes_h_l2841_c41_2c29_previous_stack_read,
equ_uxn_opcodes_h_l2841_c41_2c29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_left,
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_right,
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1
opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_cond,
opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output);

-- equ2_uxn_opcodes_h_l2842_c41_f401
equ2_uxn_opcodes_h_l2842_c41_f401 : entity work.equ2_0CLK_3a9c1537 port map (
clk,
equ2_uxn_opcodes_h_l2842_c41_f401_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2842_c41_f401_phase,
equ2_uxn_opcodes_h_l2842_c41_f401_ins,
equ2_uxn_opcodes_h_l2842_c41_f401_previous_stack_read,
equ2_uxn_opcodes_h_l2842_c41_f401_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e
BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_left,
BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_right,
BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2843_c7_4152
opc_result_MUX_uxn_opcodes_h_l2843_c7_4152 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_cond,
opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_iftrue,
opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_iffalse,
opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_return_output);

-- neq_uxn_opcodes_h_l2843_c41_6261
neq_uxn_opcodes_h_l2843_c41_6261 : entity work.neq_0CLK_7c2e709f port map (
clk,
neq_uxn_opcodes_h_l2843_c41_6261_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2843_c41_6261_phase,
neq_uxn_opcodes_h_l2843_c41_6261_ins,
neq_uxn_opcodes_h_l2843_c41_6261_previous_stack_read,
neq_uxn_opcodes_h_l2843_c41_6261_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_left,
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_right,
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e
opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_cond,
opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output);

-- neq2_uxn_opcodes_h_l2844_c41_cbcb
neq2_uxn_opcodes_h_l2844_c41_cbcb : entity work.neq2_0CLK_3a9c1537 port map (
clk,
neq2_uxn_opcodes_h_l2844_c41_cbcb_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2844_c41_cbcb_phase,
neq2_uxn_opcodes_h_l2844_c41_cbcb_ins,
neq2_uxn_opcodes_h_l2844_c41_cbcb_previous_stack_read,
neq2_uxn_opcodes_h_l2844_c41_cbcb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_left,
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_right,
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0
opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_cond,
opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output);

-- gth_uxn_opcodes_h_l2845_c41_8aa3
gth_uxn_opcodes_h_l2845_c41_8aa3 : entity work.gth_0CLK_7c2e709f port map (
clk,
gth_uxn_opcodes_h_l2845_c41_8aa3_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2845_c41_8aa3_phase,
gth_uxn_opcodes_h_l2845_c41_8aa3_ins,
gth_uxn_opcodes_h_l2845_c41_8aa3_previous_stack_read,
gth_uxn_opcodes_h_l2845_c41_8aa3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7
BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_left,
BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_right,
BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2846_c7_8936
opc_result_MUX_uxn_opcodes_h_l2846_c7_8936 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_cond,
opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_iftrue,
opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_iffalse,
opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_return_output);

-- gth2_uxn_opcodes_h_l2846_c41_8821
gth2_uxn_opcodes_h_l2846_c41_8821 : entity work.gth2_0CLK_3a9c1537 port map (
clk,
gth2_uxn_opcodes_h_l2846_c41_8821_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2846_c41_8821_phase,
gth2_uxn_opcodes_h_l2846_c41_8821_ins,
gth2_uxn_opcodes_h_l2846_c41_8821_previous_stack_read,
gth2_uxn_opcodes_h_l2846_c41_8821_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_left,
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_right,
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa
opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_cond,
opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_iftrue,
opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_iffalse,
opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output);

-- lth_uxn_opcodes_h_l2847_c41_50ec
lth_uxn_opcodes_h_l2847_c41_50ec : entity work.lth_0CLK_7c2e709f port map (
clk,
lth_uxn_opcodes_h_l2847_c41_50ec_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2847_c41_50ec_phase,
lth_uxn_opcodes_h_l2847_c41_50ec_ins,
lth_uxn_opcodes_h_l2847_c41_50ec_previous_stack_read,
lth_uxn_opcodes_h_l2847_c41_50ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16
opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_cond,
opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_iftrue,
opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_iffalse,
opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output);

-- lth2_uxn_opcodes_h_l2848_c41_c2e6
lth2_uxn_opcodes_h_l2848_c41_c2e6 : entity work.lth2_0CLK_3a9c1537 port map (
clk,
lth2_uxn_opcodes_h_l2848_c41_c2e6_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2848_c41_c2e6_phase,
lth2_uxn_opcodes_h_l2848_c41_c2e6_ins,
lth2_uxn_opcodes_h_l2848_c41_c2e6_previous_stack_read,
lth2_uxn_opcodes_h_l2848_c41_c2e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a
BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_left,
BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_right,
BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd
opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_cond,
opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output);

-- jmp_uxn_opcodes_h_l2849_c41_fbf4
jmp_uxn_opcodes_h_l2849_c41_fbf4 : entity work.jmp_0CLK_6481cb28 port map (
clk,
jmp_uxn_opcodes_h_l2849_c41_fbf4_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2849_c41_fbf4_phase,
jmp_uxn_opcodes_h_l2849_c41_fbf4_ins,
jmp_uxn_opcodes_h_l2849_c41_fbf4_pc,
jmp_uxn_opcodes_h_l2849_c41_fbf4_previous_stack_read,
jmp_uxn_opcodes_h_l2849_c41_fbf4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_left,
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_right,
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2850_c7_e073
opc_result_MUX_uxn_opcodes_h_l2850_c7_e073 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_cond,
opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_iftrue,
opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_iffalse,
opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_return_output);

-- jmp2_uxn_opcodes_h_l2850_c41_63a6
jmp2_uxn_opcodes_h_l2850_c41_63a6 : entity work.jmp2_0CLK_f7466064 port map (
clk,
jmp2_uxn_opcodes_h_l2850_c41_63a6_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2850_c41_63a6_phase,
jmp2_uxn_opcodes_h_l2850_c41_63a6_ins,
jmp2_uxn_opcodes_h_l2850_c41_63a6_previous_stack_read,
jmp2_uxn_opcodes_h_l2850_c41_63a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380
BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_left,
BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_right,
BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46
opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_cond,
opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_iftrue,
opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_iffalse,
opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output);

-- printf_uxn_opcodes_h_l2851_c28_bb93_uxn_opcodes_h_l2851_c28_bb93
printf_uxn_opcodes_h_l2851_c28_bb93_uxn_opcodes_h_l2851_c28_bb93 : entity work.printf_uxn_opcodes_h_l2851_c28_bb93_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2851_c28_bb93_uxn_opcodes_h_l2851_c28_bb93_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2851_c28_bb93_uxn_opcodes_h_l2851_c28_bb93_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_left,
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_right,
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1
opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_cond,
opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output);

-- jcn2_uxn_opcodes_h_l2852_c41_5028
jcn2_uxn_opcodes_h_l2852_c41_5028 : entity work.jcn2_0CLK_bbbe252c port map (
clk,
jcn2_uxn_opcodes_h_l2852_c41_5028_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2852_c41_5028_phase,
jcn2_uxn_opcodes_h_l2852_c41_5028_ins,
jcn2_uxn_opcodes_h_l2852_c41_5028_previous_stack_read,
jcn2_uxn_opcodes_h_l2852_c41_5028_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f
BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_left,
BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_right,
BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2853_c7_1435
opc_result_MUX_uxn_opcodes_h_l2853_c7_1435 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_cond,
opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_iftrue,
opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_iffalse,
opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_return_output);

-- printf_uxn_opcodes_h_l2853_c28_04aa_uxn_opcodes_h_l2853_c28_04aa
printf_uxn_opcodes_h_l2853_c28_04aa_uxn_opcodes_h_l2853_c28_04aa : entity work.printf_uxn_opcodes_h_l2853_c28_04aa_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2853_c28_04aa_uxn_opcodes_h_l2853_c28_04aa_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2853_c28_04aa_uxn_opcodes_h_l2853_c28_04aa_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_left,
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_right,
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7
opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_cond,
opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output);

-- jsr2_uxn_opcodes_h_l2854_c41_4918
jsr2_uxn_opcodes_h_l2854_c41_4918 : entity work.jsr2_0CLK_a538d920 port map (
clk,
jsr2_uxn_opcodes_h_l2854_c41_4918_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2854_c41_4918_phase,
jsr2_uxn_opcodes_h_l2854_c41_4918_ins,
jsr2_uxn_opcodes_h_l2854_c41_4918_previous_stack_read,
jsr2_uxn_opcodes_h_l2854_c41_4918_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_left,
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_right,
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2855_c7_6700
opc_result_MUX_uxn_opcodes_h_l2855_c7_6700 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_cond,
opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_iftrue,
opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_iffalse,
opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_return_output);

-- printf_uxn_opcodes_h_l2855_c28_0288_uxn_opcodes_h_l2855_c28_0288
printf_uxn_opcodes_h_l2855_c28_0288_uxn_opcodes_h_l2855_c28_0288 : entity work.printf_uxn_opcodes_h_l2855_c28_0288_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2855_c28_0288_uxn_opcodes_h_l2855_c28_0288_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2855_c28_0288_uxn_opcodes_h_l2855_c28_0288_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62
BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_left,
BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_right,
BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2856_c7_d306
opc_result_MUX_uxn_opcodes_h_l2856_c7_d306 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_cond,
opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_iftrue,
opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_iffalse,
opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_return_output);

-- sth2_uxn_opcodes_h_l2856_c41_6507
sth2_uxn_opcodes_h_l2856_c41_6507 : entity work.sth2_0CLK_9c3c4e32 port map (
clk,
sth2_uxn_opcodes_h_l2856_c41_6507_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2856_c41_6507_phase,
sth2_uxn_opcodes_h_l2856_c41_6507_ins,
sth2_uxn_opcodes_h_l2856_c41_6507_previous_stack_read,
sth2_uxn_opcodes_h_l2856_c41_6507_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_left,
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_right,
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d
opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_cond,
opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output);

-- ldz_uxn_opcodes_h_l2857_c41_dd23
ldz_uxn_opcodes_h_l2857_c41_dd23 : entity work.ldz_0CLK_5b8ec7cf port map (
clk,
ldz_uxn_opcodes_h_l2857_c41_dd23_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2857_c41_dd23_phase,
ldz_uxn_opcodes_h_l2857_c41_dd23_ins,
ldz_uxn_opcodes_h_l2857_c41_dd23_previous_stack_read,
ldz_uxn_opcodes_h_l2857_c41_dd23_previous_ram_read,
ldz_uxn_opcodes_h_l2857_c41_dd23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9
BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_left,
BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_right,
BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff
opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_cond,
opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_iftrue,
opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_iffalse,
opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output);

-- ldz2_uxn_opcodes_h_l2858_c41_3c06
ldz2_uxn_opcodes_h_l2858_c41_3c06 : entity work.ldz2_0CLK_2b0015ee port map (
clk,
ldz2_uxn_opcodes_h_l2858_c41_3c06_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2858_c41_3c06_phase,
ldz2_uxn_opcodes_h_l2858_c41_3c06_ins,
ldz2_uxn_opcodes_h_l2858_c41_3c06_previous_stack_read,
ldz2_uxn_opcodes_h_l2858_c41_3c06_previous_ram_read,
ldz2_uxn_opcodes_h_l2858_c41_3c06_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029
BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_left,
BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_right,
BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2859_c7_c768
opc_result_MUX_uxn_opcodes_h_l2859_c7_c768 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_cond,
opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_iftrue,
opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_iffalse,
opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_return_output);

-- printf_uxn_opcodes_h_l2859_c28_76fe_uxn_opcodes_h_l2859_c28_76fe
printf_uxn_opcodes_h_l2859_c28_76fe_uxn_opcodes_h_l2859_c28_76fe : entity work.printf_uxn_opcodes_h_l2859_c28_76fe_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2859_c28_76fe_uxn_opcodes_h_l2859_c28_76fe_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2859_c28_76fe_uxn_opcodes_h_l2859_c28_76fe_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_left,
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_right,
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c
opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_cond,
opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output);

-- printf_uxn_opcodes_h_l2860_c28_ab52_uxn_opcodes_h_l2860_c28_ab52
printf_uxn_opcodes_h_l2860_c28_ab52_uxn_opcodes_h_l2860_c28_ab52 : entity work.printf_uxn_opcodes_h_l2860_c28_ab52_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2860_c28_ab52_uxn_opcodes_h_l2860_c28_ab52_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2860_c28_ab52_uxn_opcodes_h_l2860_c28_ab52_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe
BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_left,
BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_right,
BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2
opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_cond,
opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output);

-- printf_uxn_opcodes_h_l2861_c28_9d7f_uxn_opcodes_h_l2861_c28_9d7f
printf_uxn_opcodes_h_l2861_c28_9d7f_uxn_opcodes_h_l2861_c28_9d7f : entity work.printf_uxn_opcodes_h_l2861_c28_9d7f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2861_c28_9d7f_uxn_opcodes_h_l2861_c28_9d7f_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2861_c28_9d7f_uxn_opcodes_h_l2861_c28_9d7f_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_left,
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_right,
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf
opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_cond,
opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output);

-- printf_uxn_opcodes_h_l2862_c28_eb8a_uxn_opcodes_h_l2862_c28_eb8a
printf_uxn_opcodes_h_l2862_c28_eb8a_uxn_opcodes_h_l2862_c28_eb8a : entity work.printf_uxn_opcodes_h_l2862_c28_eb8a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2862_c28_eb8a_uxn_opcodes_h_l2862_c28_eb8a_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2862_c28_eb8a_uxn_opcodes_h_l2862_c28_eb8a_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93
BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_left,
BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_right,
BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d
opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_cond,
opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output);

-- printf_uxn_opcodes_h_l2863_c28_8ea1_uxn_opcodes_h_l2863_c28_8ea1
printf_uxn_opcodes_h_l2863_c28_8ea1_uxn_opcodes_h_l2863_c28_8ea1 : entity work.printf_uxn_opcodes_h_l2863_c28_8ea1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2863_c28_8ea1_uxn_opcodes_h_l2863_c28_8ea1_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2863_c28_8ea1_uxn_opcodes_h_l2863_c28_8ea1_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117
BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_left,
BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_right,
BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f
opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_cond,
opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output);

-- printf_uxn_opcodes_h_l2864_c28_3f4e_uxn_opcodes_h_l2864_c28_3f4e
printf_uxn_opcodes_h_l2864_c28_3f4e_uxn_opcodes_h_l2864_c28_3f4e : entity work.printf_uxn_opcodes_h_l2864_c28_3f4e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2864_c28_3f4e_uxn_opcodes_h_l2864_c28_3f4e_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2864_c28_3f4e_uxn_opcodes_h_l2864_c28_3f4e_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0
BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25
opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_cond,
opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_iftrue,
opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_iffalse,
opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output);

-- lda_uxn_opcodes_h_l2865_c41_bdc2
lda_uxn_opcodes_h_l2865_c41_bdc2 : entity work.lda_0CLK_d853ed1b port map (
clk,
lda_uxn_opcodes_h_l2865_c41_bdc2_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2865_c41_bdc2_phase,
lda_uxn_opcodes_h_l2865_c41_bdc2_ins,
lda_uxn_opcodes_h_l2865_c41_bdc2_previous_stack_read,
lda_uxn_opcodes_h_l2865_c41_bdc2_previous_ram_read,
lda_uxn_opcodes_h_l2865_c41_bdc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_left,
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_right,
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2866_c7_b240
opc_result_MUX_uxn_opcodes_h_l2866_c7_b240 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_cond,
opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_iftrue,
opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_iffalse,
opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_return_output);

-- lda2_uxn_opcodes_h_l2866_c41_967b
lda2_uxn_opcodes_h_l2866_c41_967b : entity work.lda2_0CLK_9347d63d port map (
clk,
lda2_uxn_opcodes_h_l2866_c41_967b_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2866_c41_967b_phase,
lda2_uxn_opcodes_h_l2866_c41_967b_ins,
lda2_uxn_opcodes_h_l2866_c41_967b_previous_stack_read,
lda2_uxn_opcodes_h_l2866_c41_967b_previous_ram_read,
lda2_uxn_opcodes_h_l2866_c41_967b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148
BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_left,
BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_right,
BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2867_c7_d897
opc_result_MUX_uxn_opcodes_h_l2867_c7_d897 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_cond,
opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_iftrue,
opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_iffalse,
opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_return_output);

-- sta_uxn_opcodes_h_l2867_c41_a152
sta_uxn_opcodes_h_l2867_c41_a152 : entity work.sta_0CLK_5e923a6a port map (
clk,
sta_uxn_opcodes_h_l2867_c41_a152_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2867_c41_a152_phase,
sta_uxn_opcodes_h_l2867_c41_a152_ins,
sta_uxn_opcodes_h_l2867_c41_a152_previous_stack_read,
sta_uxn_opcodes_h_l2867_c41_a152_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801
BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_left,
BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_right,
BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4
opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_cond,
opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output);

-- sta2_uxn_opcodes_h_l2868_c41_f335
sta2_uxn_opcodes_h_l2868_c41_f335 : entity work.sta2_0CLK_201aeef3 port map (
clk,
sta2_uxn_opcodes_h_l2868_c41_f335_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2868_c41_f335_phase,
sta2_uxn_opcodes_h_l2868_c41_f335_ins,
sta2_uxn_opcodes_h_l2868_c41_f335_previous_stack_read,
sta2_uxn_opcodes_h_l2868_c41_f335_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60
BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_left,
BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_right,
BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac
opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_cond,
opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_iftrue,
opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_iffalse,
opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output);

-- printf_uxn_opcodes_h_l2869_c28_a342_uxn_opcodes_h_l2869_c28_a342
printf_uxn_opcodes_h_l2869_c28_a342_uxn_opcodes_h_l2869_c28_a342 : entity work.printf_uxn_opcodes_h_l2869_c28_a342_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2869_c28_a342_uxn_opcodes_h_l2869_c28_a342_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2869_c28_a342_uxn_opcodes_h_l2869_c28_a342_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_left,
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_right,
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7
opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_cond,
opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output);

-- printf_uxn_opcodes_h_l2870_c28_16e1_uxn_opcodes_h_l2870_c28_16e1
printf_uxn_opcodes_h_l2870_c28_16e1_uxn_opcodes_h_l2870_c28_16e1 : entity work.printf_uxn_opcodes_h_l2870_c28_16e1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2870_c28_16e1_uxn_opcodes_h_l2870_c28_16e1_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2870_c28_16e1_uxn_opcodes_h_l2870_c28_16e1_arg0);

-- BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_left,
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_right,
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf
opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_cond,
opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output);

-- deo_uxn_opcodes_h_l2871_c41_bae1
deo_uxn_opcodes_h_l2871_c41_bae1 : entity work.deo_0CLK_52d54777 port map (
clk,
deo_uxn_opcodes_h_l2871_c41_bae1_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2871_c41_bae1_phase,
deo_uxn_opcodes_h_l2871_c41_bae1_ins,
deo_uxn_opcodes_h_l2871_c41_bae1_previous_stack_read,
deo_uxn_opcodes_h_l2871_c41_bae1_previous_device_ram_read,
deo_uxn_opcodes_h_l2871_c41_bae1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_left,
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_right,
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2872_c7_7495
opc_result_MUX_uxn_opcodes_h_l2872_c7_7495 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_cond,
opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_iftrue,
opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_iffalse,
opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_return_output);

-- deo2_uxn_opcodes_h_l2872_c41_7ca8
deo2_uxn_opcodes_h_l2872_c41_7ca8 : entity work.deo2_0CLK_3ae8bf4a port map (
clk,
deo2_uxn_opcodes_h_l2872_c41_7ca8_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2872_c41_7ca8_phase,
deo2_uxn_opcodes_h_l2872_c41_7ca8_ins,
deo2_uxn_opcodes_h_l2872_c41_7ca8_previous_stack_read,
deo2_uxn_opcodes_h_l2872_c41_7ca8_previous_device_ram_read,
deo2_uxn_opcodes_h_l2872_c41_7ca8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_left,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_right,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9
opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_cond,
opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output);

-- add_uxn_opcodes_h_l2873_c41_c724
add_uxn_opcodes_h_l2873_c41_c724 : entity work.add_0CLK_fd2391e7 port map (
clk,
add_uxn_opcodes_h_l2873_c41_c724_CLOCK_ENABLE,
add_uxn_opcodes_h_l2873_c41_c724_phase,
add_uxn_opcodes_h_l2873_c41_c724_ins,
add_uxn_opcodes_h_l2873_c41_c724_previous_stack_read,
add_uxn_opcodes_h_l2873_c41_c724_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5
opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_cond,
opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output);

-- add2_uxn_opcodes_h_l2874_c41_b4f3
add2_uxn_opcodes_h_l2874_c41_b4f3 : entity work.add2_0CLK_201aeef3 port map (
clk,
add2_uxn_opcodes_h_l2874_c41_b4f3_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2874_c41_b4f3_phase,
add2_uxn_opcodes_h_l2874_c41_b4f3_ins,
add2_uxn_opcodes_h_l2874_c41_b4f3_previous_stack_read,
add2_uxn_opcodes_h_l2874_c41_b4f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1
opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_cond,
opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output);

-- sub_uxn_opcodes_h_l2875_c41_e520
sub_uxn_opcodes_h_l2875_c41_e520 : entity work.sub_0CLK_fd2391e7 port map (
clk,
sub_uxn_opcodes_h_l2875_c41_e520_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2875_c41_e520_phase,
sub_uxn_opcodes_h_l2875_c41_e520_ins,
sub_uxn_opcodes_h_l2875_c41_e520_previous_stack_read,
sub_uxn_opcodes_h_l2875_c41_e520_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2876_c7_35be
opc_result_MUX_uxn_opcodes_h_l2876_c7_35be : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_cond,
opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_iftrue,
opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_iffalse,
opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_return_output);

-- sub2_uxn_opcodes_h_l2876_c41_9e98
sub2_uxn_opcodes_h_l2876_c41_9e98 : entity work.sub2_0CLK_201aeef3 port map (
clk,
sub2_uxn_opcodes_h_l2876_c41_9e98_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2876_c41_9e98_phase,
sub2_uxn_opcodes_h_l2876_c41_9e98_ins,
sub2_uxn_opcodes_h_l2876_c41_9e98_previous_stack_read,
sub2_uxn_opcodes_h_l2876_c41_9e98_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5
opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_cond,
opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output);

-- mul_uxn_opcodes_h_l2877_c41_77f1
mul_uxn_opcodes_h_l2877_c41_77f1 : entity work.mul_0CLK_fd2391e7 port map (
clk,
mul_uxn_opcodes_h_l2877_c41_77f1_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2877_c41_77f1_phase,
mul_uxn_opcodes_h_l2877_c41_77f1_ins,
mul_uxn_opcodes_h_l2877_c41_77f1_previous_stack_read,
mul_uxn_opcodes_h_l2877_c41_77f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01
opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_cond,
opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_iftrue,
opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_iffalse,
opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output);

-- mul2_uxn_opcodes_h_l2878_c41_0c5d
mul2_uxn_opcodes_h_l2878_c41_0c5d : entity work.mul2_0CLK_201aeef3 port map (
clk,
mul2_uxn_opcodes_h_l2878_c41_0c5d_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2878_c41_0c5d_phase,
mul2_uxn_opcodes_h_l2878_c41_0c5d_ins,
mul2_uxn_opcodes_h_l2878_c41_0c5d_previous_stack_read,
mul2_uxn_opcodes_h_l2878_c41_0c5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2879_c7_971e
opc_result_MUX_uxn_opcodes_h_l2879_c7_971e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_cond,
opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_return_output);

-- div_uxn_opcodes_h_l2879_c41_9c4a
div_uxn_opcodes_h_l2879_c41_9c4a : entity work.div_0CLK_f6fa2c7d port map (
clk,
div_uxn_opcodes_h_l2879_c41_9c4a_CLOCK_ENABLE,
div_uxn_opcodes_h_l2879_c41_9c4a_phase,
div_uxn_opcodes_h_l2879_c41_9c4a_ins,
div_uxn_opcodes_h_l2879_c41_9c4a_previous_stack_read,
div_uxn_opcodes_h_l2879_c41_9c4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_left,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_right,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7
opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_cond,
opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output);

-- div2_uxn_opcodes_h_l2880_c41_4cf3
div2_uxn_opcodes_h_l2880_c41_4cf3 : entity work.div2_0CLK_444c40b9 port map (
clk,
div2_uxn_opcodes_h_l2880_c41_4cf3_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2880_c41_4cf3_phase,
div2_uxn_opcodes_h_l2880_c41_4cf3_ins,
div2_uxn_opcodes_h_l2880_c41_4cf3_previous_stack_read,
div2_uxn_opcodes_h_l2880_c41_4cf3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2881_c7_2937
opc_result_MUX_uxn_opcodes_h_l2881_c7_2937 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_cond,
opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_iftrue,
opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_iffalse,
opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_return_output);

-- and_uxn_opcodes_h_l2881_c41_c454
and_uxn_opcodes_h_l2881_c41_c454 : entity work.and_0CLK_fd2391e7 port map (
clk,
and_uxn_opcodes_h_l2881_c41_c454_CLOCK_ENABLE,
and_uxn_opcodes_h_l2881_c41_c454_phase,
and_uxn_opcodes_h_l2881_c41_c454_ins,
and_uxn_opcodes_h_l2881_c41_c454_previous_stack_read,
and_uxn_opcodes_h_l2881_c41_c454_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df
opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_cond,
opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_iftrue,
opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_iffalse,
opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output);

-- and2_uxn_opcodes_h_l2882_c41_9569
and2_uxn_opcodes_h_l2882_c41_9569 : entity work.and2_0CLK_201aeef3 port map (
clk,
and2_uxn_opcodes_h_l2882_c41_9569_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2882_c41_9569_phase,
and2_uxn_opcodes_h_l2882_c41_9569_ins,
and2_uxn_opcodes_h_l2882_c41_9569_previous_stack_read,
and2_uxn_opcodes_h_l2882_c41_9569_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_left,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_right,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3
opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_cond,
opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output);

-- ora_uxn_opcodes_h_l2883_c41_0ab5
ora_uxn_opcodes_h_l2883_c41_0ab5 : entity work.ora_0CLK_fd2391e7 port map (
clk,
ora_uxn_opcodes_h_l2883_c41_0ab5_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2883_c41_0ab5_phase,
ora_uxn_opcodes_h_l2883_c41_0ab5_ins,
ora_uxn_opcodes_h_l2883_c41_0ab5_previous_stack_read,
ora_uxn_opcodes_h_l2883_c41_0ab5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2884_c7_c389
opc_result_MUX_uxn_opcodes_h_l2884_c7_c389 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_cond,
opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_iftrue,
opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_iffalse,
opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_return_output);

-- ora2_uxn_opcodes_h_l2884_c41_11b5
ora2_uxn_opcodes_h_l2884_c41_11b5 : entity work.ora2_0CLK_201aeef3 port map (
clk,
ora2_uxn_opcodes_h_l2884_c41_11b5_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2884_c41_11b5_phase,
ora2_uxn_opcodes_h_l2884_c41_11b5_ins,
ora2_uxn_opcodes_h_l2884_c41_11b5_previous_stack_read,
ora2_uxn_opcodes_h_l2884_c41_11b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2885_c7_555b
opc_result_MUX_uxn_opcodes_h_l2885_c7_555b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_cond,
opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_return_output);

-- eor_uxn_opcodes_h_l2885_c41_189f
eor_uxn_opcodes_h_l2885_c41_189f : entity work.eor_0CLK_fd2391e7 port map (
clk,
eor_uxn_opcodes_h_l2885_c41_189f_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2885_c41_189f_phase,
eor_uxn_opcodes_h_l2885_c41_189f_ins,
eor_uxn_opcodes_h_l2885_c41_189f_previous_stack_read,
eor_uxn_opcodes_h_l2885_c41_189f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2886_c7_7335
opc_result_MUX_uxn_opcodes_h_l2886_c7_7335 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_cond,
opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_iftrue,
opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_iffalse,
opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_return_output);

-- eor2_uxn_opcodes_h_l2886_c41_cd48
eor2_uxn_opcodes_h_l2886_c41_cd48 : entity work.eor2_0CLK_201aeef3 port map (
clk,
eor2_uxn_opcodes_h_l2886_c41_cd48_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2886_c41_cd48_phase,
eor2_uxn_opcodes_h_l2886_c41_cd48_ins,
eor2_uxn_opcodes_h_l2886_c41_cd48_previous_stack_read,
eor2_uxn_opcodes_h_l2886_c41_cd48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_left,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_right,
BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e
opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_cond,
opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output);

-- sft_uxn_opcodes_h_l2887_c41_1736
sft_uxn_opcodes_h_l2887_c41_1736 : entity work.sft_0CLK_f7a3ea45 port map (
clk,
sft_uxn_opcodes_h_l2887_c41_1736_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2887_c41_1736_phase,
sft_uxn_opcodes_h_l2887_c41_1736_ins,
sft_uxn_opcodes_h_l2887_c41_1736_previous_stack_read,
sft_uxn_opcodes_h_l2887_c41_1736_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_left,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_right,
BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32
opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_cond,
opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_iftrue,
opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_iffalse,
opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output);

-- sft2_uxn_opcodes_h_l2888_c41_eabf
sft2_uxn_opcodes_h_l2888_c41_eabf : entity work.sft2_0CLK_d29b8e2d port map (
clk,
sft2_uxn_opcodes_h_l2888_c41_eabf_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2888_c41_eabf_phase,
sft2_uxn_opcodes_h_l2888_c41_eabf_ins,
sft2_uxn_opcodes_h_l2888_c41_eabf_previous_stack_read,
sft2_uxn_opcodes_h_l2888_c41_eabf_return_output);

-- printf_uxn_opcodes_h_l2889_c9_3026_uxn_opcodes_h_l2889_c9_3026
printf_uxn_opcodes_h_l2889_c9_3026_uxn_opcodes_h_l2889_c9_3026 : entity work.printf_uxn_opcodes_h_l2889_c9_3026_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2889_c9_3026_uxn_opcodes_h_l2889_c9_3026_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2889_c9_3026_uxn_opcodes_h_l2889_c9_3026_arg0);

-- sp0_MUX_uxn_opcodes_h_l2891_c2_09ca
sp0_MUX_uxn_opcodes_h_l2891_c2_09ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_cond,
sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_iftrue,
sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_iffalse,
sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output);

-- sp1_MUX_uxn_opcodes_h_l2891_c2_09ca
sp1_MUX_uxn_opcodes_h_l2891_c2_09ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_cond,
sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_iftrue,
sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_iffalse,
sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output);

-- sp0_MUX_uxn_opcodes_h_l2892_c3_4939
sp0_MUX_uxn_opcodes_h_l2892_c3_4939 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2892_c3_4939_cond,
sp0_MUX_uxn_opcodes_h_l2892_c3_4939_iftrue,
sp0_MUX_uxn_opcodes_h_l2892_c3_4939_iffalse,
sp0_MUX_uxn_opcodes_h_l2892_c3_4939_return_output);

-- sp1_MUX_uxn_opcodes_h_l2892_c3_4939
sp1_MUX_uxn_opcodes_h_l2892_c3_4939 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2892_c3_4939_cond,
sp1_MUX_uxn_opcodes_h_l2892_c3_4939_iftrue,
sp1_MUX_uxn_opcodes_h_l2892_c3_4939_iffalse,
sp1_MUX_uxn_opcodes_h_l2892_c3_4939_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761
BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_left,
BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_right,
BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5
BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_left,
BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_right,
BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_return_output);

-- MUX_uxn_opcodes_h_l2901_c19_c2bb
MUX_uxn_opcodes_h_l2901_c19_c2bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2901_c19_c2bb_cond,
MUX_uxn_opcodes_h_l2901_c19_c2bb_iftrue,
MUX_uxn_opcodes_h_l2901_c19_c2bb_iffalse,
MUX_uxn_opcodes_h_l2901_c19_c2bb_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917
BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917 : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_left,
BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_right,
BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_return_output);

-- stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899
stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_cond,
stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_iftrue,
stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_iffalse,
stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_return_output);

-- stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88
stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88 : entity work.stack_r_ram_update_0CLK_79ef54d6 port map (
clk,
stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_CLOCK_ENABLE,
stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_address0,
stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_write0_value,
stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_write0_enable,
stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_read0_enable,
stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_address1,
stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_read1_enable,
stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_return_output);

-- stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3
stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3 : entity work.stack_w_ram_update_0CLK_79ef54d6 port map (
clk,
stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_CLOCK_ENABLE,
stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_address0,
stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_write0_value,
stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_write0_enable,
stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_read0_enable,
stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_address1,
stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_read1_enable,
stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_return_output);

-- device_ram_update_uxn_opcodes_h_l2924_c26_7002
device_ram_update_uxn_opcodes_h_l2924_c26_7002 : entity work.device_ram_update_0CLK_11ce349a port map (
clk,
device_ram_update_uxn_opcodes_h_l2924_c26_7002_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l2924_c26_7002_address0,
device_ram_update_uxn_opcodes_h_l2924_c26_7002_write0_value,
device_ram_update_uxn_opcodes_h_l2924_c26_7002_write0_enable,
device_ram_update_uxn_opcodes_h_l2924_c26_7002_read0_enable,
device_ram_update_uxn_opcodes_h_l2924_c26_7002_address1,
device_ram_update_uxn_opcodes_h_l2924_c26_7002_read1_enable,
device_ram_update_uxn_opcodes_h_l2924_c26_7002_return_output);

-- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_left,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_right,
BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_ram_read,
 -- Registers
 sp0,
 sp1,
 opc,
 stack_index,
 is_stack_read,
 is_stack_write,
 stack_address,
 stack_write_value,
 stack_read_value,
 device_ram_read_value,
 opc_result,
 opc_eval_result,
 -- All submodule outputs
 BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_return_output,
 CONST_SL_4_uxn_opcodes_h_l2814_c57_7524_return_output,
 MUX_uxn_opcodes_h_l2814_c10_6f1c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_return_output,
 MUX_uxn_opcodes_h_l2815_c18_fa40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output,
 opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output,
 opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output,
 jci_uxn_opcodes_h_l2820_c41_b66f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output,
 jmi_uxn_opcodes_h_l2821_c41_8f32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output,
 jsi_uxn_opcodes_h_l2822_c41_c636_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output,
 lit_uxn_opcodes_h_l2823_c41_cf7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_return_output,
 opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output,
 lit2_uxn_opcodes_h_l2824_c41_ee2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_return_output,
 opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_return_output,
 lit_uxn_opcodes_h_l2825_c41_384c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_return_output,
 lit2_uxn_opcodes_h_l2826_c41_5423_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output,
 opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_return_output,
 inc_uxn_opcodes_h_l2827_c41_62a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_return_output,
 opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output,
 inc2_uxn_opcodes_h_l2828_c41_13e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_return_output,
 pop_uxn_opcodes_h_l2829_c41_a8da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output,
 pop2_uxn_opcodes_h_l2830_c41_835f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output,
 nip_uxn_opcodes_h_l2831_c41_2170_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_return_output,
 nip2_uxn_opcodes_h_l2832_c41_632e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_return_output,
 opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output,
 swp_uxn_opcodes_h_l2833_c41_b5c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_return_output,
 swp2_uxn_opcodes_h_l2834_c41_2f2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_return_output,
 opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output,
 rot_uxn_opcodes_h_l2835_c41_c1c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_return_output,
 rot2_uxn_opcodes_h_l2836_c41_cd96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output,
 opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output,
 dup_uxn_opcodes_h_l2837_c41_6aaf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output,
 dup2_uxn_opcodes_h_l2838_c41_1cb4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output,
 ovr_uxn_opcodes_h_l2839_c41_f5f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output,
 ovr2_uxn_opcodes_h_l2840_c41_ae37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output,
 equ_uxn_opcodes_h_l2841_c41_2c29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_return_output,
 opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output,
 equ2_uxn_opcodes_h_l2842_c41_f401_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_return_output,
 neq_uxn_opcodes_h_l2843_c41_6261_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output,
 neq2_uxn_opcodes_h_l2844_c41_cbcb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_return_output,
 opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output,
 gth_uxn_opcodes_h_l2845_c41_8aa3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output,
 opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_return_output,
 gth2_uxn_opcodes_h_l2846_c41_8821_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output,
 opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output,
 lth_uxn_opcodes_h_l2847_c41_50ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output,
 lth2_uxn_opcodes_h_l2848_c41_c2e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_return_output,
 opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output,
 jmp_uxn_opcodes_h_l2849_c41_fbf4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output,
 opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_return_output,
 jmp2_uxn_opcodes_h_l2850_c41_63a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_return_output,
 opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output,
 jcn2_uxn_opcodes_h_l2852_c41_5028_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_return_output,
 opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output,
 jsr2_uxn_opcodes_h_l2854_c41_4918_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_return_output,
 opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_return_output,
 sth2_uxn_opcodes_h_l2856_c41_6507_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output,
 opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output,
 ldz_uxn_opcodes_h_l2857_c41_dd23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_return_output,
 opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output,
 ldz2_uxn_opcodes_h_l2858_c41_3c06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output,
 opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_return_output,
 opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output,
 lda_uxn_opcodes_h_l2865_c41_bdc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_return_output,
 opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_return_output,
 lda2_uxn_opcodes_h_l2866_c41_967b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_return_output,
 sta_uxn_opcodes_h_l2867_c41_a152_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output,
 opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output,
 sta2_uxn_opcodes_h_l2868_c41_f335_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_return_output,
 opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output,
 deo_uxn_opcodes_h_l2871_c41_bae1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_return_output,
 deo2_uxn_opcodes_h_l2872_c41_7ca8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output,
 add_uxn_opcodes_h_l2873_c41_c724_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output,
 add2_uxn_opcodes_h_l2874_c41_b4f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_return_output,
 opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output,
 sub_uxn_opcodes_h_l2875_c41_e520_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_return_output,
 sub2_uxn_opcodes_h_l2876_c41_9e98_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output,
 opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output,
 mul_uxn_opcodes_h_l2877_c41_77f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output,
 mul2_uxn_opcodes_h_l2878_c41_0c5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_return_output,
 div_uxn_opcodes_h_l2879_c41_9c4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_return_output,
 opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output,
 div2_uxn_opcodes_h_l2880_c41_4cf3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output,
 opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_return_output,
 and_uxn_opcodes_h_l2881_c41_c454_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output,
 and2_uxn_opcodes_h_l2882_c41_9569_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_return_output,
 opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output,
 ora_uxn_opcodes_h_l2883_c41_0ab5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_return_output,
 ora2_uxn_opcodes_h_l2884_c41_11b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_return_output,
 opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_return_output,
 eor_uxn_opcodes_h_l2885_c41_189f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_return_output,
 eor2_uxn_opcodes_h_l2886_c41_cd48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output,
 opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output,
 sft_uxn_opcodes_h_l2887_c41_1736_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_return_output,
 opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output,
 sft2_uxn_opcodes_h_l2888_c41_eabf_return_output,
 sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output,
 sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output,
 sp0_MUX_uxn_opcodes_h_l2892_c3_4939_return_output,
 sp1_MUX_uxn_opcodes_h_l2892_c3_4939_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_return_output,
 MUX_uxn_opcodes_h_l2901_c19_c2bb_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_return_output,
 stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_return_output,
 stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_return_output,
 stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_return_output,
 device_ram_update_uxn_opcodes_h_l2924_c26_7002_return_output,
 BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l2814_c2_3910 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2814_c10_6f1c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2814_c10_6f1c_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2814_c10_6f1c_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2814_c30_a0ca_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2814_c57_cdae_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2814_c57_7524_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2814_c57_7524_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2814_c10_6f1c_return_output : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2815_c18_fa40_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2815_c18_fa40_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2815_c18_fa40_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2815_c18_fa40_return_output : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2819_c2_dc0e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2820_c41_b66f_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2820_c41_b66f_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2820_c41_b66f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2820_c41_b66f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2820_c41_b66f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2820_c41_b66f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2822_c41_c636_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2822_c41_c636_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2822_c41_c636_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2822_c41_c636_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2822_c41_c636_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2825_c41_384c_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2825_c41_384c_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2825_c41_384c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2825_c41_384c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2825_c41_384c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2826_c41_5423_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2826_c41_5423_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2826_c41_5423_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2826_c41_5423_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2826_c41_5423_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2827_c41_62a8_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2827_c41_62a8_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2827_c41_62a8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2827_c41_62a8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2827_c41_62a8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2829_c41_a8da_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2829_c41_a8da_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2829_c41_a8da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2829_c41_a8da_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2830_c41_835f_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2830_c41_835f_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2830_c41_835f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2830_c41_835f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2831_c41_2170_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2831_c41_2170_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2831_c41_2170_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2831_c41_2170_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2831_c41_2170_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2832_c41_632e_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2832_c41_632e_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2832_c41_632e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2832_c41_632e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2832_c41_632e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2841_c41_2c29_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2841_c41_2c29_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2841_c41_2c29_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2841_c41_2c29_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2841_c41_2c29_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2842_c41_f401_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2842_c41_f401_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2842_c41_f401_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2842_c41_f401_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2842_c41_f401_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2843_c41_6261_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2843_c41_6261_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2843_c41_6261_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2843_c41_6261_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2843_c41_6261_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2846_c41_8821_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2846_c41_8821_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2846_c41_8821_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2846_c41_8821_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2846_c41_8821_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2847_c41_50ec_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2847_c41_50ec_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2847_c41_50ec_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2847_c41_50ec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2847_c41_50ec_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2851_c7_6d46_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2851_c28_bb93_uxn_opcodes_h_l2851_c28_bb93_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2851_c28_bb93_uxn_opcodes_h_l2851_c28_bb93_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2853_c7_1435_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2853_c28_04aa_uxn_opcodes_h_l2853_c28_04aa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2853_c28_04aa_uxn_opcodes_h_l2853_c28_04aa_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2855_c7_6700_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2855_c28_0288_uxn_opcodes_h_l2855_c28_0288_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2855_c28_0288_uxn_opcodes_h_l2855_c28_0288_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2856_c41_6507_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2856_c41_6507_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2856_c41_6507_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2856_c41_6507_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2856_c41_6507_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2859_c7_c768_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2859_c28_76fe_uxn_opcodes_h_l2859_c28_76fe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2859_c28_76fe_uxn_opcodes_h_l2859_c28_76fe_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2860_c7_d43c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2860_c28_ab52_uxn_opcodes_h_l2860_c28_ab52_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2860_c28_ab52_uxn_opcodes_h_l2860_c28_ab52_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2861_c7_60c2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2861_c28_9d7f_uxn_opcodes_h_l2861_c28_9d7f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2861_c28_9d7f_uxn_opcodes_h_l2861_c28_9d7f_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2862_c7_5cdf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2862_c28_eb8a_uxn_opcodes_h_l2862_c28_eb8a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2862_c28_eb8a_uxn_opcodes_h_l2862_c28_eb8a_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2863_c7_ef0d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2863_c28_8ea1_uxn_opcodes_h_l2863_c28_8ea1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2863_c28_8ea1_uxn_opcodes_h_l2863_c28_8ea1_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2864_c7_ad9f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2864_c28_3f4e_uxn_opcodes_h_l2864_c28_3f4e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2864_c28_3f4e_uxn_opcodes_h_l2864_c28_3f4e_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2866_c41_967b_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2866_c41_967b_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2866_c41_967b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2866_c41_967b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2866_c41_967b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2866_c41_967b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2867_c41_a152_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2867_c41_a152_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2867_c41_a152_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2867_c41_a152_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2867_c41_a152_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2868_c41_f335_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2868_c41_f335_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2868_c41_f335_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2868_c41_f335_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2868_c41_f335_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2869_c7_cdac_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2869_c28_a342_uxn_opcodes_h_l2869_c28_a342_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2869_c28_a342_uxn_opcodes_h_l2869_c28_a342_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2870_c7_32c7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2870_c28_16e1_uxn_opcodes_h_l2870_c28_16e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2870_c28_16e1_uxn_opcodes_h_l2870_c28_16e1_arg0 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2871_c41_bae1_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2871_c41_bae1_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2871_c41_bae1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2871_c41_bae1_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2871_c41_bae1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2871_c41_bae1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2873_c41_c724_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2873_c41_c724_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2873_c41_c724_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2873_c41_c724_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2873_c41_c724_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2875_c41_e520_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2875_c41_e520_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2875_c41_e520_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2875_c41_e520_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2875_c41_e520_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2877_c41_77f1_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2877_c41_77f1_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2877_c41_77f1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2877_c41_77f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2877_c41_77f1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2879_c41_9c4a_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2879_c41_9c4a_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2879_c41_9c4a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2879_c41_9c4a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2879_c41_9c4a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2881_c41_c454_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2881_c41_c454_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2881_c41_c454_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2881_c41_c454_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2881_c41_c454_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2882_c41_9569_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2882_c41_9569_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2882_c41_9569_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2882_c41_9569_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2882_c41_9569_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2885_c41_189f_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2885_c41_189f_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2885_c41_189f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2885_c41_189f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2885_c41_189f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2887_c41_1736_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2887_c41_1736_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2887_c41_1736_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2887_c41_1736_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2887_c41_1736_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l2889_c9_3026_uxn_opcodes_h_l2889_c9_3026_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2889_c9_3026_uxn_opcodes_h_l2889_c9_3026_arg0 : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2891_c6_0eed_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2892_c3_4939_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2892_c3_4939_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2892_c3_4939_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2892_c3_4939_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2895_c4_e042 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2892_c3_4939_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2892_c3_4939_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2893_c4_ca7e : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2892_c3_4939_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2892_c3_4939_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_return_output : signed(9 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2899_c18_7f2e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2900_c19_a27b_return_output : unsigned(0 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2901_c2_0ffe : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2901_c19_c2bb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2901_c19_c2bb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2901_c19_c2bb_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2901_c19_c2bb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_left : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2901_c82_ba7d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2902_c22_9bc7_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_iffalse : unsigned(0 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_iftrue : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l2905_c3_bd4b : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_iffalse : unsigned(7 downto 0);
 variable VAR_stack_read_value_uxn_opcodes_h_l2914_c3_2cd6 : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_return_output : unsigned(7 downto 0);
 variable VAR_stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_cond : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_address0 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_write0_value : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_address1 : unsigned(7 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_return_output : unsigned(15 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_address0 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_write0_value : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_write0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_read0_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_address1 : unsigned(7 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_read1_enable : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_return_output : unsigned(15 downto 0);
 variable VAR_device_ram_read_value_uxn_opcodes_h_l2924_c2_4f48 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_address0 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_write0_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_write0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_read0_enable : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_address1 : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_read1_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2926_c3_eafa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2927_c3_5104_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2930_c3_0c79_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2933_c34_a26e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2934_c23_41f8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2935_c32_485a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2936_c33_1335_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2937_c29_6da3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2938_c30_7835_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2939_c34_aec6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2940_c33_7bd4_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2941_c31_de86_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2942_c32_8123_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2904_l2892_l2901_DUPLICATE_4df2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2893_l2895_DUPLICATE_c2c3_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2929_l2925_DUPLICATE_4da1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2944_l2797_DUPLICATE_0266_return_output : eval_opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_sp0 : unsigned(7 downto 0);
variable REG_VAR_sp1 : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(11 downto 0);
variable REG_VAR_stack_index : unsigned(0 downto 0);
variable REG_VAR_is_stack_read : unsigned(0 downto 0);
variable REG_VAR_is_stack_write : unsigned(0 downto 0);
variable REG_VAR_stack_address : unsigned(15 downto 0);
variable REG_VAR_stack_write_value : unsigned(7 downto 0);
variable REG_VAR_stack_read_value : unsigned(7 downto 0);
variable REG_VAR_device_ram_read_value : unsigned(7 downto 0);
variable REG_VAR_opc_result : opcode_result_t;
variable REG_VAR_opc_eval_result : eval_opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_sp0 := sp0;
  REG_VAR_sp1 := sp1;
  REG_VAR_opc := opc;
  REG_VAR_stack_index := stack_index;
  REG_VAR_is_stack_read := is_stack_read;
  REG_VAR_is_stack_write := is_stack_write;
  REG_VAR_stack_address := stack_address;
  REG_VAR_stack_write_value := stack_write_value;
  REG_VAR_stack_read_value := stack_read_value;
  REG_VAR_device_ram_read_value := device_ram_read_value;
  REG_VAR_opc_result := opc_result;
  REG_VAR_opc_eval_result := opc_eval_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_right := to_unsigned(42, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_right := to_unsigned(53, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_right := to_unsigned(59, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_iftrue := to_unsigned(0, 1);
     VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_read0_enable := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_right := to_unsigned(36, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_right := to_unsigned(47, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_right := to_unsigned(30, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_right := to_unsigned(31, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_right := to_unsigned(12, 4);
     VAR_MUX_uxn_opcodes_h_l2815_c18_fa40_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_right := to_unsigned(46, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_right := to_unsigned(29, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_right := to_unsigned(62, 6);
     VAR_MUX_uxn_opcodes_h_l2815_c18_fa40_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_right := to_unsigned(63, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_right := to_unsigned(1024, 11);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_right := to_unsigned(40, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_right := to_unsigned(48, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_right := to_unsigned(21, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_right := to_unsigned(38, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_right := to_unsigned(1536, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_right := to_unsigned(39, 6);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_iftrue := to_unsigned(0, 1);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_read0_enable := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_right := to_unsigned(3584, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_right := to_unsigned(61, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_right := to_unsigned(18, 5);
     VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_read0_enable := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_right := to_unsigned(20, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_right := to_unsigned(24, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_right := to_unsigned(37, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_right := to_unsigned(44, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_right := to_unsigned(2560, 12);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_right := to_unsigned(9, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_right := to_unsigned(51, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_right := to_unsigned(45, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_right := to_unsigned(43, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_right := to_unsigned(50, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_right := to_unsigned(60, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_right := to_unsigned(23, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_right := to_unsigned(19, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_right := to_unsigned(54, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_right := to_unsigned(2048, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_right := to_unsigned(512, 10);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_right := to_unsigned(3072, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_right := to_unsigned(10, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_right := to_unsigned(41, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_right := to_unsigned(35, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_iffalse := to_unsigned(0, 1);

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

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_iffalse := VAR_CLOCK_ENABLE;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l2871_c41_bae1_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2873_c41_c724_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2882_c41_9569_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2881_c41_c454_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2871_c41_bae1_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2879_c41_9c4a_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2885_c41_189f_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2842_c41_f401_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2841_c41_2c29_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2846_c41_8821_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2827_c41_62a8_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2866_c41_967b_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2847_c41_50ec_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2877_c41_77f1_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2843_c41_6261_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2832_c41_632e_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2831_c41_2170_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2830_c41_835f_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2829_c41_a8da_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2887_c41_1736_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2868_c41_f335_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2867_c41_a152_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2856_c41_6507_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2875_c41_e520_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2820_c41_b66f_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2822_c41_c636_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2826_c41_5423_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2825_c41_384c_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2873_c41_c724_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2882_c41_9569_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2881_c41_c454_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2871_c41_bae1_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2879_c41_9c4a_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2885_c41_189f_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2842_c41_f401_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2841_c41_2c29_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2846_c41_8821_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2827_c41_62a8_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2820_c41_b66f_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2822_c41_c636_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2866_c41_967b_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2826_c41_5423_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2825_c41_384c_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2847_c41_50ec_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2877_c41_77f1_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2843_c41_6261_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2832_c41_632e_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2831_c41_2170_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2830_c41_835f_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2829_c41_a8da_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2887_c41_1736_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2868_c41_f335_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2867_c41_a152_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2856_c41_6507_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2875_c41_e520_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2820_c41_b66f_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2822_c41_c636_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2866_c41_967b_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2826_c41_5423_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2825_c41_384c_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2892_c3_4939_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2892_c3_4939_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l2873_c41_c724_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l2882_c41_9569_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l2881_c41_c454_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l2871_c41_bae1_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l2879_c41_9c4a_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l2885_c41_189f_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l2842_c41_f401_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l2841_c41_2c29_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l2846_c41_8821_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l2827_c41_62a8_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l2820_c41_b66f_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l2866_c41_967b_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l2847_c41_50ec_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l2877_c41_77f1_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l2843_c41_6261_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l2832_c41_632e_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l2831_c41_2170_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l2887_c41_1736_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l2868_c41_f335_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l2867_c41_a152_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l2856_c41_6507_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l2875_c41_e520_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_previous_stack_read := stack_read_value;
     -- BIN_OP_AND[uxn_opcodes_h_l2814_c41_6b5b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_left;
     BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_return_output := BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2855_c7_6700] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2855_c7_6700_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2862_c7_5cdf] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2862_c7_5cdf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2861_c7_60c2] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2861_c7_60c2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2863_c7_ef0d] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2863_c7_ef0d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2859_c7_c768] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2859_c7_c768_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2869_c7_cdac] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2869_c7_cdac_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2819_c2_dc0e] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2819_c2_dc0e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l2814_c10_e5d1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_left;
     BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_return_output := BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2815_c18_d63c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_left;
     BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_return_output := BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2860_c7_d43c] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2860_c7_d43c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2814_c57_cdae] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2814_c57_cdae_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2864_c7_ad9f] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2864_c7_ad9f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2870_c7_32c7] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2870_c7_32c7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2851_c7_6d46] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2851_c7_6d46_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2853_c7_1435] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2853_c7_1435_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c10_e5d1_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2815_c18_d63c_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l2814_c57_7524_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2814_c57_cdae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2819_c2_dc0e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2851_c7_6d46_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2853_c7_1435_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2855_c7_6700_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2859_c7_c768_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2860_c7_d43c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2861_c7_60c2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2862_c7_5cdf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2863_c7_ef0d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2864_c7_ad9f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2869_c7_cdac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2870_c7_32c7_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2814_c10_c488] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_left;
     BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_return_output := BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2814_c30_a0ca] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2814_c30_a0ca_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l2814_c41_6b5b_return_output);

     -- CONST_SL_4[uxn_opcodes_h_l2814_c57_7524] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l2814_c57_7524_x <= VAR_CONST_SL_4_uxn_opcodes_h_l2814_c57_7524_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l2814_c57_7524_return_output := CONST_SL_4_uxn_opcodes_h_l2814_c57_7524_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2815_c18_a58f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_left;
     BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_return_output := BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2814_c10_6f1c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2814_c10_c488_return_output;
     VAR_MUX_uxn_opcodes_h_l2815_c18_fa40_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2815_c18_a58f_return_output;
     VAR_MUX_uxn_opcodes_h_l2814_c10_6f1c_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2814_c30_a0ca_return_output;
     VAR_MUX_uxn_opcodes_h_l2814_c10_6f1c_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l2814_c57_7524_return_output;
     -- MUX[uxn_opcodes_h_l2815_c18_fa40] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2815_c18_fa40_cond <= VAR_MUX_uxn_opcodes_h_l2815_c18_fa40_cond;
     MUX_uxn_opcodes_h_l2815_c18_fa40_iftrue <= VAR_MUX_uxn_opcodes_h_l2815_c18_fa40_iftrue;
     MUX_uxn_opcodes_h_l2815_c18_fa40_iffalse <= VAR_MUX_uxn_opcodes_h_l2815_c18_fa40_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2815_c18_fa40_return_output := MUX_uxn_opcodes_h_l2815_c18_fa40_return_output;

     -- MUX[uxn_opcodes_h_l2814_c10_6f1c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2814_c10_6f1c_cond <= VAR_MUX_uxn_opcodes_h_l2814_c10_6f1c_cond;
     MUX_uxn_opcodes_h_l2814_c10_6f1c_iftrue <= VAR_MUX_uxn_opcodes_h_l2814_c10_6f1c_iftrue;
     MUX_uxn_opcodes_h_l2814_c10_6f1c_iffalse <= VAR_MUX_uxn_opcodes_h_l2814_c10_6f1c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2814_c10_6f1c_return_output := MUX_uxn_opcodes_h_l2814_c10_6f1c_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l2814_c2_3910 := VAR_MUX_uxn_opcodes_h_l2814_c10_6f1c_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_left := VAR_MUX_uxn_opcodes_h_l2815_c18_fa40_return_output;
     REG_VAR_stack_index := VAR_MUX_uxn_opcodes_h_l2815_c18_fa40_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_left := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l2814_c2_3910;
     VAR_printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg1 := resize(VAR_opc_uxn_opcodes_h_l2814_c2_3910, 32);
     VAR_printf_uxn_opcodes_h_l2851_c28_bb93_uxn_opcodes_h_l2851_c28_bb93_arg0 := resize(VAR_opc_uxn_opcodes_h_l2814_c2_3910, 32);
     VAR_printf_uxn_opcodes_h_l2853_c28_04aa_uxn_opcodes_h_l2853_c28_04aa_arg0 := resize(VAR_opc_uxn_opcodes_h_l2814_c2_3910, 32);
     VAR_printf_uxn_opcodes_h_l2855_c28_0288_uxn_opcodes_h_l2855_c28_0288_arg0 := resize(VAR_opc_uxn_opcodes_h_l2814_c2_3910, 32);
     VAR_printf_uxn_opcodes_h_l2859_c28_76fe_uxn_opcodes_h_l2859_c28_76fe_arg0 := resize(VAR_opc_uxn_opcodes_h_l2814_c2_3910, 32);
     VAR_printf_uxn_opcodes_h_l2860_c28_ab52_uxn_opcodes_h_l2860_c28_ab52_arg0 := resize(VAR_opc_uxn_opcodes_h_l2814_c2_3910, 32);
     VAR_printf_uxn_opcodes_h_l2861_c28_9d7f_uxn_opcodes_h_l2861_c28_9d7f_arg0 := resize(VAR_opc_uxn_opcodes_h_l2814_c2_3910, 32);
     VAR_printf_uxn_opcodes_h_l2862_c28_eb8a_uxn_opcodes_h_l2862_c28_eb8a_arg0 := resize(VAR_opc_uxn_opcodes_h_l2814_c2_3910, 32);
     VAR_printf_uxn_opcodes_h_l2863_c28_8ea1_uxn_opcodes_h_l2863_c28_8ea1_arg0 := resize(VAR_opc_uxn_opcodes_h_l2814_c2_3910, 32);
     VAR_printf_uxn_opcodes_h_l2864_c28_3f4e_uxn_opcodes_h_l2864_c28_3f4e_arg0 := resize(VAR_opc_uxn_opcodes_h_l2814_c2_3910, 32);
     VAR_printf_uxn_opcodes_h_l2869_c28_a342_uxn_opcodes_h_l2869_c28_a342_arg0 := resize(VAR_opc_uxn_opcodes_h_l2814_c2_3910, 32);
     VAR_printf_uxn_opcodes_h_l2870_c28_16e1_uxn_opcodes_h_l2870_c28_16e1_arg0 := resize(VAR_opc_uxn_opcodes_h_l2814_c2_3910, 32);
     VAR_printf_uxn_opcodes_h_l2889_c9_3026_uxn_opcodes_h_l2889_c9_3026_arg0 := resize(VAR_opc_uxn_opcodes_h_l2814_c2_3910, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l2860_c11_566e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2825_c11_8564] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_left;
     BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_return_output := BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2838_c11_99f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2871_c11_c973] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_left;
     BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_return_output := BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_8f0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2836_c11_e2bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_a304] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2819_c6_871d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2845_c11_86f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_6b76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_left;
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_return_output := BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2887_c11_2298] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_left;
     BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_return_output := BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2837_c11_0f34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_left;
     BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_return_output := BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2827_c11_cf72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_left;
     BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_return_output := BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2828_c11_698a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2832_c11_f603] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_left;
     BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_return_output := BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2888_c11_4db0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2870_c11_e63b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_97d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2839_c11_5bb1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2862_c11_5863] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_left;
     BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_return_output := BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_return_output;

     -- printf_uxn_opcodes_h_l2817_c2_0556[uxn_opcodes_h_l2817_c2_0556] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg0 <= VAR_printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg0;
     printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg1 <= VAR_printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg1;
     printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg2 <= VAR_printf_uxn_opcodes_h_l2817_c2_0556_uxn_opcodes_h_l2817_c2_0556_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l2851_c11_4380] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_left;
     BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_return_output := BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2824_c11_6598] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_left;
     BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_return_output := BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2849_c11_0f8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2822_c11_391c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2866_c11_e832] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_left;
     BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_return_output := BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2830_c11_0fa7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2854_c11_2ee7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2820_c11_e0ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_d02d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_f865] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2846_c11_3fe7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2850_c11_6234] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_left;
     BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_return_output := BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_5a66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_left;
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_return_output := BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2852_c11_54ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2856_c11_8a62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_left;
     BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_return_output := BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2826_c11_80ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2859_c11_c029] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_left;
     BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_return_output := BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2833_c11_a1e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2834_c11_645e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2843_c11_0b7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2868_c11_a801] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_left;
     BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_return_output := BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2831_c11_7389] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_left;
     BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_return_output := BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_152b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2865_c11_95b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2835_c11_8ffd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_5716] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_6581] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2829_c11_9d98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_left;
     BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_return_output := BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2855_c11_19ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2844_c11_6d42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_left;
     BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_return_output := BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_c550] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2857_c11_3a3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2872_c11_6b4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2853_c11_da3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2858_c11_c6b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2841_c11_5460] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_left;
     BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_return_output := BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2823_c11_0e06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_left;
     BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_return_output := BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_7a71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2864_c11_2117] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_left;
     BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_return_output := BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2840_c11_f537] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_left;
     BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_return_output := BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_cb86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2847_c11_2f79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_left;
     BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_return_output := BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2863_c11_fb93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_left;
     BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_return_output := BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_7892] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_left;
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_return_output := BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2842_c11_cb95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_left;
     BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_return_output := BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2869_c11_7e60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_left;
     BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_return_output := BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2821_c11_1497] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_left;
     BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_return_output := BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2861_c11_bcfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2867_c11_4148] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_left;
     BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_return_output := BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2848_c11_49c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c6_871d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_e0ce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_1497_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_391c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_0e06_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_6598_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_8564_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_80ca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_cf72_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_698a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_9d98_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_0fa7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_7389_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f603_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_a1e7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_645e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_8ffd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_e2bb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_0f34_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_99f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_5bb1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_f537_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_5460_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_cb95_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_0b7e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_6d42_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_86f9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_3fe7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_2f79_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_49c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_0f8a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_6234_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_4380_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_54ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_da3f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_2ee7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_19ce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_8a62_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_3a3c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_c6b9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_c029_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_566e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_bcfe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_5863_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_fb93_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_2117_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_95b0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_e832_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_4148_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a801_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7e60_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_e63b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_c973_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_6b4d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_5a66_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_8f0b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_6581_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_5716_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_d02d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_f865_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_c550_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_6b76_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_cb86_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a304_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_7892_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_7a71_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_152b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_97d8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2887_c11_2298_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2888_c11_4db0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2820_c7_6e17] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2821_c7_8a90] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2820_c1_a46f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output;
     VAR_jci_uxn_opcodes_h_l2820_c41_b66f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_a46f_return_output;
     -- jci[uxn_opcodes_h_l2820_c41_b66f] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2820_c41_b66f_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2820_c41_b66f_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2820_c41_b66f_phase <= VAR_jci_uxn_opcodes_h_l2820_c41_b66f_phase;
     jci_uxn_opcodes_h_l2820_c41_b66f_pc <= VAR_jci_uxn_opcodes_h_l2820_c41_b66f_pc;
     jci_uxn_opcodes_h_l2820_c41_b66f_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2820_c41_b66f_previous_stack_read;
     jci_uxn_opcodes_h_l2820_c41_b66f_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2820_c41_b66f_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2820_c41_b66f_return_output := jci_uxn_opcodes_h_l2820_c41_b66f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2821_c1_97ef] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2822_c7_1ee4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output;
     VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_97ef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_iftrue := VAR_jci_uxn_opcodes_h_l2820_c41_b66f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2823_c7_83e4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2822_c1_7ede] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_return_output;

     -- jmi[uxn_opcodes_h_l2821_c41_8f32] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2821_c41_8f32_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2821_c41_8f32_phase <= VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_phase;
     jmi_uxn_opcodes_h_l2821_c41_8f32_pc <= VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_pc;
     jmi_uxn_opcodes_h_l2821_c41_8f32_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_return_output := jmi_uxn_opcodes_h_l2821_c41_8f32_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output;
     VAR_jsi_uxn_opcodes_h_l2822_c41_c636_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_7ede_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_iftrue := VAR_jmi_uxn_opcodes_h_l2821_c41_8f32_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2824_c7_bc2c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2823_c1_4849] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_return_output;

     -- jsi[uxn_opcodes_h_l2822_c41_c636] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2822_c41_c636_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2822_c41_c636_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2822_c41_c636_phase <= VAR_jsi_uxn_opcodes_h_l2822_c41_c636_phase;
     jsi_uxn_opcodes_h_l2822_c41_c636_pc <= VAR_jsi_uxn_opcodes_h_l2822_c41_c636_pc;
     jsi_uxn_opcodes_h_l2822_c41_c636_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2822_c41_c636_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2822_c41_c636_return_output := jsi_uxn_opcodes_h_l2822_c41_c636_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output;
     VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_4849_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_iftrue := VAR_jsi_uxn_opcodes_h_l2822_c41_c636_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2825_c7_1268] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_return_output;

     -- lit[uxn_opcodes_h_l2823_c41_cf7a] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2823_c41_cf7a_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2823_c41_cf7a_phase <= VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_phase;
     lit_uxn_opcodes_h_l2823_c41_cf7a_pc <= VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_pc;
     lit_uxn_opcodes_h_l2823_c41_cf7a_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_return_output := lit_uxn_opcodes_h_l2823_c41_cf7a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2824_c1_f153] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_1268_return_output;
     VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_f153_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_iftrue := VAR_lit_uxn_opcodes_h_l2823_c41_cf7a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2825_c1_1f64] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_return_output;

     -- lit2[uxn_opcodes_h_l2824_c41_ee2d] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2824_c41_ee2d_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2824_c41_ee2d_phase <= VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_phase;
     lit2_uxn_opcodes_h_l2824_c41_ee2d_pc <= VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_pc;
     lit2_uxn_opcodes_h_l2824_c41_ee2d_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_return_output := lit2_uxn_opcodes_h_l2824_c41_ee2d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2826_c7_b031] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_b031_return_output;
     VAR_lit_uxn_opcodes_h_l2825_c41_384c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_1f64_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_iftrue := VAR_lit2_uxn_opcodes_h_l2824_c41_ee2d_return_output;
     -- lit[uxn_opcodes_h_l2825_c41_384c] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2825_c41_384c_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2825_c41_384c_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2825_c41_384c_phase <= VAR_lit_uxn_opcodes_h_l2825_c41_384c_phase;
     lit_uxn_opcodes_h_l2825_c41_384c_pc <= VAR_lit_uxn_opcodes_h_l2825_c41_384c_pc;
     lit_uxn_opcodes_h_l2825_c41_384c_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2825_c41_384c_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2825_c41_384c_return_output := lit_uxn_opcodes_h_l2825_c41_384c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2826_c1_f7c4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2827_c7_837e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_837e_return_output;
     VAR_lit2_uxn_opcodes_h_l2826_c41_5423_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_f7c4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_iftrue := VAR_lit_uxn_opcodes_h_l2825_c41_384c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2828_c7_9e38] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output;

     -- lit2[uxn_opcodes_h_l2826_c41_5423] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2826_c41_5423_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2826_c41_5423_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2826_c41_5423_phase <= VAR_lit2_uxn_opcodes_h_l2826_c41_5423_phase;
     lit2_uxn_opcodes_h_l2826_c41_5423_pc <= VAR_lit2_uxn_opcodes_h_l2826_c41_5423_pc;
     lit2_uxn_opcodes_h_l2826_c41_5423_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2826_c41_5423_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2826_c41_5423_return_output := lit2_uxn_opcodes_h_l2826_c41_5423_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2827_c1_782a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output;
     VAR_inc_uxn_opcodes_h_l2827_c41_62a8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_782a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_iftrue := VAR_lit2_uxn_opcodes_h_l2826_c41_5423_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2829_c7_2877] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_return_output;

     -- inc[uxn_opcodes_h_l2827_c41_62a8] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2827_c41_62a8_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2827_c41_62a8_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2827_c41_62a8_phase <= VAR_inc_uxn_opcodes_h_l2827_c41_62a8_phase;
     inc_uxn_opcodes_h_l2827_c41_62a8_ins <= VAR_inc_uxn_opcodes_h_l2827_c41_62a8_ins;
     inc_uxn_opcodes_h_l2827_c41_62a8_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2827_c41_62a8_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2827_c41_62a8_return_output := inc_uxn_opcodes_h_l2827_c41_62a8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2828_c1_3130] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_2877_return_output;
     VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_3130_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_iftrue := VAR_inc_uxn_opcodes_h_l2827_c41_62a8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2830_c7_d1a1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output;

     -- inc2[uxn_opcodes_h_l2828_c41_13e7] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2828_c41_13e7_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2828_c41_13e7_phase <= VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_phase;
     inc2_uxn_opcodes_h_l2828_c41_13e7_ins <= VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_ins;
     inc2_uxn_opcodes_h_l2828_c41_13e7_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_return_output := inc2_uxn_opcodes_h_l2828_c41_13e7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2829_c1_0bd4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output;
     VAR_pop_uxn_opcodes_h_l2829_c41_a8da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_0bd4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_iftrue := VAR_inc2_uxn_opcodes_h_l2828_c41_13e7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2831_c7_d8a8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output;

     -- pop[uxn_opcodes_h_l2829_c41_a8da] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2829_c41_a8da_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2829_c41_a8da_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2829_c41_a8da_phase <= VAR_pop_uxn_opcodes_h_l2829_c41_a8da_phase;
     pop_uxn_opcodes_h_l2829_c41_a8da_ins <= VAR_pop_uxn_opcodes_h_l2829_c41_a8da_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2829_c41_a8da_return_output := pop_uxn_opcodes_h_l2829_c41_a8da_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2830_c1_e24c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output;
     VAR_pop2_uxn_opcodes_h_l2830_c41_835f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_e24c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_iftrue := VAR_pop_uxn_opcodes_h_l2829_c41_a8da_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2832_c7_664c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2831_c1_f870] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_return_output;

     -- pop2[uxn_opcodes_h_l2830_c41_835f] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2830_c41_835f_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2830_c41_835f_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2830_c41_835f_phase <= VAR_pop2_uxn_opcodes_h_l2830_c41_835f_phase;
     pop2_uxn_opcodes_h_l2830_c41_835f_ins <= VAR_pop2_uxn_opcodes_h_l2830_c41_835f_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2830_c41_835f_return_output := pop2_uxn_opcodes_h_l2830_c41_835f_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_664c_return_output;
     VAR_nip_uxn_opcodes_h_l2831_c41_2170_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_f870_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_iftrue := VAR_pop2_uxn_opcodes_h_l2830_c41_835f_return_output;
     -- nip[uxn_opcodes_h_l2831_c41_2170] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2831_c41_2170_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2831_c41_2170_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2831_c41_2170_phase <= VAR_nip_uxn_opcodes_h_l2831_c41_2170_phase;
     nip_uxn_opcodes_h_l2831_c41_2170_ins <= VAR_nip_uxn_opcodes_h_l2831_c41_2170_ins;
     nip_uxn_opcodes_h_l2831_c41_2170_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2831_c41_2170_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2831_c41_2170_return_output := nip_uxn_opcodes_h_l2831_c41_2170_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2832_c1_b701] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2833_c7_c12d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output;
     VAR_nip2_uxn_opcodes_h_l2832_c41_632e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b701_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_iftrue := VAR_nip_uxn_opcodes_h_l2831_c41_2170_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2834_c7_caee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_return_output;

     -- nip2[uxn_opcodes_h_l2832_c41_632e] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2832_c41_632e_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2832_c41_632e_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2832_c41_632e_phase <= VAR_nip2_uxn_opcodes_h_l2832_c41_632e_phase;
     nip2_uxn_opcodes_h_l2832_c41_632e_ins <= VAR_nip2_uxn_opcodes_h_l2832_c41_632e_ins;
     nip2_uxn_opcodes_h_l2832_c41_632e_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2832_c41_632e_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2832_c41_632e_return_output := nip2_uxn_opcodes_h_l2832_c41_632e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2833_c1_9cba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_caee_return_output;
     VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_9cba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_iftrue := VAR_nip2_uxn_opcodes_h_l2832_c41_632e_return_output;
     -- swp[uxn_opcodes_h_l2833_c41_b5c6] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2833_c41_b5c6_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2833_c41_b5c6_phase <= VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_phase;
     swp_uxn_opcodes_h_l2833_c41_b5c6_ins <= VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_ins;
     swp_uxn_opcodes_h_l2833_c41_b5c6_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_return_output := swp_uxn_opcodes_h_l2833_c41_b5c6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2835_c7_c5d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2834_c1_0a68] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output;
     VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_0a68_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_iftrue := VAR_swp_uxn_opcodes_h_l2833_c41_b5c6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2836_c7_8556] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2835_c1_f65d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_return_output;

     -- swp2[uxn_opcodes_h_l2834_c41_2f2a] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2834_c41_2f2a_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2834_c41_2f2a_phase <= VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_phase;
     swp2_uxn_opcodes_h_l2834_c41_2f2a_ins <= VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_ins;
     swp2_uxn_opcodes_h_l2834_c41_2f2a_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_return_output := swp2_uxn_opcodes_h_l2834_c41_2f2a_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_8556_return_output;
     VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_f65d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_iftrue := VAR_swp2_uxn_opcodes_h_l2834_c41_2f2a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2836_c1_4f05] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_return_output;

     -- rot[uxn_opcodes_h_l2835_c41_c1c5] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2835_c41_c1c5_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2835_c41_c1c5_phase <= VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_phase;
     rot_uxn_opcodes_h_l2835_c41_c1c5_ins <= VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_ins;
     rot_uxn_opcodes_h_l2835_c41_c1c5_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_return_output := rot_uxn_opcodes_h_l2835_c41_c1c5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2837_c7_33f6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output;
     VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_4f05_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_iftrue := VAR_rot_uxn_opcodes_h_l2835_c41_c1c5_return_output;
     -- rot2[uxn_opcodes_h_l2836_c41_cd96] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2836_c41_cd96_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2836_c41_cd96_phase <= VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_phase;
     rot2_uxn_opcodes_h_l2836_c41_cd96_ins <= VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_ins;
     rot2_uxn_opcodes_h_l2836_c41_cd96_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_return_output := rot2_uxn_opcodes_h_l2836_c41_cd96_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2838_c7_fb52] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2837_c1_8b0c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output;
     VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_8b0c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_iftrue := VAR_rot2_uxn_opcodes_h_l2836_c41_cd96_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2839_c7_0a9e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2838_c1_d077] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_return_output;

     -- dup[uxn_opcodes_h_l2837_c41_6aaf] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2837_c41_6aaf_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2837_c41_6aaf_phase <= VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_phase;
     dup_uxn_opcodes_h_l2837_c41_6aaf_ins <= VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_ins;
     dup_uxn_opcodes_h_l2837_c41_6aaf_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_return_output := dup_uxn_opcodes_h_l2837_c41_6aaf_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output;
     VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_d077_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_iftrue := VAR_dup_uxn_opcodes_h_l2837_c41_6aaf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2840_c7_6e5b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2839_c1_b8f8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_return_output;

     -- dup2[uxn_opcodes_h_l2838_c41_1cb4] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2838_c41_1cb4_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2838_c41_1cb4_phase <= VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_phase;
     dup2_uxn_opcodes_h_l2838_c41_1cb4_ins <= VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_ins;
     dup2_uxn_opcodes_h_l2838_c41_1cb4_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_return_output := dup2_uxn_opcodes_h_l2838_c41_1cb4_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output;
     VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_b8f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_iftrue := VAR_dup2_uxn_opcodes_h_l2838_c41_1cb4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2840_c1_f606] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2841_c7_d3e4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output;

     -- ovr[uxn_opcodes_h_l2839_c41_f5f0] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2839_c41_f5f0_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2839_c41_f5f0_phase <= VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_phase;
     ovr_uxn_opcodes_h_l2839_c41_f5f0_ins <= VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_ins;
     ovr_uxn_opcodes_h_l2839_c41_f5f0_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_return_output := ovr_uxn_opcodes_h_l2839_c41_f5f0_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output;
     VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_f606_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_iftrue := VAR_ovr_uxn_opcodes_h_l2839_c41_f5f0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2841_c1_add8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2842_c7_aff1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output;

     -- ovr2[uxn_opcodes_h_l2840_c41_ae37] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2840_c41_ae37_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2840_c41_ae37_phase <= VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_phase;
     ovr2_uxn_opcodes_h_l2840_c41_ae37_ins <= VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_ins;
     ovr2_uxn_opcodes_h_l2840_c41_ae37_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_return_output := ovr2_uxn_opcodes_h_l2840_c41_ae37_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output;
     VAR_equ_uxn_opcodes_h_l2841_c41_2c29_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_add8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_iftrue := VAR_ovr2_uxn_opcodes_h_l2840_c41_ae37_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2842_c1_115f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2843_c7_4152] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_return_output;

     -- equ[uxn_opcodes_h_l2841_c41_2c29] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2841_c41_2c29_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2841_c41_2c29_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2841_c41_2c29_phase <= VAR_equ_uxn_opcodes_h_l2841_c41_2c29_phase;
     equ_uxn_opcodes_h_l2841_c41_2c29_ins <= VAR_equ_uxn_opcodes_h_l2841_c41_2c29_ins;
     equ_uxn_opcodes_h_l2841_c41_2c29_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2841_c41_2c29_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2841_c41_2c29_return_output := equ_uxn_opcodes_h_l2841_c41_2c29_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_4152_return_output;
     VAR_equ2_uxn_opcodes_h_l2842_c41_f401_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_115f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_iftrue := VAR_equ_uxn_opcodes_h_l2841_c41_2c29_return_output;
     -- equ2[uxn_opcodes_h_l2842_c41_f401] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2842_c41_f401_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2842_c41_f401_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2842_c41_f401_phase <= VAR_equ2_uxn_opcodes_h_l2842_c41_f401_phase;
     equ2_uxn_opcodes_h_l2842_c41_f401_ins <= VAR_equ2_uxn_opcodes_h_l2842_c41_f401_ins;
     equ2_uxn_opcodes_h_l2842_c41_f401_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2842_c41_f401_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2842_c41_f401_return_output := equ2_uxn_opcodes_h_l2842_c41_f401_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2844_c7_c09e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2843_c1_85c7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output;
     VAR_neq_uxn_opcodes_h_l2843_c41_6261_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_85c7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_iftrue := VAR_equ2_uxn_opcodes_h_l2842_c41_f401_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2844_c1_ac6d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_return_output;

     -- neq[uxn_opcodes_h_l2843_c41_6261] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2843_c41_6261_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2843_c41_6261_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2843_c41_6261_phase <= VAR_neq_uxn_opcodes_h_l2843_c41_6261_phase;
     neq_uxn_opcodes_h_l2843_c41_6261_ins <= VAR_neq_uxn_opcodes_h_l2843_c41_6261_ins;
     neq_uxn_opcodes_h_l2843_c41_6261_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2843_c41_6261_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2843_c41_6261_return_output := neq_uxn_opcodes_h_l2843_c41_6261_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2845_c7_19f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output;
     VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_ac6d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_iftrue := VAR_neq_uxn_opcodes_h_l2843_c41_6261_return_output;
     -- neq2[uxn_opcodes_h_l2844_c41_cbcb] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2844_c41_cbcb_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2844_c41_cbcb_phase <= VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_phase;
     neq2_uxn_opcodes_h_l2844_c41_cbcb_ins <= VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_ins;
     neq2_uxn_opcodes_h_l2844_c41_cbcb_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_return_output := neq2_uxn_opcodes_h_l2844_c41_cbcb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2845_c1_867a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2846_c7_8936] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_8936_return_output;
     VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_867a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_iftrue := VAR_neq2_uxn_opcodes_h_l2844_c41_cbcb_return_output;
     -- gth[uxn_opcodes_h_l2845_c41_8aa3] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2845_c41_8aa3_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2845_c41_8aa3_phase <= VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_phase;
     gth_uxn_opcodes_h_l2845_c41_8aa3_ins <= VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_ins;
     gth_uxn_opcodes_h_l2845_c41_8aa3_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_return_output := gth_uxn_opcodes_h_l2845_c41_8aa3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2847_c7_8bfa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2846_c1_da7e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output;
     VAR_gth2_uxn_opcodes_h_l2846_c41_8821_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_da7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_iftrue := VAR_gth_uxn_opcodes_h_l2845_c41_8aa3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2848_c7_fe16] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output;

     -- gth2[uxn_opcodes_h_l2846_c41_8821] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2846_c41_8821_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2846_c41_8821_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2846_c41_8821_phase <= VAR_gth2_uxn_opcodes_h_l2846_c41_8821_phase;
     gth2_uxn_opcodes_h_l2846_c41_8821_ins <= VAR_gth2_uxn_opcodes_h_l2846_c41_8821_ins;
     gth2_uxn_opcodes_h_l2846_c41_8821_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2846_c41_8821_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2846_c41_8821_return_output := gth2_uxn_opcodes_h_l2846_c41_8821_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2847_c1_ade3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output;
     VAR_lth_uxn_opcodes_h_l2847_c41_50ec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_ade3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_iftrue := VAR_gth2_uxn_opcodes_h_l2846_c41_8821_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2848_c1_7cd2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2849_c7_39cd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output;

     -- lth[uxn_opcodes_h_l2847_c41_50ec] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2847_c41_50ec_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2847_c41_50ec_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2847_c41_50ec_phase <= VAR_lth_uxn_opcodes_h_l2847_c41_50ec_phase;
     lth_uxn_opcodes_h_l2847_c41_50ec_ins <= VAR_lth_uxn_opcodes_h_l2847_c41_50ec_ins;
     lth_uxn_opcodes_h_l2847_c41_50ec_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2847_c41_50ec_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2847_c41_50ec_return_output := lth_uxn_opcodes_h_l2847_c41_50ec_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output;
     VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_7cd2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_iftrue := VAR_lth_uxn_opcodes_h_l2847_c41_50ec_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2850_c7_e073] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2849_c1_4c88] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_return_output;

     -- lth2[uxn_opcodes_h_l2848_c41_c2e6] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2848_c41_c2e6_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2848_c41_c2e6_phase <= VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_phase;
     lth2_uxn_opcodes_h_l2848_c41_c2e6_ins <= VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_ins;
     lth2_uxn_opcodes_h_l2848_c41_c2e6_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_return_output := lth2_uxn_opcodes_h_l2848_c41_c2e6_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_e073_return_output;
     VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_4c88_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_iftrue := VAR_lth2_uxn_opcodes_h_l2848_c41_c2e6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2851_c7_6d46] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output;

     -- jmp[uxn_opcodes_h_l2849_c41_fbf4] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2849_c41_fbf4_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2849_c41_fbf4_phase <= VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_phase;
     jmp_uxn_opcodes_h_l2849_c41_fbf4_ins <= VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_ins;
     jmp_uxn_opcodes_h_l2849_c41_fbf4_pc <= VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_pc;
     jmp_uxn_opcodes_h_l2849_c41_fbf4_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_return_output := jmp_uxn_opcodes_h_l2849_c41_fbf4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2850_c1_15f5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output;
     VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_15f5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_iftrue := VAR_jmp_uxn_opcodes_h_l2849_c41_fbf4_return_output;
     -- jmp2[uxn_opcodes_h_l2850_c41_63a6] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2850_c41_63a6_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2850_c41_63a6_phase <= VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_phase;
     jmp2_uxn_opcodes_h_l2850_c41_63a6_ins <= VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_ins;
     jmp2_uxn_opcodes_h_l2850_c41_63a6_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_return_output := jmp2_uxn_opcodes_h_l2850_c41_63a6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2852_c7_19f1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2851_c1_dae1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output;
     VAR_printf_uxn_opcodes_h_l2851_c28_bb93_uxn_opcodes_h_l2851_c28_bb93_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_dae1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_iftrue := VAR_jmp2_uxn_opcodes_h_l2850_c41_63a6_return_output;
     -- printf_uxn_opcodes_h_l2851_c28_bb93[uxn_opcodes_h_l2851_c28_bb93] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2851_c28_bb93_uxn_opcodes_h_l2851_c28_bb93_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2851_c28_bb93_uxn_opcodes_h_l2851_c28_bb93_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2851_c28_bb93_uxn_opcodes_h_l2851_c28_bb93_arg0 <= VAR_printf_uxn_opcodes_h_l2851_c28_bb93_uxn_opcodes_h_l2851_c28_bb93_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2852_c1_fd5b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2853_c7_1435] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1435_return_output;
     VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_fd5b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2854_c7_40d7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2853_c1_48ed] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_return_output;

     -- jcn2[uxn_opcodes_h_l2852_c41_5028] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2852_c41_5028_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2852_c41_5028_phase <= VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_phase;
     jcn2_uxn_opcodes_h_l2852_c41_5028_ins <= VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_ins;
     jcn2_uxn_opcodes_h_l2852_c41_5028_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_return_output := jcn2_uxn_opcodes_h_l2852_c41_5028_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output;
     VAR_printf_uxn_opcodes_h_l2853_c28_04aa_uxn_opcodes_h_l2853_c28_04aa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_48ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_iftrue := VAR_jcn2_uxn_opcodes_h_l2852_c41_5028_return_output;
     -- printf_uxn_opcodes_h_l2853_c28_04aa[uxn_opcodes_h_l2853_c28_04aa] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2853_c28_04aa_uxn_opcodes_h_l2853_c28_04aa_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2853_c28_04aa_uxn_opcodes_h_l2853_c28_04aa_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2853_c28_04aa_uxn_opcodes_h_l2853_c28_04aa_arg0 <= VAR_printf_uxn_opcodes_h_l2853_c28_04aa_uxn_opcodes_h_l2853_c28_04aa_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2855_c7_6700] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2854_c1_e039] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_6700_return_output;
     VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_e039_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2855_c1_32fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2856_c7_d306] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_return_output;

     -- jsr2[uxn_opcodes_h_l2854_c41_4918] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2854_c41_4918_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2854_c41_4918_phase <= VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_phase;
     jsr2_uxn_opcodes_h_l2854_c41_4918_ins <= VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_ins;
     jsr2_uxn_opcodes_h_l2854_c41_4918_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_return_output := jsr2_uxn_opcodes_h_l2854_c41_4918_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_d306_return_output;
     VAR_printf_uxn_opcodes_h_l2855_c28_0288_uxn_opcodes_h_l2855_c28_0288_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_32fc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_iftrue := VAR_jsr2_uxn_opcodes_h_l2854_c41_4918_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2856_c1_717b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2857_c7_8f3d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output;

     -- printf_uxn_opcodes_h_l2855_c28_0288[uxn_opcodes_h_l2855_c28_0288] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2855_c28_0288_uxn_opcodes_h_l2855_c28_0288_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2855_c28_0288_uxn_opcodes_h_l2855_c28_0288_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2855_c28_0288_uxn_opcodes_h_l2855_c28_0288_arg0 <= VAR_printf_uxn_opcodes_h_l2855_c28_0288_uxn_opcodes_h_l2855_c28_0288_arg0;
     -- Outputs

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output;
     VAR_sth2_uxn_opcodes_h_l2856_c41_6507_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_717b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2857_c1_55bc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2858_c7_1dff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output;

     -- sth2[uxn_opcodes_h_l2856_c41_6507] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2856_c41_6507_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2856_c41_6507_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2856_c41_6507_phase <= VAR_sth2_uxn_opcodes_h_l2856_c41_6507_phase;
     sth2_uxn_opcodes_h_l2856_c41_6507_ins <= VAR_sth2_uxn_opcodes_h_l2856_c41_6507_ins;
     sth2_uxn_opcodes_h_l2856_c41_6507_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2856_c41_6507_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2856_c41_6507_return_output := sth2_uxn_opcodes_h_l2856_c41_6507_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output;
     VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_55bc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_iftrue := VAR_sth2_uxn_opcodes_h_l2856_c41_6507_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2859_c7_c768] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_return_output;

     -- ldz[uxn_opcodes_h_l2857_c41_dd23] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2857_c41_dd23_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2857_c41_dd23_phase <= VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_phase;
     ldz_uxn_opcodes_h_l2857_c41_dd23_ins <= VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_ins;
     ldz_uxn_opcodes_h_l2857_c41_dd23_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_previous_stack_read;
     ldz_uxn_opcodes_h_l2857_c41_dd23_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_return_output := ldz_uxn_opcodes_h_l2857_c41_dd23_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2858_c1_2c20] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_c768_return_output;
     VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_2c20_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_iftrue := VAR_ldz_uxn_opcodes_h_l2857_c41_dd23_return_output;
     -- ldz2[uxn_opcodes_h_l2858_c41_3c06] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2858_c41_3c06_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2858_c41_3c06_phase <= VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_phase;
     ldz2_uxn_opcodes_h_l2858_c41_3c06_ins <= VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_ins;
     ldz2_uxn_opcodes_h_l2858_c41_3c06_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_previous_stack_read;
     ldz2_uxn_opcodes_h_l2858_c41_3c06_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_return_output := ldz2_uxn_opcodes_h_l2858_c41_3c06_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2860_c7_d43c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2859_c1_cc22] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output;
     VAR_printf_uxn_opcodes_h_l2859_c28_76fe_uxn_opcodes_h_l2859_c28_76fe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_cc22_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_iftrue := VAR_ldz2_uxn_opcodes_h_l2858_c41_3c06_return_output;
     -- printf_uxn_opcodes_h_l2859_c28_76fe[uxn_opcodes_h_l2859_c28_76fe] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2859_c28_76fe_uxn_opcodes_h_l2859_c28_76fe_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2859_c28_76fe_uxn_opcodes_h_l2859_c28_76fe_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2859_c28_76fe_uxn_opcodes_h_l2859_c28_76fe_arg0 <= VAR_printf_uxn_opcodes_h_l2859_c28_76fe_uxn_opcodes_h_l2859_c28_76fe_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2861_c7_60c2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2860_c1_4fa1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output;
     VAR_printf_uxn_opcodes_h_l2860_c28_ab52_uxn_opcodes_h_l2860_c28_ab52_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_4fa1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2862_c7_5cdf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2861_c1_4a36] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_return_output;

     -- printf_uxn_opcodes_h_l2860_c28_ab52[uxn_opcodes_h_l2860_c28_ab52] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2860_c28_ab52_uxn_opcodes_h_l2860_c28_ab52_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2860_c28_ab52_uxn_opcodes_h_l2860_c28_ab52_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2860_c28_ab52_uxn_opcodes_h_l2860_c28_ab52_arg0 <= VAR_printf_uxn_opcodes_h_l2860_c28_ab52_uxn_opcodes_h_l2860_c28_ab52_arg0;
     -- Outputs

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output;
     VAR_printf_uxn_opcodes_h_l2861_c28_9d7f_uxn_opcodes_h_l2861_c28_9d7f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_4a36_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2862_c1_10db] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2863_c7_ef0d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output;

     -- printf_uxn_opcodes_h_l2861_c28_9d7f[uxn_opcodes_h_l2861_c28_9d7f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2861_c28_9d7f_uxn_opcodes_h_l2861_c28_9d7f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2861_c28_9d7f_uxn_opcodes_h_l2861_c28_9d7f_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2861_c28_9d7f_uxn_opcodes_h_l2861_c28_9d7f_arg0 <= VAR_printf_uxn_opcodes_h_l2861_c28_9d7f_uxn_opcodes_h_l2861_c28_9d7f_arg0;
     -- Outputs

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output;
     VAR_printf_uxn_opcodes_h_l2862_c28_eb8a_uxn_opcodes_h_l2862_c28_eb8a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_10db_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2863_c1_2ef1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2864_c7_ad9f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output;

     -- printf_uxn_opcodes_h_l2862_c28_eb8a[uxn_opcodes_h_l2862_c28_eb8a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2862_c28_eb8a_uxn_opcodes_h_l2862_c28_eb8a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2862_c28_eb8a_uxn_opcodes_h_l2862_c28_eb8a_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2862_c28_eb8a_uxn_opcodes_h_l2862_c28_eb8a_arg0 <= VAR_printf_uxn_opcodes_h_l2862_c28_eb8a_uxn_opcodes_h_l2862_c28_eb8a_arg0;
     -- Outputs

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output;
     VAR_printf_uxn_opcodes_h_l2863_c28_8ea1_uxn_opcodes_h_l2863_c28_8ea1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_2ef1_return_output;
     -- printf_uxn_opcodes_h_l2863_c28_8ea1[uxn_opcodes_h_l2863_c28_8ea1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2863_c28_8ea1_uxn_opcodes_h_l2863_c28_8ea1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2863_c28_8ea1_uxn_opcodes_h_l2863_c28_8ea1_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2863_c28_8ea1_uxn_opcodes_h_l2863_c28_8ea1_arg0 <= VAR_printf_uxn_opcodes_h_l2863_c28_8ea1_uxn_opcodes_h_l2863_c28_8ea1_arg0;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2865_c7_5c25] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2864_c1_e93f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output;
     VAR_printf_uxn_opcodes_h_l2864_c28_3f4e_uxn_opcodes_h_l2864_c28_3f4e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_e93f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2866_c7_b240] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_return_output;

     -- printf_uxn_opcodes_h_l2864_c28_3f4e[uxn_opcodes_h_l2864_c28_3f4e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2864_c28_3f4e_uxn_opcodes_h_l2864_c28_3f4e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2864_c28_3f4e_uxn_opcodes_h_l2864_c28_3f4e_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2864_c28_3f4e_uxn_opcodes_h_l2864_c28_3f4e_arg0 <= VAR_printf_uxn_opcodes_h_l2864_c28_3f4e_uxn_opcodes_h_l2864_c28_3f4e_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2865_c1_5f9f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_b240_return_output;
     VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_5f9f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2866_c1_c58d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_return_output;

     -- lda[uxn_opcodes_h_l2865_c41_bdc2] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2865_c41_bdc2_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2865_c41_bdc2_phase <= VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_phase;
     lda_uxn_opcodes_h_l2865_c41_bdc2_ins <= VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_ins;
     lda_uxn_opcodes_h_l2865_c41_bdc2_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_previous_stack_read;
     lda_uxn_opcodes_h_l2865_c41_bdc2_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_return_output := lda_uxn_opcodes_h_l2865_c41_bdc2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2867_c7_d897] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_d897_return_output;
     VAR_lda2_uxn_opcodes_h_l2866_c41_967b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_c58d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_iftrue := VAR_lda_uxn_opcodes_h_l2865_c41_bdc2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2867_c1_defd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2868_c7_23c4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output;

     -- lda2[uxn_opcodes_h_l2866_c41_967b] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2866_c41_967b_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2866_c41_967b_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2866_c41_967b_phase <= VAR_lda2_uxn_opcodes_h_l2866_c41_967b_phase;
     lda2_uxn_opcodes_h_l2866_c41_967b_ins <= VAR_lda2_uxn_opcodes_h_l2866_c41_967b_ins;
     lda2_uxn_opcodes_h_l2866_c41_967b_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2866_c41_967b_previous_stack_read;
     lda2_uxn_opcodes_h_l2866_c41_967b_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2866_c41_967b_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2866_c41_967b_return_output := lda2_uxn_opcodes_h_l2866_c41_967b_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output;
     VAR_sta_uxn_opcodes_h_l2867_c41_a152_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_defd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_iftrue := VAR_lda2_uxn_opcodes_h_l2866_c41_967b_return_output;
     -- sta[uxn_opcodes_h_l2867_c41_a152] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2867_c41_a152_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2867_c41_a152_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2867_c41_a152_phase <= VAR_sta_uxn_opcodes_h_l2867_c41_a152_phase;
     sta_uxn_opcodes_h_l2867_c41_a152_ins <= VAR_sta_uxn_opcodes_h_l2867_c41_a152_ins;
     sta_uxn_opcodes_h_l2867_c41_a152_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2867_c41_a152_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2867_c41_a152_return_output := sta_uxn_opcodes_h_l2867_c41_a152_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2868_c1_6f6e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2869_c7_cdac] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output;
     VAR_sta2_uxn_opcodes_h_l2868_c41_f335_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_6f6e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_iftrue := VAR_sta_uxn_opcodes_h_l2867_c41_a152_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2870_c7_32c7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output;

     -- sta2[uxn_opcodes_h_l2868_c41_f335] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2868_c41_f335_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2868_c41_f335_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2868_c41_f335_phase <= VAR_sta2_uxn_opcodes_h_l2868_c41_f335_phase;
     sta2_uxn_opcodes_h_l2868_c41_f335_ins <= VAR_sta2_uxn_opcodes_h_l2868_c41_f335_ins;
     sta2_uxn_opcodes_h_l2868_c41_f335_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2868_c41_f335_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2868_c41_f335_return_output := sta2_uxn_opcodes_h_l2868_c41_f335_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2869_c1_e834] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output;
     VAR_printf_uxn_opcodes_h_l2869_c28_a342_uxn_opcodes_h_l2869_c28_a342_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_e834_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_iftrue := VAR_sta2_uxn_opcodes_h_l2868_c41_f335_return_output;
     -- printf_uxn_opcodes_h_l2869_c28_a342[uxn_opcodes_h_l2869_c28_a342] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2869_c28_a342_uxn_opcodes_h_l2869_c28_a342_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2869_c28_a342_uxn_opcodes_h_l2869_c28_a342_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2869_c28_a342_uxn_opcodes_h_l2869_c28_a342_arg0 <= VAR_printf_uxn_opcodes_h_l2869_c28_a342_uxn_opcodes_h_l2869_c28_a342_arg0;
     -- Outputs

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2870_c1_b519] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2871_c7_b9bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output;
     VAR_printf_uxn_opcodes_h_l2870_c28_16e1_uxn_opcodes_h_l2870_c28_16e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_b519_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2871_c1_d229] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c7_7495] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_return_output;

     -- printf_uxn_opcodes_h_l2870_c28_16e1[uxn_opcodes_h_l2870_c28_16e1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2870_c28_16e1_uxn_opcodes_h_l2870_c28_16e1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2870_c28_16e1_uxn_opcodes_h_l2870_c28_16e1_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2870_c28_16e1_uxn_opcodes_h_l2870_c28_16e1_arg0 <= VAR_printf_uxn_opcodes_h_l2870_c28_16e1_uxn_opcodes_h_l2870_c28_16e1_arg0;
     -- Outputs

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_7495_return_output;
     VAR_deo_uxn_opcodes_h_l2871_c41_bae1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_d229_return_output;
     -- deo[uxn_opcodes_h_l2871_c41_bae1] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2871_c41_bae1_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2871_c41_bae1_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2871_c41_bae1_phase <= VAR_deo_uxn_opcodes_h_l2871_c41_bae1_phase;
     deo_uxn_opcodes_h_l2871_c41_bae1_ins <= VAR_deo_uxn_opcodes_h_l2871_c41_bae1_ins;
     deo_uxn_opcodes_h_l2871_c41_bae1_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2871_c41_bae1_previous_stack_read;
     deo_uxn_opcodes_h_l2871_c41_bae1_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2871_c41_bae1_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2871_c41_bae1_return_output := deo_uxn_opcodes_h_l2871_c41_bae1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c1_2fda] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_f2d9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output;
     VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_2fda_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_iftrue := VAR_deo_uxn_opcodes_h_l2871_c41_bae1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_0a05] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_0be5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output;

     -- deo2[uxn_opcodes_h_l2872_c41_7ca8] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2872_c41_7ca8_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2872_c41_7ca8_phase <= VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_phase;
     deo2_uxn_opcodes_h_l2872_c41_7ca8_ins <= VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_ins;
     deo2_uxn_opcodes_h_l2872_c41_7ca8_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_previous_stack_read;
     deo2_uxn_opcodes_h_l2872_c41_7ca8_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_return_output := deo2_uxn_opcodes_h_l2872_c41_7ca8_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output;
     VAR_add_uxn_opcodes_h_l2873_c41_c724_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_0a05_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_iftrue := VAR_deo2_uxn_opcodes_h_l2872_c41_7ca8_return_output;
     -- add[uxn_opcodes_h_l2873_c41_c724] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2873_c41_c724_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2873_c41_c724_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2873_c41_c724_phase <= VAR_add_uxn_opcodes_h_l2873_c41_c724_phase;
     add_uxn_opcodes_h_l2873_c41_c724_ins <= VAR_add_uxn_opcodes_h_l2873_c41_c724_ins;
     add_uxn_opcodes_h_l2873_c41_c724_previous_stack_read <= VAR_add_uxn_opcodes_h_l2873_c41_c724_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2873_c41_c724_return_output := add_uxn_opcodes_h_l2873_c41_c724_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_9e9e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_f0f1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output;
     VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_9e9e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_iftrue := VAR_add_uxn_opcodes_h_l2873_c41_c724_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_35be] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_4ff6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_return_output;

     -- add2[uxn_opcodes_h_l2874_c41_b4f3] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2874_c41_b4f3_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2874_c41_b4f3_phase <= VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_phase;
     add2_uxn_opcodes_h_l2874_c41_b4f3_ins <= VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_ins;
     add2_uxn_opcodes_h_l2874_c41_b4f3_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_return_output := add2_uxn_opcodes_h_l2874_c41_b4f3_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_35be_return_output;
     VAR_sub_uxn_opcodes_h_l2875_c41_e520_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_4ff6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_iftrue := VAR_add2_uxn_opcodes_h_l2874_c41_b4f3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_98d2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_return_output;

     -- sub[uxn_opcodes_h_l2875_c41_e520] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2875_c41_e520_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2875_c41_e520_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2875_c41_e520_phase <= VAR_sub_uxn_opcodes_h_l2875_c41_e520_phase;
     sub_uxn_opcodes_h_l2875_c41_e520_ins <= VAR_sub_uxn_opcodes_h_l2875_c41_e520_ins;
     sub_uxn_opcodes_h_l2875_c41_e520_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2875_c41_e520_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2875_c41_e520_return_output := sub_uxn_opcodes_h_l2875_c41_e520_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_41a5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output;
     VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_98d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_iftrue := VAR_sub_uxn_opcodes_h_l2875_c41_e520_return_output;
     -- sub2[uxn_opcodes_h_l2876_c41_9e98] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2876_c41_9e98_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2876_c41_9e98_phase <= VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_phase;
     sub2_uxn_opcodes_h_l2876_c41_9e98_ins <= VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_ins;
     sub2_uxn_opcodes_h_l2876_c41_9e98_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_return_output := sub2_uxn_opcodes_h_l2876_c41_9e98_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_8a01] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_cdd6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output;
     VAR_mul_uxn_opcodes_h_l2877_c41_77f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_cdd6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_iftrue := VAR_sub2_uxn_opcodes_h_l2876_c41_9e98_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_971e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_return_output;

     -- mul[uxn_opcodes_h_l2877_c41_77f1] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2877_c41_77f1_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2877_c41_77f1_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2877_c41_77f1_phase <= VAR_mul_uxn_opcodes_h_l2877_c41_77f1_phase;
     mul_uxn_opcodes_h_l2877_c41_77f1_ins <= VAR_mul_uxn_opcodes_h_l2877_c41_77f1_ins;
     mul_uxn_opcodes_h_l2877_c41_77f1_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2877_c41_77f1_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2877_c41_77f1_return_output := mul_uxn_opcodes_h_l2877_c41_77f1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_2f8e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_971e_return_output;
     VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_2f8e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_iftrue := VAR_mul_uxn_opcodes_h_l2877_c41_77f1_return_output;
     -- mul2[uxn_opcodes_h_l2878_c41_0c5d] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2878_c41_0c5d_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2878_c41_0c5d_phase <= VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_phase;
     mul2_uxn_opcodes_h_l2878_c41_0c5d_ins <= VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_ins;
     mul2_uxn_opcodes_h_l2878_c41_0c5d_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_return_output := mul2_uxn_opcodes_h_l2878_c41_0c5d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_66a7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_de39] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output;
     VAR_div_uxn_opcodes_h_l2879_c41_9c4a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_de39_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_iftrue := VAR_mul2_uxn_opcodes_h_l2878_c41_0c5d_return_output;
     -- div[uxn_opcodes_h_l2879_c41_9c4a] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2879_c41_9c4a_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2879_c41_9c4a_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2879_c41_9c4a_phase <= VAR_div_uxn_opcodes_h_l2879_c41_9c4a_phase;
     div_uxn_opcodes_h_l2879_c41_9c4a_ins <= VAR_div_uxn_opcodes_h_l2879_c41_9c4a_ins;
     div_uxn_opcodes_h_l2879_c41_9c4a_previous_stack_read <= VAR_div_uxn_opcodes_h_l2879_c41_9c4a_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2879_c41_9c4a_return_output := div_uxn_opcodes_h_l2879_c41_9c4a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_c5cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_2937] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_2937_return_output;
     VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_c5cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_iftrue := VAR_div_uxn_opcodes_h_l2879_c41_9c4a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_27f2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_return_output;

     -- div2[uxn_opcodes_h_l2880_c41_4cf3] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2880_c41_4cf3_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2880_c41_4cf3_phase <= VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_phase;
     div2_uxn_opcodes_h_l2880_c41_4cf3_ins <= VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_ins;
     div2_uxn_opcodes_h_l2880_c41_4cf3_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_return_output := div2_uxn_opcodes_h_l2880_c41_4cf3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_b9df] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output;
     VAR_and_uxn_opcodes_h_l2881_c41_c454_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_27f2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_iftrue := VAR_div2_uxn_opcodes_h_l2880_c41_4cf3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_67d3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_f6b3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_return_output;

     -- and[uxn_opcodes_h_l2881_c41_c454] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2881_c41_c454_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2881_c41_c454_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2881_c41_c454_phase <= VAR_and_uxn_opcodes_h_l2881_c41_c454_phase;
     and_uxn_opcodes_h_l2881_c41_c454_ins <= VAR_and_uxn_opcodes_h_l2881_c41_c454_ins;
     and_uxn_opcodes_h_l2881_c41_c454_previous_stack_read <= VAR_and_uxn_opcodes_h_l2881_c41_c454_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2881_c41_c454_return_output := and_uxn_opcodes_h_l2881_c41_c454_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output;
     VAR_and2_uxn_opcodes_h_l2882_c41_9569_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_f6b3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_iftrue := VAR_and_uxn_opcodes_h_l2881_c41_c454_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_c389] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_return_output;

     -- and2[uxn_opcodes_h_l2882_c41_9569] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2882_c41_9569_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2882_c41_9569_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2882_c41_9569_phase <= VAR_and2_uxn_opcodes_h_l2882_c41_9569_phase;
     and2_uxn_opcodes_h_l2882_c41_9569_ins <= VAR_and2_uxn_opcodes_h_l2882_c41_9569_ins;
     and2_uxn_opcodes_h_l2882_c41_9569_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2882_c41_9569_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2882_c41_9569_return_output := and2_uxn_opcodes_h_l2882_c41_9569_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_8d55] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_c389_return_output;
     VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_8d55_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_iftrue := VAR_and2_uxn_opcodes_h_l2882_c41_9569_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_555b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_return_output;

     -- ora[uxn_opcodes_h_l2883_c41_0ab5] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2883_c41_0ab5_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2883_c41_0ab5_phase <= VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_phase;
     ora_uxn_opcodes_h_l2883_c41_0ab5_ins <= VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_ins;
     ora_uxn_opcodes_h_l2883_c41_0ab5_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_return_output := ora_uxn_opcodes_h_l2883_c41_0ab5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_6449] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_555b_return_output;
     VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_6449_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_iftrue := VAR_ora_uxn_opcodes_h_l2883_c41_0ab5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_7335] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_return_output;

     -- ora2[uxn_opcodes_h_l2884_c41_11b5] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2884_c41_11b5_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2884_c41_11b5_phase <= VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_phase;
     ora2_uxn_opcodes_h_l2884_c41_11b5_ins <= VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_ins;
     ora2_uxn_opcodes_h_l2884_c41_11b5_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_return_output := ora2_uxn_opcodes_h_l2884_c41_11b5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_26a8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_7335_return_output;
     VAR_eor_uxn_opcodes_h_l2885_c41_189f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_26a8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_iftrue := VAR_ora2_uxn_opcodes_h_l2884_c41_11b5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_d07e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c7_0d0e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output;

     -- eor[uxn_opcodes_h_l2885_c41_189f] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2885_c41_189f_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2885_c41_189f_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2885_c41_189f_phase <= VAR_eor_uxn_opcodes_h_l2885_c41_189f_phase;
     eor_uxn_opcodes_h_l2885_c41_189f_ins <= VAR_eor_uxn_opcodes_h_l2885_c41_189f_ins;
     eor_uxn_opcodes_h_l2885_c41_189f_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2885_c41_189f_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2885_c41_189f_return_output := eor_uxn_opcodes_h_l2885_c41_189f_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output;
     VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_d07e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_iftrue := VAR_eor_uxn_opcodes_h_l2885_c41_189f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c7_dd32] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2887_c1_3bea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_return_output;

     -- eor2[uxn_opcodes_h_l2886_c41_cd48] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2886_c41_cd48_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2886_c41_cd48_phase <= VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_phase;
     eor2_uxn_opcodes_h_l2886_c41_cd48_ins <= VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_ins;
     eor2_uxn_opcodes_h_l2886_c41_cd48_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_return_output := eor2_uxn_opcodes_h_l2886_c41_cd48_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output;
     VAR_sft_uxn_opcodes_h_l2887_c41_1736_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2887_c1_3bea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_iftrue := VAR_eor2_uxn_opcodes_h_l2886_c41_cd48_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2889_c1_fcde] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_return_output;

     -- sft[uxn_opcodes_h_l2887_c41_1736] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2887_c41_1736_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2887_c41_1736_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2887_c41_1736_phase <= VAR_sft_uxn_opcodes_h_l2887_c41_1736_phase;
     sft_uxn_opcodes_h_l2887_c41_1736_ins <= VAR_sft_uxn_opcodes_h_l2887_c41_1736_ins;
     sft_uxn_opcodes_h_l2887_c41_1736_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2887_c41_1736_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2887_c41_1736_return_output := sft_uxn_opcodes_h_l2887_c41_1736_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2888_c1_ad50] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l2889_c9_3026_uxn_opcodes_h_l2889_c9_3026_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2889_c1_fcde_return_output;
     VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2888_c1_ad50_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_iftrue := VAR_sft_uxn_opcodes_h_l2887_c41_1736_return_output;
     -- printf_uxn_opcodes_h_l2889_c9_3026[uxn_opcodes_h_l2889_c9_3026] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2889_c9_3026_uxn_opcodes_h_l2889_c9_3026_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2889_c9_3026_uxn_opcodes_h_l2889_c9_3026_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2889_c9_3026_uxn_opcodes_h_l2889_c9_3026_arg0 <= VAR_printf_uxn_opcodes_h_l2889_c9_3026_uxn_opcodes_h_l2889_c9_3026_arg0;
     -- Outputs

     -- sft2[uxn_opcodes_h_l2888_c41_eabf] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2888_c41_eabf_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2888_c41_eabf_phase <= VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_phase;
     sft2_uxn_opcodes_h_l2888_c41_eabf_ins <= VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_ins;
     sft2_uxn_opcodes_h_l2888_c41_eabf_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_return_output := sft2_uxn_opcodes_h_l2888_c41_eabf_return_output;

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_iftrue := VAR_sft2_uxn_opcodes_h_l2888_c41_eabf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2888_c7_dd32] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_cond;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output := opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2888_c7_dd32_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2887_c7_0d0e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_cond;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output := opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2887_c7_0d0e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2886_c7_7335] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_cond;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_return_output := opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_7335_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2885_c7_555b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_cond;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_return_output := opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_555b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2884_c7_c389] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_cond;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_return_output := opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_c389_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2883_c7_67d3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_cond;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output := opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_67d3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2882_c7_b9df] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_cond;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output := opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_b9df_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2881_c7_2937] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_cond;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_return_output := opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_2937_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2880_c7_66a7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_cond;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output := opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_66a7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2879_c7_971e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_cond;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_return_output := opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_971e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2878_c7_8a01] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_cond;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output := opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_8a01_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2877_c7_41a5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_cond;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output := opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_41a5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2876_c7_35be] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_cond;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_return_output := opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_35be_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2875_c7_f0f1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_cond;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output := opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_f0f1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2874_c7_0be5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_cond;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output := opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_0be5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2873_c7_f2d9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_cond;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output := opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_f2d9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2872_c7_7495] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_cond;
     opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_return_output := opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_7495_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2871_c7_b9bf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_cond;
     opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output := opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_b9bf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2870_c7_32c7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_cond;
     opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output := opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_32c7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2869_c7_cdac] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_cond;
     opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output := opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_cdac_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2868_c7_23c4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_cond;
     opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output := opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_23c4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2867_c7_d897] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_cond;
     opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_return_output := opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_d897_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2866_c7_b240] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_cond;
     opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_return_output := opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_b240_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2865_c7_5c25] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_cond;
     opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output := opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_5c25_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2864_c7_ad9f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_cond;
     opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output := opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_ad9f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2863_c7_ef0d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_cond;
     opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output := opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_ef0d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2862_c7_5cdf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_cond;
     opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output := opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_5cdf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2861_c7_60c2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_cond;
     opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output := opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_60c2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2860_c7_d43c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_cond;
     opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output := opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_d43c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2859_c7_c768] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_cond;
     opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_return_output := opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_c768_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2858_c7_1dff] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_cond;
     opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output := opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_1dff_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2857_c7_8f3d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_cond;
     opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output := opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_8f3d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2856_c7_d306] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_cond;
     opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_return_output := opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_d306_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2855_c7_6700] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_cond;
     opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_return_output := opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_6700_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2854_c7_40d7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_cond;
     opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output := opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_40d7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2853_c7_1435] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_cond;
     opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_return_output := opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1435_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2852_c7_19f1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_cond;
     opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output := opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_19f1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2851_c7_6d46] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_cond;
     opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output := opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_6d46_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2850_c7_e073] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_cond;
     opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_return_output := opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_e073_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2849_c7_39cd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_cond;
     opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output := opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_39cd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2848_c7_fe16] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_cond;
     opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output := opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_fe16_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2847_c7_8bfa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_cond;
     opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output := opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_8bfa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2846_c7_8936] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_cond;
     opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_return_output := opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_8936_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2845_c7_19f0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_cond;
     opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output := opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_19f0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2844_c7_c09e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_cond;
     opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output := opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_c09e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2843_c7_4152] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_cond;
     opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_return_output := opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_4152_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2842_c7_aff1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_cond;
     opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output := opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_aff1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2841_c7_d3e4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_cond;
     opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output := opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_d3e4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2840_c7_6e5b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_cond;
     opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output := opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_6e5b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2839_c7_0a9e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_cond;
     opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output := opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_0a9e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2838_c7_fb52] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_cond;
     opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output := opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_fb52_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2837_c7_33f6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_cond;
     opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output := opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_33f6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2836_c7_8556] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_cond;
     opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_return_output := opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_8556_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2835_c7_c5d5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_cond;
     opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output := opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c5d5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2834_c7_caee] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_cond;
     opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_return_output := opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_caee_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2833_c7_c12d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_cond;
     opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output := opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_c12d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2832_c7_664c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_cond;
     opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_return_output := opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_664c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2831_c7_d8a8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_cond;
     opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output := opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_d8a8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2830_c7_d1a1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_cond;
     opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output := opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_d1a1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2829_c7_2877] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_cond;
     opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_return_output := opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_2877_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2828_c7_9e38] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_cond;
     opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output := opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_9e38_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2827_c7_837e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_cond;
     opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_return_output := opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_837e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2826_c7_b031] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_cond;
     opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_return_output := opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_b031_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2825_c7_1268] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_cond;
     opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_return_output := opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_1268_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2824_c7_bc2c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_cond;
     opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output := opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_bc2c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2823_c7_83e4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_cond;
     opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output := opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_83e4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2822_c7_1ee4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_cond;
     opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output := opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_1ee4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2821_c7_8a90] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_cond;
     opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output := opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_8a90_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2820_c7_6e17] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_cond;
     opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output := opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_6e17_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2819_c2_dc0e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_cond;
     opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output := opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2936_c33_1335] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2936_c33_1335_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.is_ram_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2893_l2895_DUPLICATE_c2c3 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2893_l2895_DUPLICATE_c2c3_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2904_l2892_l2901_DUPLICATE_4df2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2904_l2892_l2901_DUPLICATE_4df2_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l2940_c33_7bd4] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2940_c33_7bd4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2927_c3_5104] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2927_c3_5104_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2929_l2925_DUPLICATE_4da1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2929_l2925_DUPLICATE_4da1_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.device_ram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d[uxn_opcodes_h_l2938_c30_7835] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2938_c30_7835_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2942_c32_8123] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2942_c32_8123_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d[uxn_opcodes_h_l2934_c23_41f8] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2934_c23_41f8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d[uxn_opcodes_h_l2935_c32_485a] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2935_c32_485a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.is_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2901_c82_ba7d] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2901_c82_ba7d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2933_c34_a26e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2933_c34_a26e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d[uxn_opcodes_h_l2902_c22_9bc7] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2902_c22_9bc7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2900_c19_a27b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2900_c19_a27b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.is_stack_write;

     -- CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d[uxn_opcodes_h_l2941_c31_de86] LATENCY=0
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2941_c31_de86_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.vram_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d[uxn_opcodes_h_l2937_c29_6da3] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2937_c29_6da3_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d[uxn_opcodes_h_l2899_c18_7f2e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2899_c18_7f2e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d[uxn_opcodes_h_l2926_c3_eafa] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2926_c3_eafa_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.device_ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d[uxn_opcodes_h_l2930_c3_0c79] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2930_c3_0c79_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.is_device_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l2891_c6_0eed] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2891_c6_0eed_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2939_c34_aec6] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2939_c34_aec6_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c2_dc0e_return_output.is_vram_write;

     -- Submodule level 146
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2893_l2895_DUPLICATE_c2c3_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_right := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2893_l2895_DUPLICATE_c2c3_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_read_d41d_uxn_opcodes_h_l2930_c3_0c79_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2927_c3_5104_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2891_c6_0eed_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2891_c6_0eed_return_output;
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2904_l2892_l2901_DUPLICATE_4df2_return_output;
     REG_VAR_is_stack_read := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2899_c18_7f2e_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2899_c18_7f2e_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_read1_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2899_c18_7f2e_return_output;
     REG_VAR_is_stack_write := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2900_c19_a27b_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2900_c19_a27b_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_write0_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2900_c19_a27b_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_address0 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2929_l2925_DUPLICATE_4da1_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_address1 := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2929_l2925_DUPLICATE_4da1_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_value_d41d_uxn_opcodes_h_l2926_c3_eafa_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_right := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2901_c82_ba7d_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2902_c22_9bc7_return_output;
     VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_write0_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2902_c22_9bc7_return_output;
     REG_VAR_stack_write_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2902_c22_9bc7_return_output;
     -- device_ram_update[uxn_opcodes_h_l2924_c26_7002] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l2924_c26_7002_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l2924_c26_7002_address0 <= VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_address0;
     device_ram_update_uxn_opcodes_h_l2924_c26_7002_write0_value <= VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_write0_value;
     device_ram_update_uxn_opcodes_h_l2924_c26_7002_write0_enable <= VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_write0_enable;
     device_ram_update_uxn_opcodes_h_l2924_c26_7002_read0_enable <= VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_read0_enable;
     device_ram_update_uxn_opcodes_h_l2924_c26_7002_address1 <= VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_address1;
     device_ram_update_uxn_opcodes_h_l2924_c26_7002_read1_enable <= VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_read1_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_return_output := device_ram_update_uxn_opcodes_h_l2924_c26_7002_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2893_c4_0761] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2944_l2797_DUPLICATE_0266 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2944_l2797_DUPLICATE_0266_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2933_c34_a26e_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l2934_c23_41f8_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2935_c32_485a_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2936_c33_1335_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2937_c29_6da3_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2938_c30_7835_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2939_c34_aec6_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2940_c33_7bd4_return_output,
     VAR_CONST_REF_RD_uint2_t_opcode_result_t_vram_value_d41d_uxn_opcodes_h_l2941_c31_de86_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2942_c32_8123_return_output);

     -- BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88 LATENCY=0
     -- Inputs
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_left <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_left;
     BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_right <= VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_right;
     -- Outputs
     VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_return_output := BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2895_c4_55b5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_return_output;

     -- Submodule level 147
     VAR_sp1_uxn_opcodes_h_l2893_c4_ca7e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c4_0761_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2895_c4_e042 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c4_55b5_return_output)),8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_return_output;
     VAR_MUX_uxn_opcodes_h_l2901_c19_c2bb_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2892_c3_4939_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2892_c3_4939_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_return_output;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_cond := VAR_BIN_OP_XOR_uint1_t_uint1_t_uxn_opcodes_h_l2892_l2901_l2904_DUPLICATE_9d88_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2944_l2797_DUPLICATE_0266_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_9314_uxn_opcodes_h_l2944_l2797_DUPLICATE_0266_return_output;
     VAR_device_ram_read_value_uxn_opcodes_h_l2924_c2_4f48 := resize(VAR_device_ram_update_uxn_opcodes_h_l2924_c26_7002_return_output, 8);
     REG_VAR_device_ram_read_value := VAR_device_ram_read_value_uxn_opcodes_h_l2924_c2_4f48;
     VAR_sp0_MUX_uxn_opcodes_h_l2892_c3_4939_iffalse := VAR_sp0_uxn_opcodes_h_l2895_c4_e042;
     VAR_sp1_MUX_uxn_opcodes_h_l2892_c3_4939_iftrue := VAR_sp1_uxn_opcodes_h_l2893_c4_ca7e;
     -- sp1_MUX[uxn_opcodes_h_l2892_c3_4939] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2892_c3_4939_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2892_c3_4939_cond;
     sp1_MUX_uxn_opcodes_h_l2892_c3_4939_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2892_c3_4939_iftrue;
     sp1_MUX_uxn_opcodes_h_l2892_c3_4939_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2892_c3_4939_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2892_c3_4939_return_output := sp1_MUX_uxn_opcodes_h_l2892_c3_4939_return_output;

     -- sp0_MUX[uxn_opcodes_h_l2892_c3_4939] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2892_c3_4939_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2892_c3_4939_cond;
     sp0_MUX_uxn_opcodes_h_l2892_c3_4939_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2892_c3_4939_iftrue;
     sp0_MUX_uxn_opcodes_h_l2892_c3_4939_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2892_c3_4939_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2892_c3_4939_return_output := sp0_MUX_uxn_opcodes_h_l2892_c3_4939_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2904_c1_f062] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2913_c1_4ce8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_return_output;

     -- Submodule level 148
     VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2913_c1_4ce8_return_output;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2904_c1_f062_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l2892_c3_4939_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2892_c3_4939_return_output;
     -- sp0_MUX[uxn_opcodes_h_l2891_c2_09ca] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_cond;
     sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_iftrue;
     sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output := sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2891_c2_09ca] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_cond;
     sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_iftrue;
     sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output := sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output;

     -- Submodule level 149
     VAR_MUX_uxn_opcodes_h_l2901_c19_c2bb_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output;
     VAR_MUX_uxn_opcodes_h_l2901_c19_c2bb_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2891_c2_09ca_return_output;
     -- MUX[uxn_opcodes_h_l2901_c19_c2bb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2901_c19_c2bb_cond <= VAR_MUX_uxn_opcodes_h_l2901_c19_c2bb_cond;
     MUX_uxn_opcodes_h_l2901_c19_c2bb_iftrue <= VAR_MUX_uxn_opcodes_h_l2901_c19_c2bb_iftrue;
     MUX_uxn_opcodes_h_l2901_c19_c2bb_iffalse <= VAR_MUX_uxn_opcodes_h_l2901_c19_c2bb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2901_c19_c2bb_return_output := MUX_uxn_opcodes_h_l2901_c19_c2bb_return_output;

     -- Submodule level 150
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_left := VAR_MUX_uxn_opcodes_h_l2901_c19_c2bb_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2901_c19_c917] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_return_output;

     -- Submodule level 151
     VAR_stack_address_uxn_opcodes_h_l2901_c2_0ffe := resize(VAR_BIN_OP_MINUS_uxn_opcodes_h_l2901_c19_c917_return_output, 16);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2901_c2_0ffe;
     VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_address0 := resize(VAR_stack_address_uxn_opcodes_h_l2901_c2_0ffe, 8);
     VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_address1 := resize(VAR_stack_address_uxn_opcodes_h_l2901_c2_0ffe, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_address0 := resize(VAR_stack_address_uxn_opcodes_h_l2901_c2_0ffe, 8);
     VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_address1 := resize(VAR_stack_address_uxn_opcodes_h_l2901_c2_0ffe, 8);
     -- stack_r_ram_update[uxn_opcodes_h_l2905_c22_9e88] LATENCY=0
     -- Clock enable
     stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_CLOCK_ENABLE <= VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_CLOCK_ENABLE;
     -- Inputs
     stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_address0 <= VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_address0;
     stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_write0_value <= VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_write0_value;
     stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_write0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_write0_enable;
     stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_read0_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_read0_enable;
     stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_address1 <= VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_address1;
     stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_read1_enable <= VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_read1_enable;
     -- Outputs
     VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_return_output := stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_return_output;

     -- stack_w_ram_update[uxn_opcodes_h_l2914_c22_79a3] LATENCY=0
     -- Clock enable
     stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_CLOCK_ENABLE <= VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_CLOCK_ENABLE;
     -- Inputs
     stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_address0 <= VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_address0;
     stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_write0_value <= VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_write0_value;
     stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_write0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_write0_enable;
     stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_read0_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_read0_enable;
     stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_address1 <= VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_address1;
     stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_read1_enable <= VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_read1_enable;
     -- Outputs
     VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_return_output := stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_return_output;

     -- Submodule level 152
     VAR_stack_read_value_uxn_opcodes_h_l2905_c3_bd4b := resize(VAR_stack_r_ram_update_uxn_opcodes_h_l2905_c22_9e88_return_output, 8);
     VAR_stack_read_value_uxn_opcodes_h_l2914_c3_2cd6 := resize(VAR_stack_w_ram_update_uxn_opcodes_h_l2914_c22_79a3_return_output, 8);
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_iftrue := VAR_stack_read_value_uxn_opcodes_h_l2905_c3_bd4b;
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_iffalse := VAR_stack_read_value_uxn_opcodes_h_l2914_c3_2cd6;
     -- stack_read_value_MUX[uxn_opcodes_h_l2904_c2_1899] LATENCY=0
     -- Inputs
     stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_cond <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_cond;
     stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_iftrue <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_iftrue;
     stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_iffalse <= VAR_stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_iffalse;
     -- Outputs
     VAR_stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_return_output := stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_return_output;

     -- Submodule level 153
     REG_VAR_stack_read_value := VAR_stack_read_value_MUX_uxn_opcodes_h_l2904_c2_1899_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_sp0 <= REG_VAR_sp0;
REG_COMB_sp1 <= REG_VAR_sp1;
REG_COMB_opc <= REG_VAR_opc;
REG_COMB_stack_index <= REG_VAR_stack_index;
REG_COMB_is_stack_read <= REG_VAR_is_stack_read;
REG_COMB_is_stack_write <= REG_VAR_is_stack_write;
REG_COMB_stack_address <= REG_VAR_stack_address;
REG_COMB_stack_write_value <= REG_VAR_stack_write_value;
REG_COMB_stack_read_value <= REG_VAR_stack_read_value;
REG_COMB_device_ram_read_value <= REG_VAR_device_ram_read_value;
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
     opc <= REG_COMB_opc;
     stack_index <= REG_COMB_stack_index;
     is_stack_read <= REG_COMB_is_stack_read;
     is_stack_write <= REG_COMB_is_stack_write;
     stack_address <= REG_COMB_stack_address;
     stack_write_value <= REG_COMB_stack_write_value;
     stack_read_value <= REG_COMB_stack_read_value;
     device_ram_read_value <= REG_COMB_device_ram_read_value;
     opc_result <= REG_COMB_opc_result;
     opc_eval_result <= REG_COMB_opc_eval_result;
 end if;
 end if;
end process;

end arch;
