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
-- Submodules: 372
entity eval_opcode_phased_0CLK_c1c6d56d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_c1c6d56d;
architecture arch of eval_opcode_phased_0CLK_c1c6d56d is
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
-- BIN_OP_AND[uxn_opcodes_h_l2809_c14_f7e3]
signal BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2810_c14_82d1]
signal BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_left : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_right : unsigned(7 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2810_c14_2632]
signal BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_opcodes_h_l2810_c14_c77a]
signal UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a_expr : unsigned(7 downto 0);
signal UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a_return_output : unsigned(7 downto 0);

-- BIN_OP_NEQ[uxn_opcodes_h_l2810_c14_5b6f]
signal BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_left : unsigned(7 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_right : unsigned(0 downto 0);
signal BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2810_c14_ea88]
signal MUX_uxn_opcodes_h_l2810_c14_ea88_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2810_c14_ea88_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2810_c14_ea88_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2810_c14_ea88_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2811_c8_cea1]
signal MUX_uxn_opcodes_h_l2811_c8_cea1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2811_c8_cea1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2811_c8_cea1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2811_c8_cea1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2817_c6_5722]
signal BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2818_c7_2ba7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2817_c2_9763]
signal opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output : opcode_result_t;

-- is_wait_MUX[uxn_opcodes_h_l2817_c2_9763]
signal is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2818_c11_a462]
signal BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2818_c1_f1a1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2819_c7_b43e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2818_c7_2ba7]
signal opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2818_c40_927c]
signal jci_uxn_opcodes_h_l2818_c40_927c_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2818_c40_927c_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2818_c40_927c_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2818_c40_927c_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2818_c40_927c_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2818_c40_927c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2819_c11_5153]
signal BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2819_c1_d0e5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2820_c7_712e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2819_c7_b43e]
signal opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2819_c40_3494]
signal jmi_uxn_opcodes_h_l2819_c40_3494_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2819_c40_3494_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2819_c40_3494_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2819_c40_3494_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2819_c40_3494_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2820_c11_8a1e]
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2820_c1_e9bd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2821_c7_bfd5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2820_c7_712e]
signal opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2820_c40_29da]
signal jsi_uxn_opcodes_h_l2820_c40_29da_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2820_c40_29da_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2820_c40_29da_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2820_c40_29da_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2820_c40_29da_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2821_c11_30a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2821_c1_b41f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2822_c7_705c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2821_c7_bfd5]
signal opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2821_c40_1486]
signal lit_uxn_opcodes_h_l2821_c40_1486_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2821_c40_1486_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2821_c40_1486_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2821_c40_1486_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2821_c40_1486_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2822_c11_ef66]
signal BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2822_c1_1982]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2823_c7_3341]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2822_c7_705c]
signal opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2822_c40_03f9]
signal lit2_uxn_opcodes_h_l2822_c40_03f9_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2822_c40_03f9_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2822_c40_03f9_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2822_c40_03f9_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2822_c40_03f9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2823_c11_7300]
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2823_c1_8a2e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2824_c7_276a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2823_c7_3341]
signal opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2823_c40_f67e]
signal lit_uxn_opcodes_h_l2823_c40_f67e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2823_c40_f67e_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2823_c40_f67e_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2823_c40_f67e_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2823_c40_f67e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2824_c11_feac]
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2824_c1_9c64]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2825_c7_7461]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2824_c7_276a]
signal opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2824_c40_e6d9]
signal lit2_uxn_opcodes_h_l2824_c40_e6d9_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2824_c40_e6d9_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2824_c40_e6d9_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2824_c40_e6d9_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2824_c40_e6d9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2825_c11_d412]
signal BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2825_c1_10bf]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2826_c7_58a9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2825_c7_7461]
signal opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2825_c40_67e1]
signal inc_uxn_opcodes_h_l2825_c40_67e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2825_c40_67e1_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2825_c40_67e1_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2825_c40_67e1_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2825_c40_67e1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2826_c11_9958]
signal BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2826_c1_2dda]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2827_c7_9e41]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2826_c7_58a9]
signal opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2826_c40_6c0b]
signal inc2_uxn_opcodes_h_l2826_c40_6c0b_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2826_c40_6c0b_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2826_c40_6c0b_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2826_c40_6c0b_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2826_c40_6c0b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2827_c11_c5e3]
signal BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2827_c1_a6eb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2828_c7_8eb7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2827_c7_9e41]
signal opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2827_c40_f7dd]
signal pop_uxn_opcodes_h_l2827_c40_f7dd_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2827_c40_f7dd_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2827_c40_f7dd_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2827_c40_f7dd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2828_c11_5bc3]
signal BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2828_c1_5948]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2829_c7_751d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2828_c7_8eb7]
signal opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2828_c40_6749]
signal pop2_uxn_opcodes_h_l2828_c40_6749_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2828_c40_6749_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2828_c40_6749_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2828_c40_6749_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2829_c11_a0ed]
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2829_c1_dbec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2830_c7_2548]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2829_c7_751d]
signal opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2829_c40_1bc5]
signal nip_uxn_opcodes_h_l2829_c40_1bc5_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2829_c40_1bc5_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2829_c40_1bc5_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2829_c40_1bc5_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2829_c40_1bc5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2830_c11_8bf1]
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2830_c1_2c92]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2831_c7_42e0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2830_c7_2548]
signal opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2830_c40_bda0]
signal nip2_uxn_opcodes_h_l2830_c40_bda0_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2830_c40_bda0_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2830_c40_bda0_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2830_c40_bda0_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2830_c40_bda0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2831_c11_c6d6]
signal BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2831_c1_c140]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2832_c7_a31f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2831_c7_42e0]
signal opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2831_c40_e273]
signal swp_uxn_opcodes_h_l2831_c40_e273_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2831_c40_e273_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2831_c40_e273_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2831_c40_e273_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2831_c40_e273_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2832_c11_f6da]
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2832_c1_b4b9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2833_c7_7f72]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2832_c7_a31f]
signal opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2832_c40_c0c6]
signal swp2_uxn_opcodes_h_l2832_c40_c0c6_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2832_c40_c0c6_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2832_c40_c0c6_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2832_c40_c0c6_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2832_c40_c0c6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2833_c11_3b98]
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2833_c1_bc02]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2834_c7_afc9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2833_c7_7f72]
signal opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2833_c40_e33c]
signal rot_uxn_opcodes_h_l2833_c40_e33c_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2833_c40_e33c_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2833_c40_e33c_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2833_c40_e33c_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2833_c40_e33c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2834_c11_2f2f]
signal BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2834_c1_74df]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2835_c7_c061]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2834_c7_afc9]
signal opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2834_c40_83d2]
signal rot2_uxn_opcodes_h_l2834_c40_83d2_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2834_c40_83d2_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2834_c40_83d2_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2834_c40_83d2_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2834_c40_83d2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2835_c11_701b]
signal BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2835_c1_4fd8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2836_c7_44e6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2835_c7_c061]
signal opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2835_c40_f699]
signal dup_uxn_opcodes_h_l2835_c40_f699_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2835_c40_f699_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2835_c40_f699_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2835_c40_f699_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2835_c40_f699_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2836_c11_0477]
signal BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2836_c1_b2de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2837_c7_79bd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2836_c7_44e6]
signal opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2836_c40_239a]
signal dup2_uxn_opcodes_h_l2836_c40_239a_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2836_c40_239a_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2836_c40_239a_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2836_c40_239a_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2836_c40_239a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2837_c11_6896]
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2837_c1_1767]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2838_c7_f0eb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2837_c7_79bd]
signal opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2837_c40_df96]
signal ovr_uxn_opcodes_h_l2837_c40_df96_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2837_c40_df96_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2837_c40_df96_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2837_c40_df96_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2837_c40_df96_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2838_c11_e4b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2838_c1_a194]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2839_c7_a980]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2838_c7_f0eb]
signal opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2838_c40_967c]
signal ovr2_uxn_opcodes_h_l2838_c40_967c_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2838_c40_967c_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2838_c40_967c_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2838_c40_967c_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2838_c40_967c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2839_c11_e192]
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2839_c1_6f8c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2840_c7_40ce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2839_c7_a980]
signal opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2839_c40_bc0e]
signal equ_uxn_opcodes_h_l2839_c40_bc0e_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2839_c40_bc0e_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2839_c40_bc0e_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2839_c40_bc0e_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2839_c40_bc0e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2840_c11_3ba4]
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2840_c1_e2a5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2841_c7_3fa5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2840_c7_40ce]
signal opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2840_c40_bd97]
signal equ2_uxn_opcodes_h_l2840_c40_bd97_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2840_c40_bd97_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2840_c40_bd97_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2840_c40_bd97_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2840_c40_bd97_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2841_c11_d8d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2841_c1_86b9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2842_c7_9c87]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2841_c7_3fa5]
signal opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2841_c40_cd3c]
signal neq_uxn_opcodes_h_l2841_c40_cd3c_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2841_c40_cd3c_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2841_c40_cd3c_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2841_c40_cd3c_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2841_c40_cd3c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2842_c11_54fd]
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2842_c1_dda2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2843_c7_9340]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2842_c7_9c87]
signal opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2842_c40_9ae9]
signal neq2_uxn_opcodes_h_l2842_c40_9ae9_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2842_c40_9ae9_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2842_c40_9ae9_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2842_c40_9ae9_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2842_c40_9ae9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2843_c11_aab9]
signal BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2843_c1_62e6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2844_c7_bdbf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2843_c7_9340]
signal opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2843_c40_2acd]
signal gth_uxn_opcodes_h_l2843_c40_2acd_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2843_c40_2acd_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2843_c40_2acd_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2843_c40_2acd_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2843_c40_2acd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2844_c11_83cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2844_c1_e8d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2845_c7_385f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2844_c7_bdbf]
signal opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2844_c40_c85b]
signal gth2_uxn_opcodes_h_l2844_c40_c85b_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2844_c40_c85b_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2844_c40_c85b_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2844_c40_c85b_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2844_c40_c85b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2845_c11_4aa4]
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2845_c1_4f32]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2846_c7_2785]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2845_c7_385f]
signal opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2845_c40_131f]
signal lth_uxn_opcodes_h_l2845_c40_131f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2845_c40_131f_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2845_c40_131f_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2845_c40_131f_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2845_c40_131f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2846_c11_1b89]
signal BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2846_c1_04f5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2847_c7_c67e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2846_c7_2785]
signal opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2846_c40_6a95]
signal lth2_uxn_opcodes_h_l2846_c40_6a95_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2846_c40_6a95_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2846_c40_6a95_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2846_c40_6a95_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2846_c40_6a95_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2847_c11_fe6f]
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2847_c1_71bd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2848_c7_e78f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2847_c7_c67e]
signal opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2847_c40_b3e1]
signal jmp_uxn_opcodes_h_l2847_c40_b3e1_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2847_c40_b3e1_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2847_c40_b3e1_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2847_c40_b3e1_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2847_c40_b3e1_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2847_c40_b3e1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2848_c11_4d89]
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2848_c1_d52d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2849_c7_5649]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2848_c7_e78f]
signal opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2848_c40_1a5a]
signal jmp2_uxn_opcodes_h_l2848_c40_1a5a_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2848_c40_1a5a_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2848_c40_1a5a_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2848_c40_1a5a_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2848_c40_1a5a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2849_c11_eb9c]
signal BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2849_c1_7cad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2850_c7_2eff]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2849_c7_5649]
signal opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2849_c40_0ac1]
signal jcn_uxn_opcodes_h_l2849_c40_0ac1_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2849_c40_0ac1_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2849_c40_0ac1_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2849_c40_0ac1_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2849_c40_0ac1_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2849_c40_0ac1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2850_c11_9b1f]
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2850_c1_bcc4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2851_c7_ad1b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2850_c7_2eff]
signal opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2850_c40_02a3]
signal jcn2_uxn_opcodes_h_l2850_c40_02a3_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2850_c40_02a3_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2850_c40_02a3_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2850_c40_02a3_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2850_c40_02a3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2851_c11_6d61]
signal BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2851_c1_b724]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2852_c7_8795]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2851_c7_ad1b]
signal opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2851_c40_730a]
signal jsr_uxn_opcodes_h_l2851_c40_730a_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2851_c40_730a_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2851_c40_730a_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2851_c40_730a_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2851_c40_730a_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2851_c40_730a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2852_c11_d58a]
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2852_c1_3a42]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2853_c7_1c7f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2852_c7_8795]
signal opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2852_c40_ae45]
signal jsr2_uxn_opcodes_h_l2852_c40_ae45_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2852_c40_ae45_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2852_c40_ae45_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2852_c40_ae45_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2852_c40_ae45_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2852_c40_ae45_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2853_c11_f2f8]
signal BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2853_c1_6b36]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2854_c7_5d9c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2853_c7_1c7f]
signal opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2853_c40_b08a]
signal sth_uxn_opcodes_h_l2853_c40_b08a_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2853_c40_b08a_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2853_c40_b08a_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2853_c40_b08a_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2853_c40_b08a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2854_c11_1d6d]
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2854_c1_d4af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2855_c7_9b3c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2854_c7_5d9c]
signal opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2854_c40_c1f0]
signal sth2_uxn_opcodes_h_l2854_c40_c1f0_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2854_c40_c1f0_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2854_c40_c1f0_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2854_c40_c1f0_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2854_c40_c1f0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2855_c11_7df2]
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2855_c1_0ce2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2856_c7_bfb0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2855_c7_9b3c]
signal opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2855_c40_a251]
signal ldz_uxn_opcodes_h_l2855_c40_a251_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2855_c40_a251_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2855_c40_a251_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2855_c40_a251_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2855_c40_a251_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2855_c40_a251_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2856_c11_078b]
signal BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2856_c1_76ad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2857_c7_9d3f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2856_c7_bfb0]
signal opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2856_c40_9859]
signal ldz2_uxn_opcodes_h_l2856_c40_9859_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2856_c40_9859_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2856_c40_9859_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2856_c40_9859_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2856_c40_9859_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2856_c40_9859_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2857_c11_5b24]
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2857_c1_65ab]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2858_c7_38f4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2857_c7_9d3f]
signal opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2857_c40_380c]
signal stz_uxn_opcodes_h_l2857_c40_380c_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2857_c40_380c_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2857_c40_380c_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2857_c40_380c_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2857_c40_380c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2858_c11_4373]
signal BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2858_c1_356f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2859_c7_146b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2858_c7_38f4]
signal opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2858_c40_7211]
signal stz2_uxn_opcodes_h_l2858_c40_7211_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2858_c40_7211_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2858_c40_7211_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2858_c40_7211_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2858_c40_7211_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2859_c11_792e]
signal BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2859_c1_a814]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2860_c7_1b4a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2859_c7_146b]
signal opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2859_c40_436d]
signal ldr_uxn_opcodes_h_l2859_c40_436d_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2859_c40_436d_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2859_c40_436d_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2859_c40_436d_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2859_c40_436d_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2859_c40_436d_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2859_c40_436d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2860_c11_f0e5]
signal BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2860_c1_d131]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2861_c7_5158]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2860_c7_1b4a]
signal opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2860_c40_8704]
signal ldr2_uxn_opcodes_h_l2860_c40_8704_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2860_c40_8704_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2860_c40_8704_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2860_c40_8704_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2860_c40_8704_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2860_c40_8704_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2860_c40_8704_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2861_c11_3fee]
signal BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2861_c1_e1b0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2862_c7_8f38]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2861_c7_5158]
signal opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2861_c40_33aa]
signal str1_uxn_opcodes_h_l2861_c40_33aa_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2861_c40_33aa_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2861_c40_33aa_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2861_c40_33aa_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2861_c40_33aa_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2861_c40_33aa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2862_c11_d1e8]
signal BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2862_c1_49b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2863_c7_d4ce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2862_c7_8f38]
signal opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2862_c40_4157]
signal str2_uxn_opcodes_h_l2862_c40_4157_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2862_c40_4157_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2862_c40_4157_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2862_c40_4157_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2862_c40_4157_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2862_c40_4157_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2863_c11_1700]
signal BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2863_c1_7a5b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2864_c7_fdea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2863_c7_d4ce]
signal opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2863_c40_0529]
signal lda_uxn_opcodes_h_l2863_c40_0529_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2863_c40_0529_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2863_c40_0529_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2863_c40_0529_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2863_c40_0529_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2863_c40_0529_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2864_c11_4c2e]
signal BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2864_c1_ec03]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2865_c7_8f99]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2864_c7_fdea]
signal opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2864_c40_a0e8]
signal lda2_uxn_opcodes_h_l2864_c40_a0e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2864_c40_a0e8_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2864_c40_a0e8_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2864_c40_a0e8_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2864_c40_a0e8_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2864_c40_a0e8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2865_c11_b532]
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2865_c1_b844]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2866_c7_8dec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2865_c7_8f99]
signal opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2865_c40_2567]
signal sta_uxn_opcodes_h_l2865_c40_2567_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2865_c40_2567_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2865_c40_2567_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2865_c40_2567_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2865_c40_2567_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2866_c11_8dec]
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2866_c1_39a3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2867_c7_e985]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2866_c7_8dec]
signal opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2866_c40_2d1f]
signal sta2_uxn_opcodes_h_l2866_c40_2d1f_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2866_c40_2d1f_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2866_c40_2d1f_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2866_c40_2d1f_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2866_c40_2d1f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2867_c11_bc10]
signal BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2867_c1_9fd2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2868_c7_bdaa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2867_c7_e985]
signal opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2867_c40_fba3]
signal dei_uxn_opcodes_h_l2867_c40_fba3_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2867_c40_fba3_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2867_c40_fba3_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2867_c40_fba3_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2867_c40_fba3_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2867_c40_fba3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2868_c11_a3d0]
signal BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2868_c1_fdfc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2869_c7_1f92]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2868_c7_bdaa]
signal opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2868_c40_9692]
signal dei2_uxn_opcodes_h_l2868_c40_9692_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2868_c40_9692_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2868_c40_9692_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2868_c40_9692_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2868_c40_9692_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2868_c40_9692_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2869_c11_7660]
signal BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2869_c1_dea5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2870_c7_b2f3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2869_c7_1f92]
signal opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2869_c40_d4fb]
signal deo_uxn_opcodes_h_l2869_c40_d4fb_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2869_c40_d4fb_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2869_c40_d4fb_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2869_c40_d4fb_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2869_c40_d4fb_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2869_c40_d4fb_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2869_c40_d4fb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2870_c11_99a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2870_c1_35a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2871_c7_47fb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2870_c7_b2f3]
signal opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2870_c40_7868]
signal deo2_uxn_opcodes_h_l2870_c40_7868_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2870_c40_7868_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2870_c40_7868_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2870_c40_7868_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2870_c40_7868_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2870_c40_7868_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2870_c40_7868_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2871_c11_443c]
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2871_c1_543a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c7_4012]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2871_c7_47fb]
signal opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2871_c40_ae3f]
signal add_uxn_opcodes_h_l2871_c40_ae3f_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2871_c40_ae3f_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2871_c40_ae3f_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2871_c40_ae3f_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2871_c40_ae3f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2872_c11_4581]
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c1_e27c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_2dbc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2872_c7_4012]
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2872_c40_b287]
signal add2_uxn_opcodes_h_l2872_c40_b287_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2872_c40_b287_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2872_c40_b287_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2872_c40_b287_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2872_c40_b287_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_9541]
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_cd60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_6ee6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2873_c7_2dbc]
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2873_c40_bdc7]
signal sub_uxn_opcodes_h_l2873_c40_bdc7_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2873_c40_bdc7_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2873_c40_bdc7_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2873_c40_bdc7_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2873_c40_bdc7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_e16e]
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_216d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_71f8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2874_c7_6ee6]
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2874_c40_06d3]
signal sub2_uxn_opcodes_h_l2874_c40_06d3_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2874_c40_06d3_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2874_c40_06d3_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2874_c40_06d3_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2874_c40_06d3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_0536]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_21b7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_76ca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2875_c7_71f8]
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2875_c40_b31e]
signal mul_uxn_opcodes_h_l2875_c40_b31e_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2875_c40_b31e_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2875_c40_b31e_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2875_c40_b31e_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2875_c40_b31e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_46f2]
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_62de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_2b75]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2876_c7_76ca]
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2876_c40_7859]
signal mul2_uxn_opcodes_h_l2876_c40_7859_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2876_c40_7859_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2876_c40_7859_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2876_c40_7859_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2876_c40_7859_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_faae]
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_c562]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_c6ad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2877_c7_2b75]
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2877_c40_e2a6]
signal div_uxn_opcodes_h_l2877_c40_e2a6_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2877_c40_e2a6_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2877_c40_e2a6_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2877_c40_e2a6_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2877_c40_e2a6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_a07c]
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_5f97]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_1f24]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2878_c7_c6ad]
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2878_c40_d5d3]
signal div2_uxn_opcodes_h_l2878_c40_d5d3_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2878_c40_d5d3_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2878_c40_d5d3_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2878_c40_d5d3_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2878_c40_d5d3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_f12d]
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_e3af]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_db38]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2879_c7_1f24]
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2879_c40_23d4]
signal and_uxn_opcodes_h_l2879_c40_23d4_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2879_c40_23d4_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2879_c40_23d4_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2879_c40_23d4_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2879_c40_23d4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_3099]
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_3a5e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_340f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2880_c7_db38]
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2880_c40_7c81]
signal and2_uxn_opcodes_h_l2880_c40_7c81_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2880_c40_7c81_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2880_c40_7c81_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2880_c40_7c81_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2880_c40_7c81_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_d4aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_f94c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_ec71]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2881_c7_340f]
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2881_c40_d7fb]
signal ora_uxn_opcodes_h_l2881_c40_d7fb_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2881_c40_d7fb_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2881_c40_d7fb_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2881_c40_d7fb_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2881_c40_d7fb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_a96d]
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_7c5d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_9c26]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2882_c7_ec71]
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2882_c40_a3ba]
signal ora2_uxn_opcodes_h_l2882_c40_a3ba_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2882_c40_a3ba_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2882_c40_a3ba_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2882_c40_a3ba_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2882_c40_a3ba_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_3d35]
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_028a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_0d1b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2883_c7_9c26]
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2883_c40_770b]
signal eor_uxn_opcodes_h_l2883_c40_770b_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2883_c40_770b_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2883_c40_770b_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2883_c40_770b_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2883_c40_770b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_3a52]
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_a02a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_fbe5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2884_c7_0d1b]
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2884_c40_db9e]
signal eor2_uxn_opcodes_h_l2884_c40_db9e_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2884_c40_db9e_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2884_c40_db9e_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2884_c40_db9e_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2884_c40_db9e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_8d76]
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_06fd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_315f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2885_c7_fbe5]
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2885_c40_0c28]
signal sft_uxn_opcodes_h_l2885_c40_0c28_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2885_c40_0c28_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2885_c40_0c28_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2885_c40_0c28_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2885_c40_0c28_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_d522]
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_0957]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2886_c7_315f]
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2886_c40_88c2]
signal sft2_uxn_opcodes_h_l2886_c40_88c2_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2886_c40_88c2_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2886_c40_88c2_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2886_c40_88c2_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2886_c40_88c2_return_output : opcode_result_t;

-- BIN_OP_AND[uxn_opcodes_h_l2889_c17_cdc0]
signal BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_opcodes_h_l2889_c17_b291]
signal CONST_SR_6_uxn_opcodes_h_l2889_c17_b291_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_opcodes_h_l2889_c17_b291_return_output : unsigned(7 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2890_c2_1454]
signal BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_return_output : unsigned(0 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2892_c2_b006]
signal sp1_MUX_uxn_opcodes_h_l2892_c2_b006_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2892_c2_b006_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2892_c2_b006_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2892_c2_b006_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2892_c2_b006]
signal sp0_MUX_uxn_opcodes_h_l2892_c2_b006_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2892_c2_b006_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2892_c2_b006_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2892_c2_b006_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2893_c3_7084]
signal BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2895_c3_91e5]
signal BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2898_c29_e6ea]
signal MUX_uxn_opcodes_h_l2898_c29_e6ea_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2898_c29_e6ea_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2898_c29_e6ea_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2898_c29_e6ea_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2898_c19_7d2f]
signal BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_left : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_right : unsigned(8 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_return_output : unsigned(8 downto 0);

-- MUX[uxn_opcodes_h_l2899_c20_b3ed]
signal MUX_uxn_opcodes_h_l2899_c20_b3ed_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2899_c20_b3ed_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2899_c20_b3ed_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2899_c20_b3ed_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2899_c2_9943]
signal BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_left : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_return_output : unsigned(9 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2901_c24_20b4]
signal stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_stack_address : unsigned(8 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3
BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_left,
BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_right,
BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1
BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1 : entity work.BIN_OP_XOR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_left,
BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_right,
BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632
BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_left,
BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_right,
BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_return_output);

-- UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a
UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a : entity work.UNARY_OP_NOT_uint8_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a_expr,
UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a_return_output);

-- BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f
BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f : entity work.BIN_OP_NEQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_left,
BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_right,
BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_return_output);

-- MUX_uxn_opcodes_h_l2810_c14_ea88
MUX_uxn_opcodes_h_l2810_c14_ea88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2810_c14_ea88_cond,
MUX_uxn_opcodes_h_l2810_c14_ea88_iftrue,
MUX_uxn_opcodes_h_l2810_c14_ea88_iffalse,
MUX_uxn_opcodes_h_l2810_c14_ea88_return_output);

-- MUX_uxn_opcodes_h_l2811_c8_cea1
MUX_uxn_opcodes_h_l2811_c8_cea1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2811_c8_cea1_cond,
MUX_uxn_opcodes_h_l2811_c8_cea1_iftrue,
MUX_uxn_opcodes_h_l2811_c8_cea1_iffalse,
MUX_uxn_opcodes_h_l2811_c8_cea1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722
BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_left,
BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_right,
BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2817_c2_9763
opc_result_MUX_uxn_opcodes_h_l2817_c2_9763 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_cond,
opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_iftrue,
opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_iffalse,
opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2817_c2_9763
is_wait_MUX_uxn_opcodes_h_l2817_c2_9763 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_cond,
is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_iftrue,
is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_iffalse,
is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462
BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_left,
BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_right,
BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7
opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_cond,
opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output);

-- jci_uxn_opcodes_h_l2818_c40_927c
jci_uxn_opcodes_h_l2818_c40_927c : entity work.jci_0CLK_3045e391 port map (
clk,
jci_uxn_opcodes_h_l2818_c40_927c_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2818_c40_927c_phase,
jci_uxn_opcodes_h_l2818_c40_927c_pc,
jci_uxn_opcodes_h_l2818_c40_927c_previous_stack_read,
jci_uxn_opcodes_h_l2818_c40_927c_previous_ram_read,
jci_uxn_opcodes_h_l2818_c40_927c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153
BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_left,
BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_right,
BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e
opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_cond,
opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output);

-- jmi_uxn_opcodes_h_l2819_c40_3494
jmi_uxn_opcodes_h_l2819_c40_3494 : entity work.jmi_0CLK_fa355561 port map (
clk,
jmi_uxn_opcodes_h_l2819_c40_3494_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2819_c40_3494_phase,
jmi_uxn_opcodes_h_l2819_c40_3494_pc,
jmi_uxn_opcodes_h_l2819_c40_3494_previous_ram_read,
jmi_uxn_opcodes_h_l2819_c40_3494_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_left,
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_right,
BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2820_c7_712e
opc_result_MUX_uxn_opcodes_h_l2820_c7_712e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_cond,
opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_return_output);

-- jsi_uxn_opcodes_h_l2820_c40_29da
jsi_uxn_opcodes_h_l2820_c40_29da : entity work.jsi_0CLK_edc09f97 port map (
clk,
jsi_uxn_opcodes_h_l2820_c40_29da_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2820_c40_29da_phase,
jsi_uxn_opcodes_h_l2820_c40_29da_pc,
jsi_uxn_opcodes_h_l2820_c40_29da_previous_ram_read,
jsi_uxn_opcodes_h_l2820_c40_29da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5
opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_cond,
opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output);

-- lit_uxn_opcodes_h_l2821_c40_1486
lit_uxn_opcodes_h_l2821_c40_1486 : entity work.lit_0CLK_62591bf8 port map (
clk,
lit_uxn_opcodes_h_l2821_c40_1486_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2821_c40_1486_phase,
lit_uxn_opcodes_h_l2821_c40_1486_pc,
lit_uxn_opcodes_h_l2821_c40_1486_previous_ram_read,
lit_uxn_opcodes_h_l2821_c40_1486_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66
BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_left,
BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_right,
BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2822_c7_705c
opc_result_MUX_uxn_opcodes_h_l2822_c7_705c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_cond,
opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_return_output);

-- lit2_uxn_opcodes_h_l2822_c40_03f9
lit2_uxn_opcodes_h_l2822_c40_03f9 : entity work.lit2_0CLK_d6c995e8 port map (
clk,
lit2_uxn_opcodes_h_l2822_c40_03f9_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2822_c40_03f9_phase,
lit2_uxn_opcodes_h_l2822_c40_03f9_pc,
lit2_uxn_opcodes_h_l2822_c40_03f9_previous_ram_read,
lit2_uxn_opcodes_h_l2822_c40_03f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_left,
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_right,
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2823_c7_3341
opc_result_MUX_uxn_opcodes_h_l2823_c7_3341 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_cond,
opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_iftrue,
opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_iffalse,
opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_return_output);

-- lit_uxn_opcodes_h_l2823_c40_f67e
lit_uxn_opcodes_h_l2823_c40_f67e : entity work.lit_0CLK_62591bf8 port map (
clk,
lit_uxn_opcodes_h_l2823_c40_f67e_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2823_c40_f67e_phase,
lit_uxn_opcodes_h_l2823_c40_f67e_pc,
lit_uxn_opcodes_h_l2823_c40_f67e_previous_ram_read,
lit_uxn_opcodes_h_l2823_c40_f67e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac
BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_left,
BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_right,
BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2824_c7_276a
opc_result_MUX_uxn_opcodes_h_l2824_c7_276a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_cond,
opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_return_output);

-- lit2_uxn_opcodes_h_l2824_c40_e6d9
lit2_uxn_opcodes_h_l2824_c40_e6d9 : entity work.lit2_0CLK_d6c995e8 port map (
clk,
lit2_uxn_opcodes_h_l2824_c40_e6d9_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2824_c40_e6d9_phase,
lit2_uxn_opcodes_h_l2824_c40_e6d9_pc,
lit2_uxn_opcodes_h_l2824_c40_e6d9_previous_ram_read,
lit2_uxn_opcodes_h_l2824_c40_e6d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_left,
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_right,
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2825_c7_7461
opc_result_MUX_uxn_opcodes_h_l2825_c7_7461 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_cond,
opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_iftrue,
opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_iffalse,
opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_return_output);

-- inc_uxn_opcodes_h_l2825_c40_67e1
inc_uxn_opcodes_h_l2825_c40_67e1 : entity work.inc_0CLK_348f0530 port map (
clk,
inc_uxn_opcodes_h_l2825_c40_67e1_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2825_c40_67e1_phase,
inc_uxn_opcodes_h_l2825_c40_67e1_ins,
inc_uxn_opcodes_h_l2825_c40_67e1_previous_stack_read,
inc_uxn_opcodes_h_l2825_c40_67e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_left,
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_right,
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9
opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_cond,
opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output);

-- inc2_uxn_opcodes_h_l2826_c40_6c0b
inc2_uxn_opcodes_h_l2826_c40_6c0b : entity work.inc2_0CLK_263c9bc8 port map (
clk,
inc2_uxn_opcodes_h_l2826_c40_6c0b_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2826_c40_6c0b_phase,
inc2_uxn_opcodes_h_l2826_c40_6c0b_ins,
inc2_uxn_opcodes_h_l2826_c40_6c0b_previous_stack_read,
inc2_uxn_opcodes_h_l2826_c40_6c0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_left,
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_right,
BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41
opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_cond,
opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_iftrue,
opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_iffalse,
opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output);

-- pop_uxn_opcodes_h_l2827_c40_f7dd
pop_uxn_opcodes_h_l2827_c40_f7dd : entity work.pop_0CLK_44d1c6cd port map (
clk,
pop_uxn_opcodes_h_l2827_c40_f7dd_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2827_c40_f7dd_phase,
pop_uxn_opcodes_h_l2827_c40_f7dd_ins,
pop_uxn_opcodes_h_l2827_c40_f7dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_left,
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_right,
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7
opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_cond,
opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output);

-- pop2_uxn_opcodes_h_l2828_c40_6749
pop2_uxn_opcodes_h_l2828_c40_6749 : entity work.pop2_0CLK_44d1c6cd port map (
clk,
pop2_uxn_opcodes_h_l2828_c40_6749_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2828_c40_6749_phase,
pop2_uxn_opcodes_h_l2828_c40_6749_ins,
pop2_uxn_opcodes_h_l2828_c40_6749_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_left,
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_right,
BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2829_c7_751d
opc_result_MUX_uxn_opcodes_h_l2829_c7_751d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_cond,
opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_return_output);

-- nip_uxn_opcodes_h_l2829_c40_1bc5
nip_uxn_opcodes_h_l2829_c40_1bc5 : entity work.nip_0CLK_e622bfee port map (
clk,
nip_uxn_opcodes_h_l2829_c40_1bc5_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2829_c40_1bc5_phase,
nip_uxn_opcodes_h_l2829_c40_1bc5_ins,
nip_uxn_opcodes_h_l2829_c40_1bc5_previous_stack_read,
nip_uxn_opcodes_h_l2829_c40_1bc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_left,
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_right,
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2830_c7_2548
opc_result_MUX_uxn_opcodes_h_l2830_c7_2548 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_cond,
opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_iftrue,
opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_iffalse,
opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_return_output);

-- nip2_uxn_opcodes_h_l2830_c40_bda0
nip2_uxn_opcodes_h_l2830_c40_bda0 : entity work.nip2_0CLK_b2fbb329 port map (
clk,
nip2_uxn_opcodes_h_l2830_c40_bda0_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2830_c40_bda0_phase,
nip2_uxn_opcodes_h_l2830_c40_bda0_ins,
nip2_uxn_opcodes_h_l2830_c40_bda0_previous_stack_read,
nip2_uxn_opcodes_h_l2830_c40_bda0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6
BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_left,
BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_right,
BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0
opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_cond,
opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output);

-- swp_uxn_opcodes_h_l2831_c40_e273
swp_uxn_opcodes_h_l2831_c40_e273 : entity work.swp_0CLK_64d180f1 port map (
clk,
swp_uxn_opcodes_h_l2831_c40_e273_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2831_c40_e273_phase,
swp_uxn_opcodes_h_l2831_c40_e273_ins,
swp_uxn_opcodes_h_l2831_c40_e273_previous_stack_read,
swp_uxn_opcodes_h_l2831_c40_e273_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_left,
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_right,
BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f
opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_cond,
opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output);

-- swp2_uxn_opcodes_h_l2832_c40_c0c6
swp2_uxn_opcodes_h_l2832_c40_c0c6 : entity work.swp2_0CLK_c741f800 port map (
clk,
swp2_uxn_opcodes_h_l2832_c40_c0c6_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2832_c40_c0c6_phase,
swp2_uxn_opcodes_h_l2832_c40_c0c6_ins,
swp2_uxn_opcodes_h_l2832_c40_c0c6_previous_stack_read,
swp2_uxn_opcodes_h_l2832_c40_c0c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_left,
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_right,
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72
opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_cond,
opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_iftrue,
opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_iffalse,
opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output);

-- rot_uxn_opcodes_h_l2833_c40_e33c
rot_uxn_opcodes_h_l2833_c40_e33c : entity work.rot_0CLK_57104a4d port map (
clk,
rot_uxn_opcodes_h_l2833_c40_e33c_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2833_c40_e33c_phase,
rot_uxn_opcodes_h_l2833_c40_e33c_ins,
rot_uxn_opcodes_h_l2833_c40_e33c_previous_stack_read,
rot_uxn_opcodes_h_l2833_c40_e33c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_left,
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_right,
BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9
opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_cond,
opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_iftrue,
opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_iffalse,
opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output);

-- rot2_uxn_opcodes_h_l2834_c40_83d2
rot2_uxn_opcodes_h_l2834_c40_83d2 : entity work.rot2_0CLK_80c65d32 port map (
clk,
rot2_uxn_opcodes_h_l2834_c40_83d2_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2834_c40_83d2_phase,
rot2_uxn_opcodes_h_l2834_c40_83d2_ins,
rot2_uxn_opcodes_h_l2834_c40_83d2_previous_stack_read,
rot2_uxn_opcodes_h_l2834_c40_83d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b
BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_left,
BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_right,
BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2835_c7_c061
opc_result_MUX_uxn_opcodes_h_l2835_c7_c061 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_cond,
opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_iftrue,
opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_iffalse,
opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_return_output);

-- dup_uxn_opcodes_h_l2835_c40_f699
dup_uxn_opcodes_h_l2835_c40_f699 : entity work.dup_0CLK_d0ab213f port map (
clk,
dup_uxn_opcodes_h_l2835_c40_f699_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2835_c40_f699_phase,
dup_uxn_opcodes_h_l2835_c40_f699_ins,
dup_uxn_opcodes_h_l2835_c40_f699_previous_stack_read,
dup_uxn_opcodes_h_l2835_c40_f699_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477
BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_left,
BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_right,
BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6
opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_cond,
opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output);

-- dup2_uxn_opcodes_h_l2836_c40_239a
dup2_uxn_opcodes_h_l2836_c40_239a : entity work.dup2_0CLK_3554410e port map (
clk,
dup2_uxn_opcodes_h_l2836_c40_239a_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2836_c40_239a_phase,
dup2_uxn_opcodes_h_l2836_c40_239a_ins,
dup2_uxn_opcodes_h_l2836_c40_239a_previous_stack_read,
dup2_uxn_opcodes_h_l2836_c40_239a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_left,
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_right,
BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd
opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_cond,
opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output);

-- ovr_uxn_opcodes_h_l2837_c40_df96
ovr_uxn_opcodes_h_l2837_c40_df96 : entity work.ovr_0CLK_282a76ca port map (
clk,
ovr_uxn_opcodes_h_l2837_c40_df96_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2837_c40_df96_phase,
ovr_uxn_opcodes_h_l2837_c40_df96_ins,
ovr_uxn_opcodes_h_l2837_c40_df96_previous_stack_read,
ovr_uxn_opcodes_h_l2837_c40_df96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2
BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb
opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_cond,
opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output);

-- ovr2_uxn_opcodes_h_l2838_c40_967c
ovr2_uxn_opcodes_h_l2838_c40_967c : entity work.ovr2_0CLK_7ae47ab3 port map (
clk,
ovr2_uxn_opcodes_h_l2838_c40_967c_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2838_c40_967c_phase,
ovr2_uxn_opcodes_h_l2838_c40_967c_ins,
ovr2_uxn_opcodes_h_l2838_c40_967c_previous_stack_read,
ovr2_uxn_opcodes_h_l2838_c40_967c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_left,
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_right,
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2839_c7_a980
opc_result_MUX_uxn_opcodes_h_l2839_c7_a980 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_cond,
opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_iftrue,
opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_iffalse,
opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_return_output);

-- equ_uxn_opcodes_h_l2839_c40_bc0e
equ_uxn_opcodes_h_l2839_c40_bc0e : entity work.equ_0CLK_7883ef49 port map (
clk,
equ_uxn_opcodes_h_l2839_c40_bc0e_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2839_c40_bc0e_phase,
equ_uxn_opcodes_h_l2839_c40_bc0e_ins,
equ_uxn_opcodes_h_l2839_c40_bc0e_previous_stack_read,
equ_uxn_opcodes_h_l2839_c40_bc0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_left,
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_right,
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce
opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_cond,
opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_iftrue,
opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_iffalse,
opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output);

-- equ2_uxn_opcodes_h_l2840_c40_bd97
equ2_uxn_opcodes_h_l2840_c40_bd97 : entity work.equ2_0CLK_0226dad5 port map (
clk,
equ2_uxn_opcodes_h_l2840_c40_bd97_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2840_c40_bd97_phase,
equ2_uxn_opcodes_h_l2840_c40_bd97_ins,
equ2_uxn_opcodes_h_l2840_c40_bd97_previous_stack_read,
equ2_uxn_opcodes_h_l2840_c40_bd97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0
BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5
opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_cond,
opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output);

-- neq_uxn_opcodes_h_l2841_c40_cd3c
neq_uxn_opcodes_h_l2841_c40_cd3c : entity work.neq_0CLK_7883ef49 port map (
clk,
neq_uxn_opcodes_h_l2841_c40_cd3c_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2841_c40_cd3c_phase,
neq_uxn_opcodes_h_l2841_c40_cd3c_ins,
neq_uxn_opcodes_h_l2841_c40_cd3c_previous_stack_read,
neq_uxn_opcodes_h_l2841_c40_cd3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_left,
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_right,
BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87
opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_cond,
opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_iftrue,
opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_iffalse,
opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output);

-- neq2_uxn_opcodes_h_l2842_c40_9ae9
neq2_uxn_opcodes_h_l2842_c40_9ae9 : entity work.neq2_0CLK_0226dad5 port map (
clk,
neq2_uxn_opcodes_h_l2842_c40_9ae9_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2842_c40_9ae9_phase,
neq2_uxn_opcodes_h_l2842_c40_9ae9_ins,
neq2_uxn_opcodes_h_l2842_c40_9ae9_previous_stack_read,
neq2_uxn_opcodes_h_l2842_c40_9ae9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9
BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_left,
BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_right,
BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2843_c7_9340
opc_result_MUX_uxn_opcodes_h_l2843_c7_9340 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_cond,
opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_iftrue,
opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_iffalse,
opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_return_output);

-- gth_uxn_opcodes_h_l2843_c40_2acd
gth_uxn_opcodes_h_l2843_c40_2acd : entity work.gth_0CLK_7883ef49 port map (
clk,
gth_uxn_opcodes_h_l2843_c40_2acd_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2843_c40_2acd_phase,
gth_uxn_opcodes_h_l2843_c40_2acd_ins,
gth_uxn_opcodes_h_l2843_c40_2acd_previous_stack_read,
gth_uxn_opcodes_h_l2843_c40_2acd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf
opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_cond,
opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_iftrue,
opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_iffalse,
opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output);

-- gth2_uxn_opcodes_h_l2844_c40_c85b
gth2_uxn_opcodes_h_l2844_c40_c85b : entity work.gth2_0CLK_0226dad5 port map (
clk,
gth2_uxn_opcodes_h_l2844_c40_c85b_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2844_c40_c85b_phase,
gth2_uxn_opcodes_h_l2844_c40_c85b_ins,
gth2_uxn_opcodes_h_l2844_c40_c85b_previous_stack_read,
gth2_uxn_opcodes_h_l2844_c40_c85b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_left,
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_right,
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2845_c7_385f
opc_result_MUX_uxn_opcodes_h_l2845_c7_385f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_cond,
opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_return_output);

-- lth_uxn_opcodes_h_l2845_c40_131f
lth_uxn_opcodes_h_l2845_c40_131f : entity work.lth_0CLK_7883ef49 port map (
clk,
lth_uxn_opcodes_h_l2845_c40_131f_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2845_c40_131f_phase,
lth_uxn_opcodes_h_l2845_c40_131f_ins,
lth_uxn_opcodes_h_l2845_c40_131f_previous_stack_read,
lth_uxn_opcodes_h_l2845_c40_131f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89
BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_left,
BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_right,
BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2846_c7_2785
opc_result_MUX_uxn_opcodes_h_l2846_c7_2785 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_cond,
opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_iftrue,
opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_iffalse,
opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_return_output);

-- lth2_uxn_opcodes_h_l2846_c40_6a95
lth2_uxn_opcodes_h_l2846_c40_6a95 : entity work.lth2_0CLK_0226dad5 port map (
clk,
lth2_uxn_opcodes_h_l2846_c40_6a95_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2846_c40_6a95_phase,
lth2_uxn_opcodes_h_l2846_c40_6a95_ins,
lth2_uxn_opcodes_h_l2846_c40_6a95_previous_stack_read,
lth2_uxn_opcodes_h_l2846_c40_6a95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_left,
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_right,
BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e
opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_cond,
opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output);

-- jmp_uxn_opcodes_h_l2847_c40_b3e1
jmp_uxn_opcodes_h_l2847_c40_b3e1 : entity work.jmp_0CLK_348f0530 port map (
clk,
jmp_uxn_opcodes_h_l2847_c40_b3e1_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2847_c40_b3e1_phase,
jmp_uxn_opcodes_h_l2847_c40_b3e1_ins,
jmp_uxn_opcodes_h_l2847_c40_b3e1_pc,
jmp_uxn_opcodes_h_l2847_c40_b3e1_previous_stack_read,
jmp_uxn_opcodes_h_l2847_c40_b3e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_left,
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_right,
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f
opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_cond,
opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output);

-- jmp2_uxn_opcodes_h_l2848_c40_1a5a
jmp2_uxn_opcodes_h_l2848_c40_1a5a : entity work.jmp2_0CLK_66cdbdaf port map (
clk,
jmp2_uxn_opcodes_h_l2848_c40_1a5a_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2848_c40_1a5a_phase,
jmp2_uxn_opcodes_h_l2848_c40_1a5a_ins,
jmp2_uxn_opcodes_h_l2848_c40_1a5a_previous_stack_read,
jmp2_uxn_opcodes_h_l2848_c40_1a5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c
BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_left,
BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_right,
BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2849_c7_5649
opc_result_MUX_uxn_opcodes_h_l2849_c7_5649 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_cond,
opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_iftrue,
opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_iffalse,
opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_return_output);

-- jcn_uxn_opcodes_h_l2849_c40_0ac1
jcn_uxn_opcodes_h_l2849_c40_0ac1 : entity work.jcn_0CLK_7883ef49 port map (
clk,
jcn_uxn_opcodes_h_l2849_c40_0ac1_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2849_c40_0ac1_phase,
jcn_uxn_opcodes_h_l2849_c40_0ac1_ins,
jcn_uxn_opcodes_h_l2849_c40_0ac1_pc,
jcn_uxn_opcodes_h_l2849_c40_0ac1_previous_stack_read,
jcn_uxn_opcodes_h_l2849_c40_0ac1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_left,
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_right,
BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff
opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_cond,
opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_iftrue,
opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_iffalse,
opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output);

-- jcn2_uxn_opcodes_h_l2850_c40_02a3
jcn2_uxn_opcodes_h_l2850_c40_02a3 : entity work.jcn2_0CLK_db1e6fcb port map (
clk,
jcn2_uxn_opcodes_h_l2850_c40_02a3_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2850_c40_02a3_phase,
jcn2_uxn_opcodes_h_l2850_c40_02a3_ins,
jcn2_uxn_opcodes_h_l2850_c40_02a3_previous_stack_read,
jcn2_uxn_opcodes_h_l2850_c40_02a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61
BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_left,
BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_right,
BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b
opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_cond,
opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output);

-- jsr_uxn_opcodes_h_l2851_c40_730a
jsr_uxn_opcodes_h_l2851_c40_730a : entity work.jsr_0CLK_6d7675a8 port map (
clk,
jsr_uxn_opcodes_h_l2851_c40_730a_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2851_c40_730a_phase,
jsr_uxn_opcodes_h_l2851_c40_730a_ins,
jsr_uxn_opcodes_h_l2851_c40_730a_pc,
jsr_uxn_opcodes_h_l2851_c40_730a_previous_stack_read,
jsr_uxn_opcodes_h_l2851_c40_730a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_left,
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_right,
BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2852_c7_8795
opc_result_MUX_uxn_opcodes_h_l2852_c7_8795 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_cond,
opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_iftrue,
opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_iffalse,
opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_return_output);

-- jsr2_uxn_opcodes_h_l2852_c40_ae45
jsr2_uxn_opcodes_h_l2852_c40_ae45 : entity work.jsr2_0CLK_1d728679 port map (
clk,
jsr2_uxn_opcodes_h_l2852_c40_ae45_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2852_c40_ae45_phase,
jsr2_uxn_opcodes_h_l2852_c40_ae45_ins,
jsr2_uxn_opcodes_h_l2852_c40_ae45_pc,
jsr2_uxn_opcodes_h_l2852_c40_ae45_previous_stack_read,
jsr2_uxn_opcodes_h_l2852_c40_ae45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8
BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_left,
BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_right,
BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f
opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_cond,
opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output);

-- sth_uxn_opcodes_h_l2853_c40_b08a
sth_uxn_opcodes_h_l2853_c40_b08a : entity work.sth_0CLK_7883ef49 port map (
clk,
sth_uxn_opcodes_h_l2853_c40_b08a_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2853_c40_b08a_phase,
sth_uxn_opcodes_h_l2853_c40_b08a_ins,
sth_uxn_opcodes_h_l2853_c40_b08a_previous_stack_read,
sth_uxn_opcodes_h_l2853_c40_b08a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_left,
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_right,
BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c
opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_cond,
opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output);

-- sth2_uxn_opcodes_h_l2854_c40_c1f0
sth2_uxn_opcodes_h_l2854_c40_c1f0 : entity work.sth2_0CLK_f0a14e92 port map (
clk,
sth2_uxn_opcodes_h_l2854_c40_c1f0_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2854_c40_c1f0_phase,
sth2_uxn_opcodes_h_l2854_c40_c1f0_ins,
sth2_uxn_opcodes_h_l2854_c40_c1f0_previous_stack_read,
sth2_uxn_opcodes_h_l2854_c40_c1f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_left,
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_right,
BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c
opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_cond,
opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output);

-- ldz_uxn_opcodes_h_l2855_c40_a251
ldz_uxn_opcodes_h_l2855_c40_a251 : entity work.ldz_0CLK_fd0ee55b port map (
clk,
ldz_uxn_opcodes_h_l2855_c40_a251_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2855_c40_a251_phase,
ldz_uxn_opcodes_h_l2855_c40_a251_ins,
ldz_uxn_opcodes_h_l2855_c40_a251_previous_stack_read,
ldz_uxn_opcodes_h_l2855_c40_a251_previous_ram_read,
ldz_uxn_opcodes_h_l2855_c40_a251_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b
BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_left,
BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_right,
BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0
opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_cond,
opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output);

-- ldz2_uxn_opcodes_h_l2856_c40_9859
ldz2_uxn_opcodes_h_l2856_c40_9859 : entity work.ldz2_0CLK_85b07dec port map (
clk,
ldz2_uxn_opcodes_h_l2856_c40_9859_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2856_c40_9859_phase,
ldz2_uxn_opcodes_h_l2856_c40_9859_ins,
ldz2_uxn_opcodes_h_l2856_c40_9859_previous_stack_read,
ldz2_uxn_opcodes_h_l2856_c40_9859_previous_ram_read,
ldz2_uxn_opcodes_h_l2856_c40_9859_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_left,
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_right,
BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f
opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_cond,
opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output);

-- stz_uxn_opcodes_h_l2857_c40_380c
stz_uxn_opcodes_h_l2857_c40_380c : entity work.stz_0CLK_282a76ca port map (
clk,
stz_uxn_opcodes_h_l2857_c40_380c_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2857_c40_380c_phase,
stz_uxn_opcodes_h_l2857_c40_380c_ins,
stz_uxn_opcodes_h_l2857_c40_380c_previous_stack_read,
stz_uxn_opcodes_h_l2857_c40_380c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373
BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_left,
BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_right,
BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4
opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_cond,
opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output);

-- stz2_uxn_opcodes_h_l2858_c40_7211
stz2_uxn_opcodes_h_l2858_c40_7211 : entity work.stz2_0CLK_a1f536f9 port map (
clk,
stz2_uxn_opcodes_h_l2858_c40_7211_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2858_c40_7211_phase,
stz2_uxn_opcodes_h_l2858_c40_7211_ins,
stz2_uxn_opcodes_h_l2858_c40_7211_previous_stack_read,
stz2_uxn_opcodes_h_l2858_c40_7211_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e
BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_left,
BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_right,
BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2859_c7_146b
opc_result_MUX_uxn_opcodes_h_l2859_c7_146b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_cond,
opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_return_output);

-- ldr_uxn_opcodes_h_l2859_c40_436d
ldr_uxn_opcodes_h_l2859_c40_436d : entity work.ldr_0CLK_1b20325b port map (
clk,
ldr_uxn_opcodes_h_l2859_c40_436d_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2859_c40_436d_phase,
ldr_uxn_opcodes_h_l2859_c40_436d_ins,
ldr_uxn_opcodes_h_l2859_c40_436d_pc,
ldr_uxn_opcodes_h_l2859_c40_436d_previous_stack_read,
ldr_uxn_opcodes_h_l2859_c40_436d_previous_ram_read,
ldr_uxn_opcodes_h_l2859_c40_436d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_left,
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_right,
BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a
opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_cond,
opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output);

-- ldr2_uxn_opcodes_h_l2860_c40_8704
ldr2_uxn_opcodes_h_l2860_c40_8704 : entity work.ldr2_0CLK_90b97adf port map (
clk,
ldr2_uxn_opcodes_h_l2860_c40_8704_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2860_c40_8704_phase,
ldr2_uxn_opcodes_h_l2860_c40_8704_ins,
ldr2_uxn_opcodes_h_l2860_c40_8704_pc,
ldr2_uxn_opcodes_h_l2860_c40_8704_previous_stack_read,
ldr2_uxn_opcodes_h_l2860_c40_8704_previous_ram_read,
ldr2_uxn_opcodes_h_l2860_c40_8704_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee
BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_left,
BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_right,
BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2861_c7_5158
opc_result_MUX_uxn_opcodes_h_l2861_c7_5158 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_cond,
opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_iftrue,
opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_iffalse,
opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_return_output);

-- str1_uxn_opcodes_h_l2861_c40_33aa
str1_uxn_opcodes_h_l2861_c40_33aa : entity work.str1_0CLK_64d180f1 port map (
clk,
str1_uxn_opcodes_h_l2861_c40_33aa_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2861_c40_33aa_phase,
str1_uxn_opcodes_h_l2861_c40_33aa_ins,
str1_uxn_opcodes_h_l2861_c40_33aa_pc,
str1_uxn_opcodes_h_l2861_c40_33aa_previous_stack_read,
str1_uxn_opcodes_h_l2861_c40_33aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_left,
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_right,
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38
opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_cond,
opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_iftrue,
opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_iffalse,
opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output);

-- str2_uxn_opcodes_h_l2862_c40_4157
str2_uxn_opcodes_h_l2862_c40_4157 : entity work.str2_0CLK_a1f536f9 port map (
clk,
str2_uxn_opcodes_h_l2862_c40_4157_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2862_c40_4157_phase,
str2_uxn_opcodes_h_l2862_c40_4157_ins,
str2_uxn_opcodes_h_l2862_c40_4157_pc,
str2_uxn_opcodes_h_l2862_c40_4157_previous_stack_read,
str2_uxn_opcodes_h_l2862_c40_4157_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700
BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_left,
BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_right,
BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce
opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_cond,
opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_iftrue,
opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_iffalse,
opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output);

-- lda_uxn_opcodes_h_l2863_c40_0529
lda_uxn_opcodes_h_l2863_c40_0529 : entity work.lda_0CLK_e2c3db13 port map (
clk,
lda_uxn_opcodes_h_l2863_c40_0529_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2863_c40_0529_phase,
lda_uxn_opcodes_h_l2863_c40_0529_ins,
lda_uxn_opcodes_h_l2863_c40_0529_previous_stack_read,
lda_uxn_opcodes_h_l2863_c40_0529_previous_ram_read,
lda_uxn_opcodes_h_l2863_c40_0529_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e
BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_left,
BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_right,
BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea
opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_cond,
opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_iftrue,
opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_iffalse,
opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output);

-- lda2_uxn_opcodes_h_l2864_c40_a0e8
lda2_uxn_opcodes_h_l2864_c40_a0e8 : entity work.lda2_0CLK_a5ec1955 port map (
clk,
lda2_uxn_opcodes_h_l2864_c40_a0e8_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2864_c40_a0e8_phase,
lda2_uxn_opcodes_h_l2864_c40_a0e8_ins,
lda2_uxn_opcodes_h_l2864_c40_a0e8_previous_stack_read,
lda2_uxn_opcodes_h_l2864_c40_a0e8_previous_ram_read,
lda2_uxn_opcodes_h_l2864_c40_a0e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532
BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_left,
BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_right,
BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99
opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_cond,
opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_iftrue,
opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_iffalse,
opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output);

-- sta_uxn_opcodes_h_l2865_c40_2567
sta_uxn_opcodes_h_l2865_c40_2567 : entity work.sta_0CLK_9a874500 port map (
clk,
sta_uxn_opcodes_h_l2865_c40_2567_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2865_c40_2567_phase,
sta_uxn_opcodes_h_l2865_c40_2567_ins,
sta_uxn_opcodes_h_l2865_c40_2567_previous_stack_read,
sta_uxn_opcodes_h_l2865_c40_2567_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_left,
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_right,
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec
opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_cond,
opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_iftrue,
opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_iffalse,
opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output);

-- sta2_uxn_opcodes_h_l2866_c40_2d1f
sta2_uxn_opcodes_h_l2866_c40_2d1f : entity work.sta2_0CLK_129a552b port map (
clk,
sta2_uxn_opcodes_h_l2866_c40_2d1f_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2866_c40_2d1f_phase,
sta2_uxn_opcodes_h_l2866_c40_2d1f_ins,
sta2_uxn_opcodes_h_l2866_c40_2d1f_previous_stack_read,
sta2_uxn_opcodes_h_l2866_c40_2d1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10
BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_left,
BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_right,
BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2867_c7_e985
opc_result_MUX_uxn_opcodes_h_l2867_c7_e985 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_cond,
opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_iftrue,
opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_iffalse,
opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_return_output);

-- dei_uxn_opcodes_h_l2867_c40_fba3
dei_uxn_opcodes_h_l2867_c40_fba3 : entity work.dei_0CLK_d0894221 port map (
clk,
dei_uxn_opcodes_h_l2867_c40_fba3_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2867_c40_fba3_phase,
dei_uxn_opcodes_h_l2867_c40_fba3_ins,
dei_uxn_opcodes_h_l2867_c40_fba3_previous_stack_read,
dei_uxn_opcodes_h_l2867_c40_fba3_previous_device_ram_read,
dei_uxn_opcodes_h_l2867_c40_fba3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0
BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_left,
BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_right,
BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa
opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_cond,
opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_iftrue,
opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_iffalse,
opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output);

-- dei2_uxn_opcodes_h_l2868_c40_9692
dei2_uxn_opcodes_h_l2868_c40_9692 : entity work.dei2_0CLK_6baec860 port map (
clk,
dei2_uxn_opcodes_h_l2868_c40_9692_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2868_c40_9692_phase,
dei2_uxn_opcodes_h_l2868_c40_9692_ins,
dei2_uxn_opcodes_h_l2868_c40_9692_previous_stack_read,
dei2_uxn_opcodes_h_l2868_c40_9692_previous_device_ram_read,
dei2_uxn_opcodes_h_l2868_c40_9692_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660
BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_left,
BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_right,
BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92
opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_cond,
opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_iftrue,
opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_iffalse,
opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output);

-- deo_uxn_opcodes_h_l2869_c40_d4fb
deo_uxn_opcodes_h_l2869_c40_d4fb : entity work.deo_0CLK_aac5017e port map (
clk,
deo_uxn_opcodes_h_l2869_c40_d4fb_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2869_c40_d4fb_phase,
deo_uxn_opcodes_h_l2869_c40_d4fb_ins,
deo_uxn_opcodes_h_l2869_c40_d4fb_previous_stack_read,
deo_uxn_opcodes_h_l2869_c40_d4fb_previous_device_ram_read,
deo_uxn_opcodes_h_l2869_c40_d4fb_previous_ram_read,
deo_uxn_opcodes_h_l2869_c40_d4fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3
opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_cond,
opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output);

-- deo2_uxn_opcodes_h_l2870_c40_7868
deo2_uxn_opcodes_h_l2870_c40_7868 : entity work.deo2_0CLK_41131849 port map (
clk,
deo2_uxn_opcodes_h_l2870_c40_7868_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2870_c40_7868_phase,
deo2_uxn_opcodes_h_l2870_c40_7868_ins,
deo2_uxn_opcodes_h_l2870_c40_7868_previous_stack_read,
deo2_uxn_opcodes_h_l2870_c40_7868_previous_device_ram_read,
deo2_uxn_opcodes_h_l2870_c40_7868_previous_ram_read,
deo2_uxn_opcodes_h_l2870_c40_7868_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_left,
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_right,
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb
opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_cond,
opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output);

-- add_uxn_opcodes_h_l2871_c40_ae3f
add_uxn_opcodes_h_l2871_c40_ae3f : entity work.add_0CLK_6be78140 port map (
clk,
add_uxn_opcodes_h_l2871_c40_ae3f_CLOCK_ENABLE,
add_uxn_opcodes_h_l2871_c40_ae3f_phase,
add_uxn_opcodes_h_l2871_c40_ae3f_ins,
add_uxn_opcodes_h_l2871_c40_ae3f_previous_stack_read,
add_uxn_opcodes_h_l2871_c40_ae3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_left,
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_right,
BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2872_c7_4012
opc_result_MUX_uxn_opcodes_h_l2872_c7_4012 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_cond,
opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_iftrue,
opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_iffalse,
opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_return_output);

-- add2_uxn_opcodes_h_l2872_c40_b287
add2_uxn_opcodes_h_l2872_c40_b287 : entity work.add2_0CLK_4712a73c port map (
clk,
add2_uxn_opcodes_h_l2872_c40_b287_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2872_c40_b287_phase,
add2_uxn_opcodes_h_l2872_c40_b287_ins,
add2_uxn_opcodes_h_l2872_c40_b287_previous_stack_read,
add2_uxn_opcodes_h_l2872_c40_b287_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_left,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_right,
BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc
opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_cond,
opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output);

-- sub_uxn_opcodes_h_l2873_c40_bdc7
sub_uxn_opcodes_h_l2873_c40_bdc7 : entity work.sub_0CLK_6be78140 port map (
clk,
sub_uxn_opcodes_h_l2873_c40_bdc7_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2873_c40_bdc7_phase,
sub_uxn_opcodes_h_l2873_c40_bdc7_ins,
sub_uxn_opcodes_h_l2873_c40_bdc7_previous_stack_read,
sub_uxn_opcodes_h_l2873_c40_bdc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_left,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_right,
BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6
opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_cond,
opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_iftrue,
opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_iffalse,
opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output);

-- sub2_uxn_opcodes_h_l2874_c40_06d3
sub2_uxn_opcodes_h_l2874_c40_06d3 : entity work.sub2_0CLK_4712a73c port map (
clk,
sub2_uxn_opcodes_h_l2874_c40_06d3_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2874_c40_06d3_phase,
sub2_uxn_opcodes_h_l2874_c40_06d3_ins,
sub2_uxn_opcodes_h_l2874_c40_06d3_previous_stack_read,
sub2_uxn_opcodes_h_l2874_c40_06d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8
opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_cond,
opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output);

-- mul_uxn_opcodes_h_l2875_c40_b31e
mul_uxn_opcodes_h_l2875_c40_b31e : entity work.mul_0CLK_6be78140 port map (
clk,
mul_uxn_opcodes_h_l2875_c40_b31e_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2875_c40_b31e_phase,
mul_uxn_opcodes_h_l2875_c40_b31e_ins,
mul_uxn_opcodes_h_l2875_c40_b31e_previous_stack_read,
mul_uxn_opcodes_h_l2875_c40_b31e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_left,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_right,
BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca
opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_cond,
opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_iftrue,
opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_iffalse,
opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output);

-- mul2_uxn_opcodes_h_l2876_c40_7859
mul2_uxn_opcodes_h_l2876_c40_7859 : entity work.mul2_0CLK_4712a73c port map (
clk,
mul2_uxn_opcodes_h_l2876_c40_7859_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2876_c40_7859_phase,
mul2_uxn_opcodes_h_l2876_c40_7859_ins,
mul2_uxn_opcodes_h_l2876_c40_7859_previous_stack_read,
mul2_uxn_opcodes_h_l2876_c40_7859_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_left,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_right,
BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75
opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_cond,
opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_iftrue,
opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_iffalse,
opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output);

-- div_uxn_opcodes_h_l2877_c40_e2a6
div_uxn_opcodes_h_l2877_c40_e2a6 : entity work.div_0CLK_622c3f98 port map (
clk,
div_uxn_opcodes_h_l2877_c40_e2a6_CLOCK_ENABLE,
div_uxn_opcodes_h_l2877_c40_e2a6_phase,
div_uxn_opcodes_h_l2877_c40_e2a6_ins,
div_uxn_opcodes_h_l2877_c40_e2a6_previous_stack_read,
div_uxn_opcodes_h_l2877_c40_e2a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_left,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_right,
BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad
opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_cond,
opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_iftrue,
opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_iffalse,
opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output);

-- div2_uxn_opcodes_h_l2878_c40_d5d3
div2_uxn_opcodes_h_l2878_c40_d5d3 : entity work.div2_0CLK_dbfc9f73 port map (
clk,
div2_uxn_opcodes_h_l2878_c40_d5d3_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2878_c40_d5d3_phase,
div2_uxn_opcodes_h_l2878_c40_d5d3_ins,
div2_uxn_opcodes_h_l2878_c40_d5d3_previous_stack_read,
div2_uxn_opcodes_h_l2878_c40_d5d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_left,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_right,
BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24
opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_cond,
opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_iftrue,
opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_iffalse,
opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output);

-- and_uxn_opcodes_h_l2879_c40_23d4
and_uxn_opcodes_h_l2879_c40_23d4 : entity work.and_0CLK_6be78140 port map (
clk,
and_uxn_opcodes_h_l2879_c40_23d4_CLOCK_ENABLE,
and_uxn_opcodes_h_l2879_c40_23d4_phase,
and_uxn_opcodes_h_l2879_c40_23d4_ins,
and_uxn_opcodes_h_l2879_c40_23d4_previous_stack_read,
and_uxn_opcodes_h_l2879_c40_23d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_left,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_right,
BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2880_c7_db38
opc_result_MUX_uxn_opcodes_h_l2880_c7_db38 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_cond,
opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_iftrue,
opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_iffalse,
opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_return_output);

-- and2_uxn_opcodes_h_l2880_c40_7c81
and2_uxn_opcodes_h_l2880_c40_7c81 : entity work.and2_0CLK_4712a73c port map (
clk,
and2_uxn_opcodes_h_l2880_c40_7c81_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2880_c40_7c81_phase,
and2_uxn_opcodes_h_l2880_c40_7c81_ins,
and2_uxn_opcodes_h_l2880_c40_7c81_previous_stack_read,
and2_uxn_opcodes_h_l2880_c40_7c81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2881_c7_340f
opc_result_MUX_uxn_opcodes_h_l2881_c7_340f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_cond,
opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_return_output);

-- ora_uxn_opcodes_h_l2881_c40_d7fb
ora_uxn_opcodes_h_l2881_c40_d7fb : entity work.ora_0CLK_6be78140 port map (
clk,
ora_uxn_opcodes_h_l2881_c40_d7fb_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2881_c40_d7fb_phase,
ora_uxn_opcodes_h_l2881_c40_d7fb_ins,
ora_uxn_opcodes_h_l2881_c40_d7fb_previous_stack_read,
ora_uxn_opcodes_h_l2881_c40_d7fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_left,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_right,
BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71
opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_cond,
opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_iftrue,
opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_iffalse,
opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output);

-- ora2_uxn_opcodes_h_l2882_c40_a3ba
ora2_uxn_opcodes_h_l2882_c40_a3ba : entity work.ora2_0CLK_4712a73c port map (
clk,
ora2_uxn_opcodes_h_l2882_c40_a3ba_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2882_c40_a3ba_phase,
ora2_uxn_opcodes_h_l2882_c40_a3ba_ins,
ora2_uxn_opcodes_h_l2882_c40_a3ba_previous_stack_read,
ora2_uxn_opcodes_h_l2882_c40_a3ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_left,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_right,
BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26
opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_cond,
opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_iftrue,
opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_iffalse,
opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output);

-- eor_uxn_opcodes_h_l2883_c40_770b
eor_uxn_opcodes_h_l2883_c40_770b : entity work.eor_0CLK_6be78140 port map (
clk,
eor_uxn_opcodes_h_l2883_c40_770b_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2883_c40_770b_phase,
eor_uxn_opcodes_h_l2883_c40_770b_ins,
eor_uxn_opcodes_h_l2883_c40_770b_previous_stack_read,
eor_uxn_opcodes_h_l2883_c40_770b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_left,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_right,
BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b
opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_cond,
opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output);

-- eor2_uxn_opcodes_h_l2884_c40_db9e
eor2_uxn_opcodes_h_l2884_c40_db9e : entity work.eor2_0CLK_4712a73c port map (
clk,
eor2_uxn_opcodes_h_l2884_c40_db9e_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2884_c40_db9e_phase,
eor2_uxn_opcodes_h_l2884_c40_db9e_ins,
eor2_uxn_opcodes_h_l2884_c40_db9e_previous_stack_read,
eor2_uxn_opcodes_h_l2884_c40_db9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_left,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_right,
BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5
opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_cond,
opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output);

-- sft_uxn_opcodes_h_l2885_c40_0c28
sft_uxn_opcodes_h_l2885_c40_0c28 : entity work.sft_0CLK_f770903f port map (
clk,
sft_uxn_opcodes_h_l2885_c40_0c28_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2885_c40_0c28_phase,
sft_uxn_opcodes_h_l2885_c40_0c28_ins,
sft_uxn_opcodes_h_l2885_c40_0c28_previous_stack_read,
sft_uxn_opcodes_h_l2885_c40_0c28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_left,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_right,
BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2886_c7_315f
opc_result_MUX_uxn_opcodes_h_l2886_c7_315f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_cond,
opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_return_output);

-- sft2_uxn_opcodes_h_l2886_c40_88c2
sft2_uxn_opcodes_h_l2886_c40_88c2 : entity work.sft2_0CLK_f641e50e port map (
clk,
sft2_uxn_opcodes_h_l2886_c40_88c2_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2886_c40_88c2_phase,
sft2_uxn_opcodes_h_l2886_c40_88c2_ins,
sft2_uxn_opcodes_h_l2886_c40_88c2_previous_stack_read,
sft2_uxn_opcodes_h_l2886_c40_88c2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0
BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_left,
BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_right,
BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_return_output);

-- CONST_SR_6_uxn_opcodes_h_l2889_c17_b291
CONST_SR_6_uxn_opcodes_h_l2889_c17_b291 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_opcodes_h_l2889_c17_b291_x,
CONST_SR_6_uxn_opcodes_h_l2889_c17_b291_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454
BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_left,
BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_right,
BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_return_output);

-- sp1_MUX_uxn_opcodes_h_l2892_c2_b006
sp1_MUX_uxn_opcodes_h_l2892_c2_b006 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2892_c2_b006_cond,
sp1_MUX_uxn_opcodes_h_l2892_c2_b006_iftrue,
sp1_MUX_uxn_opcodes_h_l2892_c2_b006_iffalse,
sp1_MUX_uxn_opcodes_h_l2892_c2_b006_return_output);

-- sp0_MUX_uxn_opcodes_h_l2892_c2_b006
sp0_MUX_uxn_opcodes_h_l2892_c2_b006 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2892_c2_b006_cond,
sp0_MUX_uxn_opcodes_h_l2892_c2_b006_iftrue,
sp0_MUX_uxn_opcodes_h_l2892_c2_b006_iffalse,
sp0_MUX_uxn_opcodes_h_l2892_c2_b006_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084
BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_left,
BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_right,
BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5
BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_left,
BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_right,
BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_return_output);

-- MUX_uxn_opcodes_h_l2898_c29_e6ea
MUX_uxn_opcodes_h_l2898_c29_e6ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2898_c29_e6ea_cond,
MUX_uxn_opcodes_h_l2898_c29_e6ea_iftrue,
MUX_uxn_opcodes_h_l2898_c29_e6ea_iffalse,
MUX_uxn_opcodes_h_l2898_c29_e6ea_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f
BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f : entity work.BIN_OP_MINUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_left,
BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_right,
BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_return_output);

-- MUX_uxn_opcodes_h_l2899_c20_b3ed
MUX_uxn_opcodes_h_l2899_c20_b3ed : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2899_c20_b3ed_cond,
MUX_uxn_opcodes_h_l2899_c20_b3ed_iftrue,
MUX_uxn_opcodes_h_l2899_c20_b3ed_iffalse,
MUX_uxn_opcodes_h_l2899_c20_b3ed_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943
BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943 : entity work.BIN_OP_PLUS_uint9_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_left,
BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_right,
BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_return_output);

-- stack_ram_update_uxn_opcodes_h_l2901_c24_20b4
stack_ram_update_uxn_opcodes_h_l2901_c24_20b4 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_stack_address,
stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_value,
stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_write_enable,
stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_return_output,
 UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a_return_output,
 BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_return_output,
 MUX_uxn_opcodes_h_l2810_c14_ea88_return_output,
 MUX_uxn_opcodes_h_l2811_c8_cea1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output,
 is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output,
 jci_uxn_opcodes_h_l2818_c40_927c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output,
 jmi_uxn_opcodes_h_l2819_c40_3494_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_return_output,
 jsi_uxn_opcodes_h_l2820_c40_29da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output,
 lit_uxn_opcodes_h_l2821_c40_1486_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_return_output,
 opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_return_output,
 lit2_uxn_opcodes_h_l2822_c40_03f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_return_output,
 lit_uxn_opcodes_h_l2823_c40_f67e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_return_output,
 opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_return_output,
 lit2_uxn_opcodes_h_l2824_c40_e6d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_return_output,
 inc_uxn_opcodes_h_l2825_c40_67e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output,
 opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output,
 inc2_uxn_opcodes_h_l2826_c40_6c0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output,
 pop_uxn_opcodes_h_l2827_c40_f7dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output,
 pop2_uxn_opcodes_h_l2828_c40_6749_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_return_output,
 opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_return_output,
 nip_uxn_opcodes_h_l2829_c40_1bc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_return_output,
 nip2_uxn_opcodes_h_l2830_c40_bda0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output,
 swp_uxn_opcodes_h_l2831_c40_e273_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output,
 opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output,
 swp2_uxn_opcodes_h_l2832_c40_c0c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output,
 opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output,
 rot_uxn_opcodes_h_l2833_c40_e33c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_return_output,
 opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output,
 rot2_uxn_opcodes_h_l2834_c40_83d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_return_output,
 dup_uxn_opcodes_h_l2835_c40_f699_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output,
 dup2_uxn_opcodes_h_l2836_c40_239a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output,
 ovr_uxn_opcodes_h_l2837_c40_df96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_return_output,
 opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output,
 ovr2_uxn_opcodes_h_l2838_c40_967c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output,
 opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_return_output,
 equ_uxn_opcodes_h_l2839_c40_bc0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output,
 equ2_uxn_opcodes_h_l2840_c40_bd97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output,
 opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output,
 neq_uxn_opcodes_h_l2841_c40_cd3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_return_output,
 opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output,
 neq2_uxn_opcodes_h_l2842_c40_9ae9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output,
 opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_return_output,
 gth_uxn_opcodes_h_l2843_c40_2acd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output,
 gth2_uxn_opcodes_h_l2844_c40_c85b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_return_output,
 opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_return_output,
 lth_uxn_opcodes_h_l2845_c40_131f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_return_output,
 lth2_uxn_opcodes_h_l2846_c40_6a95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output,
 jmp_uxn_opcodes_h_l2847_c40_b3e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_return_output,
 opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output,
 jmp2_uxn_opcodes_h_l2848_c40_1a5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output,
 opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_return_output,
 jcn_uxn_opcodes_h_l2849_c40_0ac1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output,
 jcn2_uxn_opcodes_h_l2850_c40_02a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_return_output,
 opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output,
 jsr_uxn_opcodes_h_l2851_c40_730a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_return_output,
 jsr2_uxn_opcodes_h_l2852_c40_ae45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output,
 sth_uxn_opcodes_h_l2853_c40_b08a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output,
 sth2_uxn_opcodes_h_l2854_c40_c1f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output,
 ldz_uxn_opcodes_h_l2855_c40_a251_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output,
 ldz2_uxn_opcodes_h_l2856_c40_9859_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output,
 stz_uxn_opcodes_h_l2857_c40_380c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output,
 stz2_uxn_opcodes_h_l2858_c40_7211_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_return_output,
 ldr_uxn_opcodes_h_l2859_c40_436d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_return_output,
 opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output,
 ldr2_uxn_opcodes_h_l2860_c40_8704_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output,
 opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_return_output,
 str1_uxn_opcodes_h_l2861_c40_33aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output,
 opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output,
 str2_uxn_opcodes_h_l2862_c40_4157_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output,
 opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output,
 lda_uxn_opcodes_h_l2863_c40_0529_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output,
 opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output,
 lda2_uxn_opcodes_h_l2864_c40_a0e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output,
 opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output,
 sta_uxn_opcodes_h_l2865_c40_2567_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_return_output,
 opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output,
 sta2_uxn_opcodes_h_l2866_c40_2d1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output,
 opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_return_output,
 dei_uxn_opcodes_h_l2867_c40_fba3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output,
 opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output,
 dei2_uxn_opcodes_h_l2868_c40_9692_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output,
 deo_uxn_opcodes_h_l2869_c40_d4fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output,
 deo2_uxn_opcodes_h_l2870_c40_7868_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_return_output,
 opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output,
 add_uxn_opcodes_h_l2871_c40_ae3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_return_output,
 add2_uxn_opcodes_h_l2872_c40_b287_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output,
 opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output,
 sub_uxn_opcodes_h_l2873_c40_bdc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output,
 sub2_uxn_opcodes_h_l2874_c40_06d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output,
 opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output,
 mul_uxn_opcodes_h_l2875_c40_b31e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output,
 opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output,
 mul2_uxn_opcodes_h_l2876_c40_7859_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output,
 opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output,
 div_uxn_opcodes_h_l2877_c40_e2a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output,
 opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output,
 div2_uxn_opcodes_h_l2878_c40_d5d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_return_output,
 opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output,
 and_uxn_opcodes_h_l2879_c40_23d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_return_output,
 and2_uxn_opcodes_h_l2880_c40_7c81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output,
 opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_return_output,
 ora_uxn_opcodes_h_l2881_c40_d7fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output,
 opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output,
 ora2_uxn_opcodes_h_l2882_c40_a3ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output,
 eor_uxn_opcodes_h_l2883_c40_770b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output,
 eor2_uxn_opcodes_h_l2884_c40_db9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output,
 sft_uxn_opcodes_h_l2885_c40_0c28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_return_output,
 opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_return_output,
 sft2_uxn_opcodes_h_l2886_c40_88c2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_return_output,
 CONST_SR_6_uxn_opcodes_h_l2889_c17_b291_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_return_output,
 sp1_MUX_uxn_opcodes_h_l2892_c2_b006_return_output,
 sp0_MUX_uxn_opcodes_h_l2892_c2_b006_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_return_output,
 MUX_uxn_opcodes_h_l2898_c29_e6ea_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_return_output,
 MUX_uxn_opcodes_h_l2899_c20_b3ed_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_return_output,
 stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2810_c14_ea88_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a_expr : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2810_c14_ea88_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2810_c14_ea88_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2810_c14_ea88_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2817_c2_9763_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_cond : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2818_c40_927c_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2818_c40_927c_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2818_c40_927c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2818_c40_927c_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2818_c40_927c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2818_c40_927c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2819_c40_3494_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2819_c40_3494_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2819_c40_3494_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2819_c40_3494_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2819_c40_3494_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2820_c40_29da_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2820_c40_29da_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2820_c40_29da_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2820_c40_29da_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2820_c40_29da_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2821_c40_1486_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2821_c40_1486_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2821_c40_1486_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2821_c40_1486_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2821_c40_1486_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2823_c40_f67e_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2823_c40_f67e_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2823_c40_f67e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2823_c40_f67e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2823_c40_f67e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2825_c40_67e1_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2825_c40_67e1_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2825_c40_67e1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2825_c40_67e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2825_c40_67e1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2827_c40_f7dd_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2827_c40_f7dd_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2827_c40_f7dd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2827_c40_f7dd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2828_c40_6749_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2828_c40_6749_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2828_c40_6749_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2828_c40_6749_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2831_c40_e273_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2831_c40_e273_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2831_c40_e273_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2831_c40_e273_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2831_c40_e273_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2833_c40_e33c_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2833_c40_e33c_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2833_c40_e33c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2833_c40_e33c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2833_c40_e33c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2835_c40_f699_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2835_c40_f699_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2835_c40_f699_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2835_c40_f699_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2835_c40_f699_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2836_c40_239a_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2836_c40_239a_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2836_c40_239a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2836_c40_239a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2836_c40_239a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2837_c40_df96_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2837_c40_df96_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2837_c40_df96_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2837_c40_df96_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2837_c40_df96_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2843_c40_2acd_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2843_c40_2acd_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2843_c40_2acd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2843_c40_2acd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2843_c40_2acd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2845_c40_131f_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2845_c40_131f_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2845_c40_131f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2845_c40_131f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2845_c40_131f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2851_c40_730a_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2851_c40_730a_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2851_c40_730a_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2851_c40_730a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2851_c40_730a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2851_c40_730a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2853_c40_b08a_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2853_c40_b08a_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2853_c40_b08a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2853_c40_b08a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2853_c40_b08a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2855_c40_a251_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2855_c40_a251_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2855_c40_a251_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2855_c40_a251_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2855_c40_a251_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2855_c40_a251_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2857_c40_380c_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2857_c40_380c_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2857_c40_380c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2857_c40_380c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2857_c40_380c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2858_c40_7211_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2858_c40_7211_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2858_c40_7211_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2858_c40_7211_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2858_c40_7211_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2859_c40_436d_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2859_c40_436d_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2859_c40_436d_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2859_c40_436d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2859_c40_436d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2859_c40_436d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2859_c40_436d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2861_c40_33aa_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2861_c40_33aa_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2861_c40_33aa_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2861_c40_33aa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2861_c40_33aa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2861_c40_33aa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2862_c40_4157_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2862_c40_4157_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2862_c40_4157_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2862_c40_4157_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2862_c40_4157_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2862_c40_4157_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2863_c40_0529_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2863_c40_0529_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2863_c40_0529_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2863_c40_0529_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2863_c40_0529_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2863_c40_0529_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2865_c40_2567_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2865_c40_2567_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2865_c40_2567_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2865_c40_2567_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2865_c40_2567_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2867_c40_fba3_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2867_c40_fba3_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2867_c40_fba3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2867_c40_fba3_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2867_c40_fba3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2867_c40_fba3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2868_c40_9692_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2868_c40_9692_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2868_c40_9692_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2868_c40_9692_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2868_c40_9692_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2868_c40_9692_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2870_c40_7868_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2870_c40_7868_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2870_c40_7868_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2870_c40_7868_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2870_c40_7868_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2870_c40_7868_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2870_c40_7868_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2871_c40_ae3f_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2871_c40_ae3f_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2871_c40_ae3f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2871_c40_ae3f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2871_c40_ae3f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2872_c40_b287_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2872_c40_b287_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2872_c40_b287_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2872_c40_b287_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2872_c40_b287_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2875_c40_b31e_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2875_c40_b31e_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2875_c40_b31e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2875_c40_b31e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2875_c40_b31e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2876_c40_7859_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2876_c40_7859_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2876_c40_7859_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2876_c40_7859_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2876_c40_7859_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2877_c40_e2a6_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2877_c40_e2a6_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2877_c40_e2a6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2877_c40_e2a6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2877_c40_e2a6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2879_c40_23d4_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2879_c40_23d4_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2879_c40_23d4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2879_c40_23d4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2879_c40_23d4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2880_c40_7c81_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2880_c40_7c81_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2880_c40_7c81_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2880_c40_7c81_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2880_c40_7c81_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2883_c40_770b_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2883_c40_770b_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2883_c40_770b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2883_c40_770b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2883_c40_770b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2885_c40_0c28_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2885_c40_0c28_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2885_c40_0c28_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2885_c40_0c28_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2885_c40_0c28_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_return_output : opcode_result_t;
 variable VAR_stack_index_uxn_opcodes_h_l2889_c2_1bcc : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2889_c17_b291_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_opcodes_h_l2889_c17_b291_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2890_c17_3f1d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2892_c2_b006_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2893_c3_941c : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2892_c2_b006_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2892_c2_b006_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2892_c2_b006_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2892_c2_b006_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2892_c2_b006_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2895_c3_c8e4 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2892_c2_b006_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2892_c2_b006_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2898_c29_e6ea_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2898_c29_e6ea_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2898_c29_e6ea_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2898_c29_e6ea_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2898_c19_2e0a_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_left : unsigned(8 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2898_c68_2c54_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2898_c58_cffe_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_return_output : unsigned(8 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2899_c2_d0ce : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_left : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2899_c20_b3ed_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2899_c20_b3ed_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2899_c20_b3ed_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2899_c20_b3ed_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_return_output : unsigned(9 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_stack_address : unsigned(8 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2904_c3_0c29_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2908_c39_44ff_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2909_c40_1582_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2910_c34_41b8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2911_c30_a974_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2912_c33_2277_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2913_c34_44a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2914_c37_27cc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2916_c32_bee8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2893_l2895_DUPLICATE_ec3d_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2893_l2895_DUPLICATE_bbfc_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2915_l2903_DUPLICATE_4b0c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2918_l2794_DUPLICATE_8050_return_output : eval_opcode_result_t;
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
     VAR_is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_right := to_unsigned(6, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_right := to_unsigned(39, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_right := to_unsigned(160, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_right := to_unsigned(23, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_right := to_unsigned(52, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_right := to_unsigned(9, 8);
     VAR_MUX_uxn_opcodes_h_l2899_c20_b3ed_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_right := to_unsigned(1, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_right := to_unsigned(63, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_right := to_unsigned(59, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_right := to_unsigned(55, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_right := to_unsigned(28, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_right := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_right := to_unsigned(51, 8);
     VAR_is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_right := to_unsigned(223, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_right := to_unsigned(4, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_right := to_unsigned(48, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_right := to_unsigned(50, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_right := to_unsigned(15, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_right := to_unsigned(38, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_right := to_unsigned(27, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_right := to_unsigned(10, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_right := to_unsigned(2, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_right := to_unsigned(8, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_right := to_unsigned(16, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_right := to_unsigned(5, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_right := to_unsigned(60, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_right := to_unsigned(54, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_right := to_unsigned(21, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_right := to_unsigned(29, 8);
     VAR_MUX_uxn_opcodes_h_l2810_c14_ea88_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_right := to_unsigned(13, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_right := to_unsigned(47, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_right := to_unsigned(26, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_right := to_unsigned(22, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_right := to_unsigned(40, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_right := to_unsigned(35, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_right := to_unsigned(62, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_right := to_unsigned(31, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_right := to_unsigned(20, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_right := to_unsigned(46, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_right := to_unsigned(25, 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_right := to_unsigned(63, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_right := to_unsigned(56, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_right := to_unsigned(36, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_right := to_unsigned(192, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_right := to_unsigned(64, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2810_c14_ea88_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_right := to_unsigned(32, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_right := to_unsigned(7, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_right := to_unsigned(14, 8);
     VAR_MUX_uxn_opcodes_h_l2899_c20_b3ed_iftrue := to_unsigned(256, 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_right := to_unsigned(30, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_right := to_unsigned(224, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_right := to_unsigned(0, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_right := to_unsigned(33, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_right := to_unsigned(58, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_right := to_unsigned(57, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_right := to_unsigned(43, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_right := to_unsigned(17, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_right := to_unsigned(53, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_right := to_unsigned(49, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_right := to_unsigned(96, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_right := to_unsigned(34, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_right := to_unsigned(12, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_right := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_right := to_unsigned(44, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_right := to_unsigned(32, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_right := to_unsigned(18, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_right := to_unsigned(64, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_right := to_unsigned(37, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_right := to_unsigned(11, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_right := to_unsigned(61, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_right := to_unsigned(45, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_right := to_unsigned(3, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_right := to_unsigned(24, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_right := to_unsigned(19, 8);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_iffalse := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_left := VAR_ins;
     VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_iftrue := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2872_c40_b287_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2871_c40_ae3f_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2880_c40_7c81_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2879_c40_23d4_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2868_c40_9692_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2867_c40_fba3_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2870_c40_7868_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2877_c40_e2a6_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2836_c40_239a_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2835_c40_f699_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2883_c40_770b_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2843_c40_2acd_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2825_c40_67e1_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2851_c40_730a_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2863_c40_0529_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2859_c40_436d_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2855_c40_a251_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2845_c40_131f_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2876_c40_7859_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2875_c40_b31e_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2837_c40_df96_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2828_c40_6749_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2827_c40_f7dd_ins := VAR_ins;
     VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2833_c40_e33c_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2885_c40_0c28_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2865_c40_2567_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2853_c40_b08a_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2861_c40_33aa_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2862_c40_4157_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2858_c40_7211_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2857_c40_380c_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2831_c40_e273_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2818_c40_927c_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2819_c40_3494_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2820_c40_29da_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2851_c40_730a_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2859_c40_436d_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2821_c40_1486_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2823_c40_f67e_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2861_c40_33aa_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2862_c40_4157_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2872_c40_b287_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2871_c40_ae3f_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2880_c40_7c81_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2879_c40_23d4_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2868_c40_9692_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2867_c40_fba3_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2870_c40_7868_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2877_c40_e2a6_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2836_c40_239a_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2835_c40_f699_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2883_c40_770b_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2843_c40_2acd_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2825_c40_67e1_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2818_c40_927c_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2819_c40_3494_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2820_c40_29da_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2851_c40_730a_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2863_c40_0529_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2859_c40_436d_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2855_c40_a251_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2821_c40_1486_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2823_c40_f67e_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2845_c40_131f_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2876_c40_7859_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2875_c40_b31e_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2837_c40_df96_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2828_c40_6749_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2827_c40_f7dd_phase := VAR_phase;
     VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2833_c40_e33c_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2885_c40_0c28_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2865_c40_2567_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2853_c40_b08a_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2861_c40_33aa_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2862_c40_4157_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2858_c40_7211_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2857_c40_380c_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2831_c40_e273_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2868_c40_9692_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2867_c40_fba3_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2870_c40_7868_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2870_c40_7868_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2818_c40_927c_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2819_c40_3494_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2820_c40_29da_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2863_c40_0529_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2859_c40_436d_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2855_c40_a251_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2821_c40_1486_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2823_c40_f67e_previous_ram_read := VAR_previous_ram_read;
     VAR_add2_uxn_opcodes_h_l2872_c40_b287_previous_stack_read := previous_stack_read;
     VAR_add_uxn_opcodes_h_l2871_c40_ae3f_previous_stack_read := previous_stack_read;
     VAR_and2_uxn_opcodes_h_l2880_c40_7c81_previous_stack_read := previous_stack_read;
     VAR_and_uxn_opcodes_h_l2879_c40_23d4_previous_stack_read := previous_stack_read;
     VAR_dei2_uxn_opcodes_h_l2868_c40_9692_previous_stack_read := previous_stack_read;
     VAR_dei_uxn_opcodes_h_l2867_c40_fba3_previous_stack_read := previous_stack_read;
     VAR_deo2_uxn_opcodes_h_l2870_c40_7868_previous_stack_read := previous_stack_read;
     VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_previous_stack_read := previous_stack_read;
     VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_previous_stack_read := previous_stack_read;
     VAR_div_uxn_opcodes_h_l2877_c40_e2a6_previous_stack_read := previous_stack_read;
     VAR_dup2_uxn_opcodes_h_l2836_c40_239a_previous_stack_read := previous_stack_read;
     VAR_dup_uxn_opcodes_h_l2835_c40_f699_previous_stack_read := previous_stack_read;
     VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_previous_stack_read := previous_stack_read;
     VAR_eor_uxn_opcodes_h_l2883_c40_770b_previous_stack_read := previous_stack_read;
     VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_previous_stack_read := previous_stack_read;
     VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_previous_stack_read := previous_stack_read;
     VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_previous_stack_read := previous_stack_read;
     VAR_gth_uxn_opcodes_h_l2843_c40_2acd_previous_stack_read := previous_stack_read;
     VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_previous_stack_read := previous_stack_read;
     VAR_inc_uxn_opcodes_h_l2825_c40_67e1_previous_stack_read := previous_stack_read;
     VAR_jci_uxn_opcodes_h_l2818_c40_927c_previous_stack_read := previous_stack_read;
     VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_previous_stack_read := previous_stack_read;
     VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_previous_stack_read := previous_stack_read;
     VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_previous_stack_read := previous_stack_read;
     VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_previous_stack_read := previous_stack_read;
     VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_previous_stack_read := previous_stack_read;
     VAR_jsr_uxn_opcodes_h_l2851_c40_730a_previous_stack_read := previous_stack_read;
     VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_previous_stack_read := previous_stack_read;
     VAR_lda_uxn_opcodes_h_l2863_c40_0529_previous_stack_read := previous_stack_read;
     VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_previous_stack_read := previous_stack_read;
     VAR_ldr_uxn_opcodes_h_l2859_c40_436d_previous_stack_read := previous_stack_read;
     VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_previous_stack_read := previous_stack_read;
     VAR_ldz_uxn_opcodes_h_l2855_c40_a251_previous_stack_read := previous_stack_read;
     VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_previous_stack_read := previous_stack_read;
     VAR_lth_uxn_opcodes_h_l2845_c40_131f_previous_stack_read := previous_stack_read;
     VAR_mul2_uxn_opcodes_h_l2876_c40_7859_previous_stack_read := previous_stack_read;
     VAR_mul_uxn_opcodes_h_l2875_c40_b31e_previous_stack_read := previous_stack_read;
     VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_previous_stack_read := previous_stack_read;
     VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_previous_stack_read := previous_stack_read;
     VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_previous_stack_read := previous_stack_read;
     VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_previous_stack_read := previous_stack_read;
     VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_previous_stack_read := previous_stack_read;
     VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_previous_stack_read := previous_stack_read;
     VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_previous_stack_read := previous_stack_read;
     VAR_ovr_uxn_opcodes_h_l2837_c40_df96_previous_stack_read := previous_stack_read;
     VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_previous_stack_read := previous_stack_read;
     VAR_rot_uxn_opcodes_h_l2833_c40_e33c_previous_stack_read := previous_stack_read;
     VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_previous_stack_read := previous_stack_read;
     VAR_sft_uxn_opcodes_h_l2885_c40_0c28_previous_stack_read := previous_stack_read;
     VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_previous_stack_read := previous_stack_read;
     VAR_sta_uxn_opcodes_h_l2865_c40_2567_previous_stack_read := previous_stack_read;
     VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_previous_stack_read := previous_stack_read;
     VAR_sth_uxn_opcodes_h_l2853_c40_b08a_previous_stack_read := previous_stack_read;
     VAR_str1_uxn_opcodes_h_l2861_c40_33aa_previous_stack_read := previous_stack_read;
     VAR_str2_uxn_opcodes_h_l2862_c40_4157_previous_stack_read := previous_stack_read;
     VAR_stz2_uxn_opcodes_h_l2858_c40_7211_previous_stack_read := previous_stack_read;
     VAR_stz_uxn_opcodes_h_l2857_c40_380c_previous_stack_read := previous_stack_read;
     VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_previous_stack_read := previous_stack_read;
     VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_previous_stack_read := previous_stack_read;
     VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_previous_stack_read := previous_stack_read;
     VAR_swp_uxn_opcodes_h_l2831_c40_e273_previous_stack_read := previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2892_c2_b006_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2892_c2_b006_iffalse := sp1;
     -- BIN_OP_AND[uxn_opcodes_h_l2889_c17_cdc0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_left;
     BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_return_output := BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2809_c14_f7e3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_left;
     BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_return_output := BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2817_c2_9763] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2817_c2_9763_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_return_output;
     VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_iffalse := VAR_BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_return_output;
     REG_VAR_ins_a_3f := VAR_BIN_OP_AND_uxn_opcodes_h_l2809_c14_f7e3_return_output;
     VAR_CONST_SR_6_uxn_opcodes_h_l2889_c17_b291_x := VAR_BIN_OP_AND_uxn_opcodes_h_l2889_c17_cdc0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2817_c2_9763_return_output;
     -- CONST_SR_6[uxn_opcodes_h_l2889_c17_b291] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_opcodes_h_l2889_c17_b291_x <= VAR_CONST_SR_6_uxn_opcodes_h_l2889_c17_b291_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_opcodes_h_l2889_c17_b291_return_output := CONST_SR_6_uxn_opcodes_h_l2889_c17_b291_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l2810_c14_82d1] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_left;
     BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_return_output := BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_return_output;

     -- Submodule level 2
     VAR_BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_left := VAR_BIN_OP_XOR_uxn_opcodes_h_l2810_c14_82d1_return_output;
     VAR_stack_index_uxn_opcodes_h_l2889_c2_1bcc := resize(VAR_CONST_SR_6_uxn_opcodes_h_l2889_c17_b291_return_output, 1);
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_left := VAR_stack_index_uxn_opcodes_h_l2889_c2_1bcc;
     -- BIN_OP_OR[uxn_opcodes_h_l2810_c14_2632] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_left;
     BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_return_output := BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_return_output;

     -- Submodule level 3
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a_expr := VAR_BIN_OP_OR_uxn_opcodes_h_l2810_c14_2632_return_output;
     -- UNARY_OP_NOT[uxn_opcodes_h_l2810_c14_c77a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a_expr <= VAR_UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a_return_output := UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a_return_output;

     -- Submodule level 4
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_left := VAR_UNARY_OP_NOT_uxn_opcodes_h_l2810_c14_c77a_return_output;
     -- BIN_OP_NEQ[uxn_opcodes_h_l2810_c14_5b6f] LATENCY=0
     -- Inputs
     BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_left <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_left;
     BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_right <= VAR_BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_right;
     -- Outputs
     VAR_BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_return_output := BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_opcodes_h_l2810_c14_ea88_cond := VAR_BIN_OP_NEQ_uxn_opcodes_h_l2810_c14_5b6f_return_output;
     -- MUX[uxn_opcodes_h_l2810_c14_ea88] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2810_c14_ea88_cond <= VAR_MUX_uxn_opcodes_h_l2810_c14_ea88_cond;
     MUX_uxn_opcodes_h_l2810_c14_ea88_iftrue <= VAR_MUX_uxn_opcodes_h_l2810_c14_ea88_iftrue;
     MUX_uxn_opcodes_h_l2810_c14_ea88_iffalse <= VAR_MUX_uxn_opcodes_h_l2810_c14_ea88_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2810_c14_ea88_return_output := MUX_uxn_opcodes_h_l2810_c14_ea88_return_output;

     -- Submodule level 6
     VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_cond := VAR_MUX_uxn_opcodes_h_l2810_c14_ea88_return_output;
     REG_VAR_is_imm := VAR_MUX_uxn_opcodes_h_l2810_c14_ea88_return_output;
     -- MUX[uxn_opcodes_h_l2811_c8_cea1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2811_c8_cea1_cond <= VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_cond;
     MUX_uxn_opcodes_h_l2811_c8_cea1_iftrue <= VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_iftrue;
     MUX_uxn_opcodes_h_l2811_c8_cea1_iffalse <= VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output := MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;

     -- Submodule level 7
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_left := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     REG_VAR_opc := VAR_MUX_uxn_opcodes_h_l2811_c8_cea1_return_output;
     -- BIN_OP_EQ[uxn_opcodes_h_l2885_c11_8d76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_left;
     BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_return_output := BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2838_c11_e4b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2857_c11_5b24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_left;
     BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_return_output := BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2817_c6_5722] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_left;
     BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_return_output := BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2862_c11_d1e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2836_c11_0477] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_left;
     BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_return_output := BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2867_c11_bc10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_left;
     BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_return_output := BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2869_c11_7660] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_left;
     BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_return_output := BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2819_c11_5153] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_left;
     BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_return_output := BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2829_c11_a0ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2849_c11_eb9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2872_c11_4581] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_left;
     BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_return_output := BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2827_c11_c5e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2835_c11_701b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2834_c11_2f2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2845_c11_4aa4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2873_c11_9541] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_left;
     BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_return_output := BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2868_c11_a3d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2822_c11_ef66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_left;
     BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_return_output := BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2884_c11_3a52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_left;
     BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_return_output := BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2828_c11_5bc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2850_c11_9b1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2833_c11_3b98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_left;
     BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_return_output := BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2846_c11_1b89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_left;
     BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_return_output := BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2863_c11_1700] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_left;
     BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_return_output := BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2859_c11_792e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2871_c11_443c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2844_c11_83cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2824_c11_feac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2831_c11_c6d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2874_c11_e16e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2826_c11_9958] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_left;
     BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_return_output := BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2883_c11_3d35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_left;
     BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_return_output := BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2837_c11_6896] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_left;
     BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_return_output := BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2820_c11_8a1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2882_c11_a96d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2839_c11_e192] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_left;
     BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_return_output := BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2881_c11_d4aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2821_c11_30a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2860_c11_f0e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2832_c11_f6da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_left;
     BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_return_output := BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2851_c11_6d61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_left;
     BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_return_output := BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2840_c11_3ba4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2861_c11_3fee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2866_c11_8dec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2841_c11_d8d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2842_c11_54fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2877_c11_faae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2830_c11_8bf1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2856_c11_078b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2858_c11_4373] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_left;
     BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_return_output := BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2825_c11_d412] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_left;
     BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_return_output := BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2886_c11_d522] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_left;
     BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_return_output := BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2818_c11_a462] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_left;
     BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_return_output := BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2847_c11_fe6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2876_c11_46f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_0536] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2823_c11_7300] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_left;
     BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_return_output := BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2879_c11_f12d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2843_c11_aab9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2878_c11_a07c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2852_c11_d58a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2854_c11_1d6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2865_c11_b532] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_left;
     BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_return_output := BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2870_c11_99a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2864_c11_4c2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2855_c11_7df2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2853_c11_f2f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2848_c11_4d89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_left;
     BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_return_output := BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2880_c11_3099] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_left;
     BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_return_output := BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_5722_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2818_c11_a462_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2819_c11_5153_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c11_8a1e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2821_c11_30a8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2822_c11_ef66_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_7300_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2824_c11_feac_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_d412_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_9958_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2827_c11_c5e3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5bc3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2829_c11_a0ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_8bf1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2831_c11_c6d6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2832_c11_f6da_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_3b98_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2834_c11_2f2f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2835_c11_701b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_0477_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2837_c11_6896_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2838_c11_e4b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_e192_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_3ba4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2841_c11_d8d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2842_c11_54fd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_aab9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2844_c11_83cd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_4aa4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2846_c11_1b89_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2847_c11_fe6f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_4d89_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2849_c11_eb9c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2850_c11_9b1f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_6d61_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2852_c11_d58a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2853_c11_f2f8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2854_c11_1d6d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2855_c11_7df2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_078b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2857_c11_5b24_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2858_c11_4373_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2859_c11_792e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2860_c11_f0e5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2861_c11_3fee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_d1e8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2863_c11_1700_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2864_c11_4c2e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2865_c11_b532_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_8dec_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2867_c11_bc10_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2868_c11_a3d0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2869_c11_7660_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2870_c11_99a5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_443c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2872_c11_4581_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2873_c11_9541_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2874_c11_e16e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0536_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2876_c11_46f2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2877_c11_faae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2878_c11_a07c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2879_c11_f12d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2880_c11_3099_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2881_c11_d4aa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2882_c11_a96d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2883_c11_3d35_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2884_c11_3a52_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2885_c11_8d76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2886_c11_d522_return_output;
     -- is_wait_MUX[uxn_opcodes_h_l2817_c2_9763] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_cond;
     is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_return_output := is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2818_c7_2ba7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2819_c7_b43e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2818_c1_f1a1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output;
     VAR_jci_uxn_opcodes_h_l2818_c40_927c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2818_c1_f1a1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2819_c1_d0e5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_return_output;

     -- jci[uxn_opcodes_h_l2818_c40_927c] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2818_c40_927c_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2818_c40_927c_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2818_c40_927c_phase <= VAR_jci_uxn_opcodes_h_l2818_c40_927c_phase;
     jci_uxn_opcodes_h_l2818_c40_927c_pc <= VAR_jci_uxn_opcodes_h_l2818_c40_927c_pc;
     jci_uxn_opcodes_h_l2818_c40_927c_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2818_c40_927c_previous_stack_read;
     jci_uxn_opcodes_h_l2818_c40_927c_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2818_c40_927c_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2818_c40_927c_return_output := jci_uxn_opcodes_h_l2818_c40_927c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2820_c7_712e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c7_712e_return_output;
     VAR_jmi_uxn_opcodes_h_l2819_c40_3494_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2819_c1_d0e5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_iftrue := VAR_jci_uxn_opcodes_h_l2818_c40_927c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2820_c1_e9bd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2821_c7_bfd5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output;

     -- jmi[uxn_opcodes_h_l2819_c40_3494] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2819_c40_3494_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2819_c40_3494_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2819_c40_3494_phase <= VAR_jmi_uxn_opcodes_h_l2819_c40_3494_phase;
     jmi_uxn_opcodes_h_l2819_c40_3494_pc <= VAR_jmi_uxn_opcodes_h_l2819_c40_3494_pc;
     jmi_uxn_opcodes_h_l2819_c40_3494_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2819_c40_3494_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2819_c40_3494_return_output := jmi_uxn_opcodes_h_l2819_c40_3494_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output;
     VAR_jsi_uxn_opcodes_h_l2820_c40_29da_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_e9bd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_iftrue := VAR_jmi_uxn_opcodes_h_l2819_c40_3494_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2822_c7_705c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_return_output;

     -- jsi[uxn_opcodes_h_l2820_c40_29da] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2820_c40_29da_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2820_c40_29da_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2820_c40_29da_phase <= VAR_jsi_uxn_opcodes_h_l2820_c40_29da_phase;
     jsi_uxn_opcodes_h_l2820_c40_29da_pc <= VAR_jsi_uxn_opcodes_h_l2820_c40_29da_pc;
     jsi_uxn_opcodes_h_l2820_c40_29da_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2820_c40_29da_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2820_c40_29da_return_output := jsi_uxn_opcodes_h_l2820_c40_29da_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2821_c1_b41f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c7_705c_return_output;
     VAR_lit_uxn_opcodes_h_l2821_c40_1486_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2821_c1_b41f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_iftrue := VAR_jsi_uxn_opcodes_h_l2820_c40_29da_return_output;
     -- lit[uxn_opcodes_h_l2821_c40_1486] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2821_c40_1486_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2821_c40_1486_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2821_c40_1486_phase <= VAR_lit_uxn_opcodes_h_l2821_c40_1486_phase;
     lit_uxn_opcodes_h_l2821_c40_1486_pc <= VAR_lit_uxn_opcodes_h_l2821_c40_1486_pc;
     lit_uxn_opcodes_h_l2821_c40_1486_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2821_c40_1486_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2821_c40_1486_return_output := lit_uxn_opcodes_h_l2821_c40_1486_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2822_c1_1982] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2823_c7_3341] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c7_3341_return_output;
     VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2822_c1_1982_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_iftrue := VAR_lit_uxn_opcodes_h_l2821_c40_1486_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2823_c1_8a2e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_return_output;

     -- lit2[uxn_opcodes_h_l2822_c40_03f9] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2822_c40_03f9_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2822_c40_03f9_phase <= VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_phase;
     lit2_uxn_opcodes_h_l2822_c40_03f9_pc <= VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_pc;
     lit2_uxn_opcodes_h_l2822_c40_03f9_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_return_output := lit2_uxn_opcodes_h_l2822_c40_03f9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2824_c7_276a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c7_276a_return_output;
     VAR_lit_uxn_opcodes_h_l2823_c40_f67e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2823_c1_8a2e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_iftrue := VAR_lit2_uxn_opcodes_h_l2822_c40_03f9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2825_c7_7461] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2824_c1_9c64] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_return_output;

     -- lit[uxn_opcodes_h_l2823_c40_f67e] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2823_c40_f67e_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2823_c40_f67e_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2823_c40_f67e_phase <= VAR_lit_uxn_opcodes_h_l2823_c40_f67e_phase;
     lit_uxn_opcodes_h_l2823_c40_f67e_pc <= VAR_lit_uxn_opcodes_h_l2823_c40_f67e_pc;
     lit_uxn_opcodes_h_l2823_c40_f67e_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2823_c40_f67e_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2823_c40_f67e_return_output := lit_uxn_opcodes_h_l2823_c40_f67e_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c7_7461_return_output;
     VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2824_c1_9c64_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_iftrue := VAR_lit_uxn_opcodes_h_l2823_c40_f67e_return_output;
     -- lit2[uxn_opcodes_h_l2824_c40_e6d9] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2824_c40_e6d9_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2824_c40_e6d9_phase <= VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_phase;
     lit2_uxn_opcodes_h_l2824_c40_e6d9_pc <= VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_pc;
     lit2_uxn_opcodes_h_l2824_c40_e6d9_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_return_output := lit2_uxn_opcodes_h_l2824_c40_e6d9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2825_c1_10bf] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2826_c7_58a9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output;
     VAR_inc_uxn_opcodes_h_l2825_c40_67e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2825_c1_10bf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_iftrue := VAR_lit2_uxn_opcodes_h_l2824_c40_e6d9_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2826_c1_2dda] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2827_c7_9e41] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output;

     -- inc[uxn_opcodes_h_l2825_c40_67e1] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2825_c40_67e1_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2825_c40_67e1_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2825_c40_67e1_phase <= VAR_inc_uxn_opcodes_h_l2825_c40_67e1_phase;
     inc_uxn_opcodes_h_l2825_c40_67e1_ins <= VAR_inc_uxn_opcodes_h_l2825_c40_67e1_ins;
     inc_uxn_opcodes_h_l2825_c40_67e1_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2825_c40_67e1_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2825_c40_67e1_return_output := inc_uxn_opcodes_h_l2825_c40_67e1_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output;
     VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2826_c1_2dda_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_iftrue := VAR_inc_uxn_opcodes_h_l2825_c40_67e1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2827_c1_a6eb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2828_c7_8eb7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output;

     -- inc2[uxn_opcodes_h_l2826_c40_6c0b] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2826_c40_6c0b_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2826_c40_6c0b_phase <= VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_phase;
     inc2_uxn_opcodes_h_l2826_c40_6c0b_ins <= VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_ins;
     inc2_uxn_opcodes_h_l2826_c40_6c0b_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_return_output := inc2_uxn_opcodes_h_l2826_c40_6c0b_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output;
     VAR_pop_uxn_opcodes_h_l2827_c40_f7dd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2827_c1_a6eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_iftrue := VAR_inc2_uxn_opcodes_h_l2826_c40_6c0b_return_output;
     -- pop[uxn_opcodes_h_l2827_c40_f7dd] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2827_c40_f7dd_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2827_c40_f7dd_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2827_c40_f7dd_phase <= VAR_pop_uxn_opcodes_h_l2827_c40_f7dd_phase;
     pop_uxn_opcodes_h_l2827_c40_f7dd_ins <= VAR_pop_uxn_opcodes_h_l2827_c40_f7dd_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2827_c40_f7dd_return_output := pop_uxn_opcodes_h_l2827_c40_f7dd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2828_c1_5948] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2829_c7_751d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c7_751d_return_output;
     VAR_pop2_uxn_opcodes_h_l2828_c40_6749_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2828_c1_5948_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_iftrue := VAR_pop_uxn_opcodes_h_l2827_c40_f7dd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2829_c1_dbec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2830_c7_2548] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_return_output;

     -- pop2[uxn_opcodes_h_l2828_c40_6749] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2828_c40_6749_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2828_c40_6749_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2828_c40_6749_phase <= VAR_pop2_uxn_opcodes_h_l2828_c40_6749_phase;
     pop2_uxn_opcodes_h_l2828_c40_6749_ins <= VAR_pop2_uxn_opcodes_h_l2828_c40_6749_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2828_c40_6749_return_output := pop2_uxn_opcodes_h_l2828_c40_6749_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c7_2548_return_output;
     VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2829_c1_dbec_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_iftrue := VAR_pop2_uxn_opcodes_h_l2828_c40_6749_return_output;
     -- nip[uxn_opcodes_h_l2829_c40_1bc5] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2829_c40_1bc5_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2829_c40_1bc5_phase <= VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_phase;
     nip_uxn_opcodes_h_l2829_c40_1bc5_ins <= VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_ins;
     nip_uxn_opcodes_h_l2829_c40_1bc5_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_return_output := nip_uxn_opcodes_h_l2829_c40_1bc5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2830_c1_2c92] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2831_c7_42e0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output;
     VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2830_c1_2c92_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_iftrue := VAR_nip_uxn_opcodes_h_l2829_c40_1bc5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2832_c7_a31f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2831_c1_c140] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_return_output;

     -- nip2[uxn_opcodes_h_l2830_c40_bda0] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2830_c40_bda0_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2830_c40_bda0_phase <= VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_phase;
     nip2_uxn_opcodes_h_l2830_c40_bda0_ins <= VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_ins;
     nip2_uxn_opcodes_h_l2830_c40_bda0_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_return_output := nip2_uxn_opcodes_h_l2830_c40_bda0_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output;
     VAR_swp_uxn_opcodes_h_l2831_c40_e273_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2831_c1_c140_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_iftrue := VAR_nip2_uxn_opcodes_h_l2830_c40_bda0_return_output;
     -- swp[uxn_opcodes_h_l2831_c40_e273] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2831_c40_e273_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2831_c40_e273_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2831_c40_e273_phase <= VAR_swp_uxn_opcodes_h_l2831_c40_e273_phase;
     swp_uxn_opcodes_h_l2831_c40_e273_ins <= VAR_swp_uxn_opcodes_h_l2831_c40_e273_ins;
     swp_uxn_opcodes_h_l2831_c40_e273_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2831_c40_e273_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2831_c40_e273_return_output := swp_uxn_opcodes_h_l2831_c40_e273_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2833_c7_7f72] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2832_c1_b4b9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output;
     VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2832_c1_b4b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_iftrue := VAR_swp_uxn_opcodes_h_l2831_c40_e273_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2833_c1_bc02] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2834_c7_afc9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output;

     -- swp2[uxn_opcodes_h_l2832_c40_c0c6] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2832_c40_c0c6_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2832_c40_c0c6_phase <= VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_phase;
     swp2_uxn_opcodes_h_l2832_c40_c0c6_ins <= VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_ins;
     swp2_uxn_opcodes_h_l2832_c40_c0c6_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_return_output := swp2_uxn_opcodes_h_l2832_c40_c0c6_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output;
     VAR_rot_uxn_opcodes_h_l2833_c40_e33c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2833_c1_bc02_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_iftrue := VAR_swp2_uxn_opcodes_h_l2832_c40_c0c6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2834_c1_74df] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_return_output;

     -- rot[uxn_opcodes_h_l2833_c40_e33c] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2833_c40_e33c_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2833_c40_e33c_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2833_c40_e33c_phase <= VAR_rot_uxn_opcodes_h_l2833_c40_e33c_phase;
     rot_uxn_opcodes_h_l2833_c40_e33c_ins <= VAR_rot_uxn_opcodes_h_l2833_c40_e33c_ins;
     rot_uxn_opcodes_h_l2833_c40_e33c_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2833_c40_e33c_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2833_c40_e33c_return_output := rot_uxn_opcodes_h_l2833_c40_e33c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2835_c7_c061] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c7_c061_return_output;
     VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2834_c1_74df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_iftrue := VAR_rot_uxn_opcodes_h_l2833_c40_e33c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2835_c1_4fd8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2836_c7_44e6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output;

     -- rot2[uxn_opcodes_h_l2834_c40_83d2] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2834_c40_83d2_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2834_c40_83d2_phase <= VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_phase;
     rot2_uxn_opcodes_h_l2834_c40_83d2_ins <= VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_ins;
     rot2_uxn_opcodes_h_l2834_c40_83d2_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_return_output := rot2_uxn_opcodes_h_l2834_c40_83d2_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output;
     VAR_dup_uxn_opcodes_h_l2835_c40_f699_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2835_c1_4fd8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_iftrue := VAR_rot2_uxn_opcodes_h_l2834_c40_83d2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2837_c7_79bd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output;

     -- dup[uxn_opcodes_h_l2835_c40_f699] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2835_c40_f699_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2835_c40_f699_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2835_c40_f699_phase <= VAR_dup_uxn_opcodes_h_l2835_c40_f699_phase;
     dup_uxn_opcodes_h_l2835_c40_f699_ins <= VAR_dup_uxn_opcodes_h_l2835_c40_f699_ins;
     dup_uxn_opcodes_h_l2835_c40_f699_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2835_c40_f699_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2835_c40_f699_return_output := dup_uxn_opcodes_h_l2835_c40_f699_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2836_c1_b2de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output;
     VAR_dup2_uxn_opcodes_h_l2836_c40_239a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2836_c1_b2de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_iftrue := VAR_dup_uxn_opcodes_h_l2835_c40_f699_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2837_c1_1767] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2838_c7_f0eb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output;

     -- dup2[uxn_opcodes_h_l2836_c40_239a] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2836_c40_239a_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2836_c40_239a_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2836_c40_239a_phase <= VAR_dup2_uxn_opcodes_h_l2836_c40_239a_phase;
     dup2_uxn_opcodes_h_l2836_c40_239a_ins <= VAR_dup2_uxn_opcodes_h_l2836_c40_239a_ins;
     dup2_uxn_opcodes_h_l2836_c40_239a_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2836_c40_239a_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2836_c40_239a_return_output := dup2_uxn_opcodes_h_l2836_c40_239a_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output;
     VAR_ovr_uxn_opcodes_h_l2837_c40_df96_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2837_c1_1767_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_iftrue := VAR_dup2_uxn_opcodes_h_l2836_c40_239a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2838_c1_a194] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2839_c7_a980] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_return_output;

     -- ovr[uxn_opcodes_h_l2837_c40_df96] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2837_c40_df96_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2837_c40_df96_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2837_c40_df96_phase <= VAR_ovr_uxn_opcodes_h_l2837_c40_df96_phase;
     ovr_uxn_opcodes_h_l2837_c40_df96_ins <= VAR_ovr_uxn_opcodes_h_l2837_c40_df96_ins;
     ovr_uxn_opcodes_h_l2837_c40_df96_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2837_c40_df96_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2837_c40_df96_return_output := ovr_uxn_opcodes_h_l2837_c40_df96_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c7_a980_return_output;
     VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2838_c1_a194_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_iftrue := VAR_ovr_uxn_opcodes_h_l2837_c40_df96_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2840_c7_40ce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output;

     -- ovr2[uxn_opcodes_h_l2838_c40_967c] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2838_c40_967c_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2838_c40_967c_phase <= VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_phase;
     ovr2_uxn_opcodes_h_l2838_c40_967c_ins <= VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_ins;
     ovr2_uxn_opcodes_h_l2838_c40_967c_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_return_output := ovr2_uxn_opcodes_h_l2838_c40_967c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2839_c1_6f8c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output;
     VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2839_c1_6f8c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_iftrue := VAR_ovr2_uxn_opcodes_h_l2838_c40_967c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2841_c7_3fa5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output;

     -- equ[uxn_opcodes_h_l2839_c40_bc0e] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2839_c40_bc0e_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2839_c40_bc0e_phase <= VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_phase;
     equ_uxn_opcodes_h_l2839_c40_bc0e_ins <= VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_ins;
     equ_uxn_opcodes_h_l2839_c40_bc0e_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_return_output := equ_uxn_opcodes_h_l2839_c40_bc0e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2840_c1_e2a5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output;
     VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2840_c1_e2a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_iftrue := VAR_equ_uxn_opcodes_h_l2839_c40_bc0e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2842_c7_9c87] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2841_c1_86b9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_return_output;

     -- equ2[uxn_opcodes_h_l2840_c40_bd97] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2840_c40_bd97_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2840_c40_bd97_phase <= VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_phase;
     equ2_uxn_opcodes_h_l2840_c40_bd97_ins <= VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_ins;
     equ2_uxn_opcodes_h_l2840_c40_bd97_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_return_output := equ2_uxn_opcodes_h_l2840_c40_bd97_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output;
     VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2841_c1_86b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_iftrue := VAR_equ2_uxn_opcodes_h_l2840_c40_bd97_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2842_c1_dda2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2843_c7_9340] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_return_output;

     -- neq[uxn_opcodes_h_l2841_c40_cd3c] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2841_c40_cd3c_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2841_c40_cd3c_phase <= VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_phase;
     neq_uxn_opcodes_h_l2841_c40_cd3c_ins <= VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_ins;
     neq_uxn_opcodes_h_l2841_c40_cd3c_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_return_output := neq_uxn_opcodes_h_l2841_c40_cd3c_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c7_9340_return_output;
     VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2842_c1_dda2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_iftrue := VAR_neq_uxn_opcodes_h_l2841_c40_cd3c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2843_c1_62e6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_return_output;

     -- neq2[uxn_opcodes_h_l2842_c40_9ae9] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2842_c40_9ae9_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2842_c40_9ae9_phase <= VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_phase;
     neq2_uxn_opcodes_h_l2842_c40_9ae9_ins <= VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_ins;
     neq2_uxn_opcodes_h_l2842_c40_9ae9_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_return_output := neq2_uxn_opcodes_h_l2842_c40_9ae9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2844_c7_bdbf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output;
     VAR_gth_uxn_opcodes_h_l2843_c40_2acd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2843_c1_62e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_iftrue := VAR_neq2_uxn_opcodes_h_l2842_c40_9ae9_return_output;
     -- gth[uxn_opcodes_h_l2843_c40_2acd] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2843_c40_2acd_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2843_c40_2acd_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2843_c40_2acd_phase <= VAR_gth_uxn_opcodes_h_l2843_c40_2acd_phase;
     gth_uxn_opcodes_h_l2843_c40_2acd_ins <= VAR_gth_uxn_opcodes_h_l2843_c40_2acd_ins;
     gth_uxn_opcodes_h_l2843_c40_2acd_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2843_c40_2acd_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2843_c40_2acd_return_output := gth_uxn_opcodes_h_l2843_c40_2acd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2845_c7_385f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2844_c1_e8d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c7_385f_return_output;
     VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2844_c1_e8d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_iftrue := VAR_gth_uxn_opcodes_h_l2843_c40_2acd_return_output;
     -- gth2[uxn_opcodes_h_l2844_c40_c85b] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2844_c40_c85b_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2844_c40_c85b_phase <= VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_phase;
     gth2_uxn_opcodes_h_l2844_c40_c85b_ins <= VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_ins;
     gth2_uxn_opcodes_h_l2844_c40_c85b_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_return_output := gth2_uxn_opcodes_h_l2844_c40_c85b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2846_c7_2785] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2845_c1_4f32] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c7_2785_return_output;
     VAR_lth_uxn_opcodes_h_l2845_c40_131f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2845_c1_4f32_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_iftrue := VAR_gth2_uxn_opcodes_h_l2844_c40_c85b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2846_c1_04f5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_return_output;

     -- lth[uxn_opcodes_h_l2845_c40_131f] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2845_c40_131f_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2845_c40_131f_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2845_c40_131f_phase <= VAR_lth_uxn_opcodes_h_l2845_c40_131f_phase;
     lth_uxn_opcodes_h_l2845_c40_131f_ins <= VAR_lth_uxn_opcodes_h_l2845_c40_131f_ins;
     lth_uxn_opcodes_h_l2845_c40_131f_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2845_c40_131f_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2845_c40_131f_return_output := lth_uxn_opcodes_h_l2845_c40_131f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2847_c7_c67e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output;
     VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2846_c1_04f5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_iftrue := VAR_lth_uxn_opcodes_h_l2845_c40_131f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2847_c1_71bd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_return_output;

     -- lth2[uxn_opcodes_h_l2846_c40_6a95] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2846_c40_6a95_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2846_c40_6a95_phase <= VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_phase;
     lth2_uxn_opcodes_h_l2846_c40_6a95_ins <= VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_ins;
     lth2_uxn_opcodes_h_l2846_c40_6a95_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_return_output := lth2_uxn_opcodes_h_l2846_c40_6a95_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2848_c7_e78f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output;
     VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2847_c1_71bd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_iftrue := VAR_lth2_uxn_opcodes_h_l2846_c40_6a95_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2849_c7_5649] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_return_output;

     -- jmp[uxn_opcodes_h_l2847_c40_b3e1] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2847_c40_b3e1_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2847_c40_b3e1_phase <= VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_phase;
     jmp_uxn_opcodes_h_l2847_c40_b3e1_ins <= VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_ins;
     jmp_uxn_opcodes_h_l2847_c40_b3e1_pc <= VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_pc;
     jmp_uxn_opcodes_h_l2847_c40_b3e1_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_return_output := jmp_uxn_opcodes_h_l2847_c40_b3e1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2848_c1_d52d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c7_5649_return_output;
     VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2848_c1_d52d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_iftrue := VAR_jmp_uxn_opcodes_h_l2847_c40_b3e1_return_output;
     -- jmp2[uxn_opcodes_h_l2848_c40_1a5a] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2848_c40_1a5a_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2848_c40_1a5a_phase <= VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_phase;
     jmp2_uxn_opcodes_h_l2848_c40_1a5a_ins <= VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_ins;
     jmp2_uxn_opcodes_h_l2848_c40_1a5a_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_return_output := jmp2_uxn_opcodes_h_l2848_c40_1a5a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2849_c1_7cad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2850_c7_2eff] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output;
     VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2849_c1_7cad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_iftrue := VAR_jmp2_uxn_opcodes_h_l2848_c40_1a5a_return_output;
     -- jcn[uxn_opcodes_h_l2849_c40_0ac1] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2849_c40_0ac1_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2849_c40_0ac1_phase <= VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_phase;
     jcn_uxn_opcodes_h_l2849_c40_0ac1_ins <= VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_ins;
     jcn_uxn_opcodes_h_l2849_c40_0ac1_pc <= VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_pc;
     jcn_uxn_opcodes_h_l2849_c40_0ac1_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_return_output := jcn_uxn_opcodes_h_l2849_c40_0ac1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2850_c1_bcc4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2851_c7_ad1b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output;
     VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2850_c1_bcc4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_iftrue := VAR_jcn_uxn_opcodes_h_l2849_c40_0ac1_return_output;
     -- jcn2[uxn_opcodes_h_l2850_c40_02a3] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2850_c40_02a3_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2850_c40_02a3_phase <= VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_phase;
     jcn2_uxn_opcodes_h_l2850_c40_02a3_ins <= VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_ins;
     jcn2_uxn_opcodes_h_l2850_c40_02a3_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_return_output := jcn2_uxn_opcodes_h_l2850_c40_02a3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2851_c1_b724] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2852_c7_8795] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c7_8795_return_output;
     VAR_jsr_uxn_opcodes_h_l2851_c40_730a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2851_c1_b724_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_iftrue := VAR_jcn2_uxn_opcodes_h_l2850_c40_02a3_return_output;
     -- jsr[uxn_opcodes_h_l2851_c40_730a] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2851_c40_730a_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2851_c40_730a_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2851_c40_730a_phase <= VAR_jsr_uxn_opcodes_h_l2851_c40_730a_phase;
     jsr_uxn_opcodes_h_l2851_c40_730a_ins <= VAR_jsr_uxn_opcodes_h_l2851_c40_730a_ins;
     jsr_uxn_opcodes_h_l2851_c40_730a_pc <= VAR_jsr_uxn_opcodes_h_l2851_c40_730a_pc;
     jsr_uxn_opcodes_h_l2851_c40_730a_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2851_c40_730a_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2851_c40_730a_return_output := jsr_uxn_opcodes_h_l2851_c40_730a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2853_c7_1c7f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2852_c1_3a42] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output;
     VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2852_c1_3a42_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_iftrue := VAR_jsr_uxn_opcodes_h_l2851_c40_730a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2854_c7_5d9c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output;

     -- jsr2[uxn_opcodes_h_l2852_c40_ae45] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2852_c40_ae45_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2852_c40_ae45_phase <= VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_phase;
     jsr2_uxn_opcodes_h_l2852_c40_ae45_ins <= VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_ins;
     jsr2_uxn_opcodes_h_l2852_c40_ae45_pc <= VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_pc;
     jsr2_uxn_opcodes_h_l2852_c40_ae45_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_return_output := jsr2_uxn_opcodes_h_l2852_c40_ae45_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2853_c1_6b36] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output;
     VAR_sth_uxn_opcodes_h_l2853_c40_b08a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2853_c1_6b36_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_iftrue := VAR_jsr2_uxn_opcodes_h_l2852_c40_ae45_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2855_c7_9b3c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output;

     -- sth[uxn_opcodes_h_l2853_c40_b08a] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2853_c40_b08a_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2853_c40_b08a_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2853_c40_b08a_phase <= VAR_sth_uxn_opcodes_h_l2853_c40_b08a_phase;
     sth_uxn_opcodes_h_l2853_c40_b08a_ins <= VAR_sth_uxn_opcodes_h_l2853_c40_b08a_ins;
     sth_uxn_opcodes_h_l2853_c40_b08a_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2853_c40_b08a_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2853_c40_b08a_return_output := sth_uxn_opcodes_h_l2853_c40_b08a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2854_c1_d4af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output;
     VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2854_c1_d4af_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_iftrue := VAR_sth_uxn_opcodes_h_l2853_c40_b08a_return_output;
     -- sth2[uxn_opcodes_h_l2854_c40_c1f0] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2854_c40_c1f0_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2854_c40_c1f0_phase <= VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_phase;
     sth2_uxn_opcodes_h_l2854_c40_c1f0_ins <= VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_ins;
     sth2_uxn_opcodes_h_l2854_c40_c1f0_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_return_output := sth2_uxn_opcodes_h_l2854_c40_c1f0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2855_c1_0ce2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2856_c7_bfb0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output;
     VAR_ldz_uxn_opcodes_h_l2855_c40_a251_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2855_c1_0ce2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_iftrue := VAR_sth2_uxn_opcodes_h_l2854_c40_c1f0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2857_c7_9d3f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2856_c1_76ad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_return_output;

     -- ldz[uxn_opcodes_h_l2855_c40_a251] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2855_c40_a251_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2855_c40_a251_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2855_c40_a251_phase <= VAR_ldz_uxn_opcodes_h_l2855_c40_a251_phase;
     ldz_uxn_opcodes_h_l2855_c40_a251_ins <= VAR_ldz_uxn_opcodes_h_l2855_c40_a251_ins;
     ldz_uxn_opcodes_h_l2855_c40_a251_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2855_c40_a251_previous_stack_read;
     ldz_uxn_opcodes_h_l2855_c40_a251_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2855_c40_a251_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2855_c40_a251_return_output := ldz_uxn_opcodes_h_l2855_c40_a251_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output;
     VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2856_c1_76ad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_iftrue := VAR_ldz_uxn_opcodes_h_l2855_c40_a251_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2857_c1_65ab] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2858_c7_38f4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output;

     -- ldz2[uxn_opcodes_h_l2856_c40_9859] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2856_c40_9859_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2856_c40_9859_phase <= VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_phase;
     ldz2_uxn_opcodes_h_l2856_c40_9859_ins <= VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_ins;
     ldz2_uxn_opcodes_h_l2856_c40_9859_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_previous_stack_read;
     ldz2_uxn_opcodes_h_l2856_c40_9859_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_return_output := ldz2_uxn_opcodes_h_l2856_c40_9859_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output;
     VAR_stz_uxn_opcodes_h_l2857_c40_380c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2857_c1_65ab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_iftrue := VAR_ldz2_uxn_opcodes_h_l2856_c40_9859_return_output;
     -- stz[uxn_opcodes_h_l2857_c40_380c] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2857_c40_380c_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2857_c40_380c_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2857_c40_380c_phase <= VAR_stz_uxn_opcodes_h_l2857_c40_380c_phase;
     stz_uxn_opcodes_h_l2857_c40_380c_ins <= VAR_stz_uxn_opcodes_h_l2857_c40_380c_ins;
     stz_uxn_opcodes_h_l2857_c40_380c_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2857_c40_380c_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2857_c40_380c_return_output := stz_uxn_opcodes_h_l2857_c40_380c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2858_c1_356f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2859_c7_146b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c7_146b_return_output;
     VAR_stz2_uxn_opcodes_h_l2858_c40_7211_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2858_c1_356f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_iftrue := VAR_stz_uxn_opcodes_h_l2857_c40_380c_return_output;
     -- stz2[uxn_opcodes_h_l2858_c40_7211] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2858_c40_7211_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2858_c40_7211_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2858_c40_7211_phase <= VAR_stz2_uxn_opcodes_h_l2858_c40_7211_phase;
     stz2_uxn_opcodes_h_l2858_c40_7211_ins <= VAR_stz2_uxn_opcodes_h_l2858_c40_7211_ins;
     stz2_uxn_opcodes_h_l2858_c40_7211_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2858_c40_7211_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2858_c40_7211_return_output := stz2_uxn_opcodes_h_l2858_c40_7211_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2860_c7_1b4a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2859_c1_a814] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output;
     VAR_ldr_uxn_opcodes_h_l2859_c40_436d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2859_c1_a814_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_iftrue := VAR_stz2_uxn_opcodes_h_l2858_c40_7211_return_output;
     -- ldr[uxn_opcodes_h_l2859_c40_436d] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2859_c40_436d_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2859_c40_436d_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2859_c40_436d_phase <= VAR_ldr_uxn_opcodes_h_l2859_c40_436d_phase;
     ldr_uxn_opcodes_h_l2859_c40_436d_ins <= VAR_ldr_uxn_opcodes_h_l2859_c40_436d_ins;
     ldr_uxn_opcodes_h_l2859_c40_436d_pc <= VAR_ldr_uxn_opcodes_h_l2859_c40_436d_pc;
     ldr_uxn_opcodes_h_l2859_c40_436d_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2859_c40_436d_previous_stack_read;
     ldr_uxn_opcodes_h_l2859_c40_436d_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2859_c40_436d_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2859_c40_436d_return_output := ldr_uxn_opcodes_h_l2859_c40_436d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2861_c7_5158] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2860_c1_d131] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c7_5158_return_output;
     VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2860_c1_d131_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_iftrue := VAR_ldr_uxn_opcodes_h_l2859_c40_436d_return_output;
     -- ldr2[uxn_opcodes_h_l2860_c40_8704] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2860_c40_8704_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2860_c40_8704_phase <= VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_phase;
     ldr2_uxn_opcodes_h_l2860_c40_8704_ins <= VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_ins;
     ldr2_uxn_opcodes_h_l2860_c40_8704_pc <= VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_pc;
     ldr2_uxn_opcodes_h_l2860_c40_8704_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_previous_stack_read;
     ldr2_uxn_opcodes_h_l2860_c40_8704_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_return_output := ldr2_uxn_opcodes_h_l2860_c40_8704_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2862_c7_8f38] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2861_c1_e1b0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output;
     VAR_str1_uxn_opcodes_h_l2861_c40_33aa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2861_c1_e1b0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_iftrue := VAR_ldr2_uxn_opcodes_h_l2860_c40_8704_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2863_c7_d4ce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output;

     -- str1[uxn_opcodes_h_l2861_c40_33aa] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2861_c40_33aa_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2861_c40_33aa_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2861_c40_33aa_phase <= VAR_str1_uxn_opcodes_h_l2861_c40_33aa_phase;
     str1_uxn_opcodes_h_l2861_c40_33aa_ins <= VAR_str1_uxn_opcodes_h_l2861_c40_33aa_ins;
     str1_uxn_opcodes_h_l2861_c40_33aa_pc <= VAR_str1_uxn_opcodes_h_l2861_c40_33aa_pc;
     str1_uxn_opcodes_h_l2861_c40_33aa_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2861_c40_33aa_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2861_c40_33aa_return_output := str1_uxn_opcodes_h_l2861_c40_33aa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2862_c1_49b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output;
     VAR_str2_uxn_opcodes_h_l2862_c40_4157_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2862_c1_49b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_iftrue := VAR_str1_uxn_opcodes_h_l2861_c40_33aa_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2864_c7_fdea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2863_c1_7a5b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_return_output;

     -- str2[uxn_opcodes_h_l2862_c40_4157] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2862_c40_4157_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2862_c40_4157_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2862_c40_4157_phase <= VAR_str2_uxn_opcodes_h_l2862_c40_4157_phase;
     str2_uxn_opcodes_h_l2862_c40_4157_ins <= VAR_str2_uxn_opcodes_h_l2862_c40_4157_ins;
     str2_uxn_opcodes_h_l2862_c40_4157_pc <= VAR_str2_uxn_opcodes_h_l2862_c40_4157_pc;
     str2_uxn_opcodes_h_l2862_c40_4157_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2862_c40_4157_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2862_c40_4157_return_output := str2_uxn_opcodes_h_l2862_c40_4157_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output;
     VAR_lda_uxn_opcodes_h_l2863_c40_0529_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2863_c1_7a5b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_iftrue := VAR_str2_uxn_opcodes_h_l2862_c40_4157_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2865_c7_8f99] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output;

     -- lda[uxn_opcodes_h_l2863_c40_0529] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2863_c40_0529_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2863_c40_0529_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2863_c40_0529_phase <= VAR_lda_uxn_opcodes_h_l2863_c40_0529_phase;
     lda_uxn_opcodes_h_l2863_c40_0529_ins <= VAR_lda_uxn_opcodes_h_l2863_c40_0529_ins;
     lda_uxn_opcodes_h_l2863_c40_0529_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2863_c40_0529_previous_stack_read;
     lda_uxn_opcodes_h_l2863_c40_0529_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2863_c40_0529_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2863_c40_0529_return_output := lda_uxn_opcodes_h_l2863_c40_0529_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2864_c1_ec03] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output;
     VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2864_c1_ec03_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_iftrue := VAR_lda_uxn_opcodes_h_l2863_c40_0529_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2865_c1_b844] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2866_c7_8dec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output;

     -- lda2[uxn_opcodes_h_l2864_c40_a0e8] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2864_c40_a0e8_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2864_c40_a0e8_phase <= VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_phase;
     lda2_uxn_opcodes_h_l2864_c40_a0e8_ins <= VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_ins;
     lda2_uxn_opcodes_h_l2864_c40_a0e8_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_previous_stack_read;
     lda2_uxn_opcodes_h_l2864_c40_a0e8_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_return_output := lda2_uxn_opcodes_h_l2864_c40_a0e8_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output;
     VAR_sta_uxn_opcodes_h_l2865_c40_2567_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2865_c1_b844_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_iftrue := VAR_lda2_uxn_opcodes_h_l2864_c40_a0e8_return_output;
     -- sta[uxn_opcodes_h_l2865_c40_2567] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2865_c40_2567_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2865_c40_2567_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2865_c40_2567_phase <= VAR_sta_uxn_opcodes_h_l2865_c40_2567_phase;
     sta_uxn_opcodes_h_l2865_c40_2567_ins <= VAR_sta_uxn_opcodes_h_l2865_c40_2567_ins;
     sta_uxn_opcodes_h_l2865_c40_2567_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2865_c40_2567_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2865_c40_2567_return_output := sta_uxn_opcodes_h_l2865_c40_2567_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2866_c1_39a3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2867_c7_e985] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c7_e985_return_output;
     VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2866_c1_39a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_iftrue := VAR_sta_uxn_opcodes_h_l2865_c40_2567_return_output;
     -- sta2[uxn_opcodes_h_l2866_c40_2d1f] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2866_c40_2d1f_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2866_c40_2d1f_phase <= VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_phase;
     sta2_uxn_opcodes_h_l2866_c40_2d1f_ins <= VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_ins;
     sta2_uxn_opcodes_h_l2866_c40_2d1f_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_return_output := sta2_uxn_opcodes_h_l2866_c40_2d1f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2867_c1_9fd2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2868_c7_bdaa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output;
     VAR_dei_uxn_opcodes_h_l2867_c40_fba3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2867_c1_9fd2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_iftrue := VAR_sta2_uxn_opcodes_h_l2866_c40_2d1f_return_output;
     -- dei[uxn_opcodes_h_l2867_c40_fba3] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2867_c40_fba3_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2867_c40_fba3_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2867_c40_fba3_phase <= VAR_dei_uxn_opcodes_h_l2867_c40_fba3_phase;
     dei_uxn_opcodes_h_l2867_c40_fba3_ins <= VAR_dei_uxn_opcodes_h_l2867_c40_fba3_ins;
     dei_uxn_opcodes_h_l2867_c40_fba3_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2867_c40_fba3_previous_stack_read;
     dei_uxn_opcodes_h_l2867_c40_fba3_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2867_c40_fba3_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2867_c40_fba3_return_output := dei_uxn_opcodes_h_l2867_c40_fba3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2869_c7_1f92] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2868_c1_fdfc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output;
     VAR_dei2_uxn_opcodes_h_l2868_c40_9692_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2868_c1_fdfc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_iftrue := VAR_dei_uxn_opcodes_h_l2867_c40_fba3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2870_c7_b2f3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output;

     -- dei2[uxn_opcodes_h_l2868_c40_9692] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2868_c40_9692_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2868_c40_9692_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2868_c40_9692_phase <= VAR_dei2_uxn_opcodes_h_l2868_c40_9692_phase;
     dei2_uxn_opcodes_h_l2868_c40_9692_ins <= VAR_dei2_uxn_opcodes_h_l2868_c40_9692_ins;
     dei2_uxn_opcodes_h_l2868_c40_9692_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2868_c40_9692_previous_stack_read;
     dei2_uxn_opcodes_h_l2868_c40_9692_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2868_c40_9692_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2868_c40_9692_return_output := dei2_uxn_opcodes_h_l2868_c40_9692_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2869_c1_dea5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output;
     VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2869_c1_dea5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_iftrue := VAR_dei2_uxn_opcodes_h_l2868_c40_9692_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2871_c7_47fb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output;

     -- deo[uxn_opcodes_h_l2869_c40_d4fb] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2869_c40_d4fb_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2869_c40_d4fb_phase <= VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_phase;
     deo_uxn_opcodes_h_l2869_c40_d4fb_ins <= VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_ins;
     deo_uxn_opcodes_h_l2869_c40_d4fb_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_previous_stack_read;
     deo_uxn_opcodes_h_l2869_c40_d4fb_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_previous_device_ram_read;
     deo_uxn_opcodes_h_l2869_c40_d4fb_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_return_output := deo_uxn_opcodes_h_l2869_c40_d4fb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2870_c1_35a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output;
     VAR_deo2_uxn_opcodes_h_l2870_c40_7868_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2870_c1_35a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_iftrue := VAR_deo_uxn_opcodes_h_l2869_c40_d4fb_return_output;
     -- deo2[uxn_opcodes_h_l2870_c40_7868] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2870_c40_7868_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2870_c40_7868_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2870_c40_7868_phase <= VAR_deo2_uxn_opcodes_h_l2870_c40_7868_phase;
     deo2_uxn_opcodes_h_l2870_c40_7868_ins <= VAR_deo2_uxn_opcodes_h_l2870_c40_7868_ins;
     deo2_uxn_opcodes_h_l2870_c40_7868_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2870_c40_7868_previous_stack_read;
     deo2_uxn_opcodes_h_l2870_c40_7868_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2870_c40_7868_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2870_c40_7868_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2870_c40_7868_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2870_c40_7868_return_output := deo2_uxn_opcodes_h_l2870_c40_7868_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c7_4012] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2871_c1_543a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c7_4012_return_output;
     VAR_add_uxn_opcodes_h_l2871_c40_ae3f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2871_c1_543a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_iftrue := VAR_deo2_uxn_opcodes_h_l2870_c40_7868_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c7_2dbc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output;

     -- add[uxn_opcodes_h_l2871_c40_ae3f] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2871_c40_ae3f_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2871_c40_ae3f_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2871_c40_ae3f_phase <= VAR_add_uxn_opcodes_h_l2871_c40_ae3f_phase;
     add_uxn_opcodes_h_l2871_c40_ae3f_ins <= VAR_add_uxn_opcodes_h_l2871_c40_ae3f_ins;
     add_uxn_opcodes_h_l2871_c40_ae3f_previous_stack_read <= VAR_add_uxn_opcodes_h_l2871_c40_ae3f_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2871_c40_ae3f_return_output := add_uxn_opcodes_h_l2871_c40_ae3f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2872_c1_e27c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output;
     VAR_add2_uxn_opcodes_h_l2872_c40_b287_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2872_c1_e27c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_iftrue := VAR_add_uxn_opcodes_h_l2871_c40_ae3f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c7_6ee6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output;

     -- add2[uxn_opcodes_h_l2872_c40_b287] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2872_c40_b287_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2872_c40_b287_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2872_c40_b287_phase <= VAR_add2_uxn_opcodes_h_l2872_c40_b287_phase;
     add2_uxn_opcodes_h_l2872_c40_b287_ins <= VAR_add2_uxn_opcodes_h_l2872_c40_b287_ins;
     add2_uxn_opcodes_h_l2872_c40_b287_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2872_c40_b287_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2872_c40_b287_return_output := add2_uxn_opcodes_h_l2872_c40_b287_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2873_c1_cd60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output;
     VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2873_c1_cd60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_iftrue := VAR_add2_uxn_opcodes_h_l2872_c40_b287_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2874_c1_216d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c7_71f8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output;

     -- sub[uxn_opcodes_h_l2873_c40_bdc7] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2873_c40_bdc7_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2873_c40_bdc7_phase <= VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_phase;
     sub_uxn_opcodes_h_l2873_c40_bdc7_ins <= VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_ins;
     sub_uxn_opcodes_h_l2873_c40_bdc7_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_return_output := sub_uxn_opcodes_h_l2873_c40_bdc7_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output;
     VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2874_c1_216d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_iftrue := VAR_sub_uxn_opcodes_h_l2873_c40_bdc7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2875_c1_21b7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_return_output;

     -- sub2[uxn_opcodes_h_l2874_c40_06d3] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2874_c40_06d3_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2874_c40_06d3_phase <= VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_phase;
     sub2_uxn_opcodes_h_l2874_c40_06d3_ins <= VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_ins;
     sub2_uxn_opcodes_h_l2874_c40_06d3_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_return_output := sub2_uxn_opcodes_h_l2874_c40_06d3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c7_76ca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output;
     VAR_mul_uxn_opcodes_h_l2875_c40_b31e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2875_c1_21b7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_iftrue := VAR_sub2_uxn_opcodes_h_l2874_c40_06d3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2876_c1_62de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_return_output;

     -- mul[uxn_opcodes_h_l2875_c40_b31e] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2875_c40_b31e_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2875_c40_b31e_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2875_c40_b31e_phase <= VAR_mul_uxn_opcodes_h_l2875_c40_b31e_phase;
     mul_uxn_opcodes_h_l2875_c40_b31e_ins <= VAR_mul_uxn_opcodes_h_l2875_c40_b31e_ins;
     mul_uxn_opcodes_h_l2875_c40_b31e_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2875_c40_b31e_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2875_c40_b31e_return_output := mul_uxn_opcodes_h_l2875_c40_b31e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c7_2b75] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output;
     VAR_mul2_uxn_opcodes_h_l2876_c40_7859_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2876_c1_62de_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_iftrue := VAR_mul_uxn_opcodes_h_l2875_c40_b31e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2877_c1_c562] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c7_c6ad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output;

     -- mul2[uxn_opcodes_h_l2876_c40_7859] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2876_c40_7859_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2876_c40_7859_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2876_c40_7859_phase <= VAR_mul2_uxn_opcodes_h_l2876_c40_7859_phase;
     mul2_uxn_opcodes_h_l2876_c40_7859_ins <= VAR_mul2_uxn_opcodes_h_l2876_c40_7859_ins;
     mul2_uxn_opcodes_h_l2876_c40_7859_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2876_c40_7859_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2876_c40_7859_return_output := mul2_uxn_opcodes_h_l2876_c40_7859_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output;
     VAR_div_uxn_opcodes_h_l2877_c40_e2a6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2877_c1_c562_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_iftrue := VAR_mul2_uxn_opcodes_h_l2876_c40_7859_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c7_1f24] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2878_c1_5f97] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_return_output;

     -- div[uxn_opcodes_h_l2877_c40_e2a6] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2877_c40_e2a6_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2877_c40_e2a6_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2877_c40_e2a6_phase <= VAR_div_uxn_opcodes_h_l2877_c40_e2a6_phase;
     div_uxn_opcodes_h_l2877_c40_e2a6_ins <= VAR_div_uxn_opcodes_h_l2877_c40_e2a6_ins;
     div_uxn_opcodes_h_l2877_c40_e2a6_previous_stack_read <= VAR_div_uxn_opcodes_h_l2877_c40_e2a6_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2877_c40_e2a6_return_output := div_uxn_opcodes_h_l2877_c40_e2a6_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output;
     VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2878_c1_5f97_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_iftrue := VAR_div_uxn_opcodes_h_l2877_c40_e2a6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2879_c1_e3af] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c7_db38] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_return_output;

     -- div2[uxn_opcodes_h_l2878_c40_d5d3] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2878_c40_d5d3_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2878_c40_d5d3_phase <= VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_phase;
     div2_uxn_opcodes_h_l2878_c40_d5d3_ins <= VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_ins;
     div2_uxn_opcodes_h_l2878_c40_d5d3_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_return_output := div2_uxn_opcodes_h_l2878_c40_d5d3_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c7_db38_return_output;
     VAR_and_uxn_opcodes_h_l2879_c40_23d4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2879_c1_e3af_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_iftrue := VAR_div2_uxn_opcodes_h_l2878_c40_d5d3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c7_340f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2880_c1_3a5e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_return_output;

     -- and[uxn_opcodes_h_l2879_c40_23d4] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2879_c40_23d4_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2879_c40_23d4_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2879_c40_23d4_phase <= VAR_and_uxn_opcodes_h_l2879_c40_23d4_phase;
     and_uxn_opcodes_h_l2879_c40_23d4_ins <= VAR_and_uxn_opcodes_h_l2879_c40_23d4_ins;
     and_uxn_opcodes_h_l2879_c40_23d4_previous_stack_read <= VAR_and_uxn_opcodes_h_l2879_c40_23d4_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2879_c40_23d4_return_output := and_uxn_opcodes_h_l2879_c40_23d4_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c7_340f_return_output;
     VAR_and2_uxn_opcodes_h_l2880_c40_7c81_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2880_c1_3a5e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_iftrue := VAR_and_uxn_opcodes_h_l2879_c40_23d4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c7_ec71] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output;

     -- and2[uxn_opcodes_h_l2880_c40_7c81] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2880_c40_7c81_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2880_c40_7c81_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2880_c40_7c81_phase <= VAR_and2_uxn_opcodes_h_l2880_c40_7c81_phase;
     and2_uxn_opcodes_h_l2880_c40_7c81_ins <= VAR_and2_uxn_opcodes_h_l2880_c40_7c81_ins;
     and2_uxn_opcodes_h_l2880_c40_7c81_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2880_c40_7c81_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2880_c40_7c81_return_output := and2_uxn_opcodes_h_l2880_c40_7c81_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2881_c1_f94c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output;
     VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2881_c1_f94c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_iftrue := VAR_and2_uxn_opcodes_h_l2880_c40_7c81_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c7_9c26] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2882_c1_7c5d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_return_output;

     -- ora[uxn_opcodes_h_l2881_c40_d7fb] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2881_c40_d7fb_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2881_c40_d7fb_phase <= VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_phase;
     ora_uxn_opcodes_h_l2881_c40_d7fb_ins <= VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_ins;
     ora_uxn_opcodes_h_l2881_c40_d7fb_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_return_output := ora_uxn_opcodes_h_l2881_c40_d7fb_return_output;

     -- Submodule level 74
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output;
     VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2882_c1_7c5d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_iftrue := VAR_ora_uxn_opcodes_h_l2881_c40_d7fb_return_output;
     -- ora2[uxn_opcodes_h_l2882_c40_a3ba] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2882_c40_a3ba_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2882_c40_a3ba_phase <= VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_phase;
     ora2_uxn_opcodes_h_l2882_c40_a3ba_ins <= VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_ins;
     ora2_uxn_opcodes_h_l2882_c40_a3ba_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_return_output := ora2_uxn_opcodes_h_l2882_c40_a3ba_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2883_c1_028a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c7_0d1b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output;

     -- Submodule level 75
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output;
     VAR_eor_uxn_opcodes_h_l2883_c40_770b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2883_c1_028a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_iftrue := VAR_ora2_uxn_opcodes_h_l2882_c40_a3ba_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c7_fbe5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2884_c1_a02a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_return_output;

     -- eor[uxn_opcodes_h_l2883_c40_770b] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2883_c40_770b_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2883_c40_770b_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2883_c40_770b_phase <= VAR_eor_uxn_opcodes_h_l2883_c40_770b_phase;
     eor_uxn_opcodes_h_l2883_c40_770b_ins <= VAR_eor_uxn_opcodes_h_l2883_c40_770b_ins;
     eor_uxn_opcodes_h_l2883_c40_770b_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2883_c40_770b_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2883_c40_770b_return_output := eor_uxn_opcodes_h_l2883_c40_770b_return_output;

     -- Submodule level 76
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output;
     VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2884_c1_a02a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_iftrue := VAR_eor_uxn_opcodes_h_l2883_c40_770b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c7_315f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_return_output;

     -- eor2[uxn_opcodes_h_l2884_c40_db9e] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2884_c40_db9e_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2884_c40_db9e_phase <= VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_phase;
     eor2_uxn_opcodes_h_l2884_c40_db9e_ins <= VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_ins;
     eor2_uxn_opcodes_h_l2884_c40_db9e_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_return_output := eor2_uxn_opcodes_h_l2884_c40_db9e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2885_c1_06fd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_return_output;

     -- Submodule level 77
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c7_315f_return_output;
     VAR_sft_uxn_opcodes_h_l2885_c40_0c28_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2885_c1_06fd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_iftrue := VAR_eor2_uxn_opcodes_h_l2884_c40_db9e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2886_c1_0957] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_return_output;

     -- sft[uxn_opcodes_h_l2885_c40_0c28] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2885_c40_0c28_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2885_c40_0c28_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2885_c40_0c28_phase <= VAR_sft_uxn_opcodes_h_l2885_c40_0c28_phase;
     sft_uxn_opcodes_h_l2885_c40_0c28_ins <= VAR_sft_uxn_opcodes_h_l2885_c40_0c28_ins;
     sft_uxn_opcodes_h_l2885_c40_0c28_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2885_c40_0c28_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2885_c40_0c28_return_output := sft_uxn_opcodes_h_l2885_c40_0c28_return_output;

     -- Submodule level 78
     VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2886_c1_0957_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_iftrue := VAR_sft_uxn_opcodes_h_l2885_c40_0c28_return_output;
     -- sft2[uxn_opcodes_h_l2886_c40_88c2] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2886_c40_88c2_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2886_c40_88c2_phase <= VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_phase;
     sft2_uxn_opcodes_h_l2886_c40_88c2_ins <= VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_ins;
     sft2_uxn_opcodes_h_l2886_c40_88c2_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_return_output := sft2_uxn_opcodes_h_l2886_c40_88c2_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_iftrue := VAR_sft2_uxn_opcodes_h_l2886_c40_88c2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2886_c7_315f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_cond;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_return_output := opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2886_c7_315f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2885_c7_fbe5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_cond;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output := opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2885_c7_fbe5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2884_c7_0d1b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_cond;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output := opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2884_c7_0d1b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2883_c7_9c26] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_cond;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output := opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2883_c7_9c26_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2882_c7_ec71] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_cond;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output := opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2882_c7_ec71_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2881_c7_340f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_cond;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_return_output := opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2881_c7_340f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2880_c7_db38] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_cond;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_return_output := opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2880_c7_db38_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2879_c7_1f24] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_cond;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output := opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2879_c7_1f24_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2878_c7_c6ad] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_cond;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output := opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2878_c7_c6ad_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2877_c7_2b75] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_cond;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output := opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2877_c7_2b75_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2876_c7_76ca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_cond;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output := opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2876_c7_76ca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2875_c7_71f8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_cond;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output := opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2875_c7_71f8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2874_c7_6ee6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_cond;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output := opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2874_c7_6ee6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2873_c7_2dbc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_cond;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output := opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2873_c7_2dbc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2872_c7_4012] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_cond;
     opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_return_output := opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2872_c7_4012_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2871_c7_47fb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_cond;
     opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output := opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2871_c7_47fb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2870_c7_b2f3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_cond;
     opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output := opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2870_c7_b2f3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2869_c7_1f92] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_cond;
     opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output := opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2869_c7_1f92_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2868_c7_bdaa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_cond;
     opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output := opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2868_c7_bdaa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2867_c7_e985] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_cond;
     opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_return_output := opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2867_c7_e985_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2866_c7_8dec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_cond;
     opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output := opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2866_c7_8dec_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2865_c7_8f99] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_cond;
     opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output := opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2865_c7_8f99_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2864_c7_fdea] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_cond;
     opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output := opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2864_c7_fdea_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2863_c7_d4ce] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_cond;
     opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output := opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2863_c7_d4ce_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2862_c7_8f38] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_cond;
     opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output := opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2862_c7_8f38_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2861_c7_5158] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_cond;
     opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_return_output := opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2861_c7_5158_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2860_c7_1b4a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_cond;
     opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output := opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2860_c7_1b4a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2859_c7_146b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_cond;
     opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_return_output := opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2859_c7_146b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2858_c7_38f4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_cond;
     opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output := opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2858_c7_38f4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2857_c7_9d3f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_cond;
     opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output := opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2857_c7_9d3f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2856_c7_bfb0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_cond;
     opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output := opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2856_c7_bfb0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2855_c7_9b3c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_cond;
     opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output := opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2855_c7_9b3c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2854_c7_5d9c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_cond;
     opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output := opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2854_c7_5d9c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2853_c7_1c7f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_cond;
     opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output := opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2853_c7_1c7f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2852_c7_8795] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_cond;
     opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_return_output := opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2852_c7_8795_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2851_c7_ad1b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_cond;
     opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output := opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2851_c7_ad1b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2850_c7_2eff] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_cond;
     opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output := opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2850_c7_2eff_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2849_c7_5649] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_cond;
     opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_return_output := opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2849_c7_5649_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2848_c7_e78f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_cond;
     opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output := opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2848_c7_e78f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2847_c7_c67e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_cond;
     opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output := opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2847_c7_c67e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2846_c7_2785] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_cond;
     opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_return_output := opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2846_c7_2785_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2845_c7_385f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_cond;
     opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_return_output := opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2845_c7_385f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2844_c7_bdbf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_cond;
     opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output := opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2844_c7_bdbf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2843_c7_9340] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_cond;
     opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_return_output := opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2843_c7_9340_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2842_c7_9c87] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_cond;
     opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output := opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2842_c7_9c87_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2841_c7_3fa5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_cond;
     opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output := opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2841_c7_3fa5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2840_c7_40ce] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_cond;
     opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output := opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2840_c7_40ce_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2839_c7_a980] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_cond;
     opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_return_output := opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2839_c7_a980_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2838_c7_f0eb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_cond;
     opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output := opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2838_c7_f0eb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2837_c7_79bd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_cond;
     opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output := opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2837_c7_79bd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2836_c7_44e6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_cond;
     opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output := opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2836_c7_44e6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2835_c7_c061] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_cond;
     opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_return_output := opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2835_c7_c061_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2834_c7_afc9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_cond;
     opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output := opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2834_c7_afc9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2833_c7_7f72] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_cond;
     opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output := opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2833_c7_7f72_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2832_c7_a31f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_cond;
     opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output := opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2832_c7_a31f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2831_c7_42e0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_cond;
     opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output := opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2831_c7_42e0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2830_c7_2548] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_cond;
     opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_return_output := opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2830_c7_2548_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2829_c7_751d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_cond;
     opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_return_output := opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2829_c7_751d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2828_c7_8eb7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_cond;
     opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output := opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2828_c7_8eb7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2827_c7_9e41] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_cond;
     opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output := opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2827_c7_9e41_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2826_c7_58a9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_cond;
     opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output := opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2826_c7_58a9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2825_c7_7461] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_cond;
     opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_return_output := opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2825_c7_7461_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2824_c7_276a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_cond;
     opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_return_output := opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2824_c7_276a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2823_c7_3341] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_cond;
     opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_return_output := opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2823_c7_3341_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2822_c7_705c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_cond;
     opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_return_output := opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2822_c7_705c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2821_c7_bfd5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_cond;
     opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output := opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output;

     -- Submodule level 145
     VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2821_c7_bfd5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2820_c7_712e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_cond;
     opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_return_output := opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_return_output;

     -- Submodule level 146
     VAR_opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2820_c7_712e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2819_c7_b43e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_cond;
     opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output := opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output;

     -- Submodule level 147
     VAR_opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2819_c7_b43e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2818_c7_2ba7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_cond;
     opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output := opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output;

     -- Submodule level 148
     VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2818_c7_2ba7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2817_c2_9763] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_cond;
     opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output := opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output;

     -- Submodule level 149
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2893_l2895_DUPLICATE_ec3d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2893_l2895_DUPLICATE_ec3d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2890_c17_3f1d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2890_c17_3f1d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2909_c40_1582] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2909_c40_1582_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2916_c32_bee8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2916_c32_bee8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2914_c37_27cc] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2914_c37_27cc_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output.vram_write_layer;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2908_c39_44ff] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2908_c39_44ff_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2912_c33_2277] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2912_c33_2277_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2911_c30_a974] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2911_c30_a974_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2904_c3_0c29] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2904_c3_0c29_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2913_c34_44a4] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2913_c34_44a4_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2910_c34_41b8] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2910_c34_41b8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2915_l2903_DUPLICATE_4b0c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2915_l2903_DUPLICATE_4b0c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2898_c68_2c54] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2898_c68_2c54_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2817_c2_9763_return_output.stack_address_sp_offset;

     -- Submodule level 150
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2890_c17_3f1d_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2904_c3_0c29_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2915_l2903_DUPLICATE_4b0c_return_output;
     -- BIN_OP_XOR[uxn_opcodes_h_l2890_c2_1454] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_left;
     BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_return_output := BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_return_output;

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2893_l2895_DUPLICATE_bbfc LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2893_l2895_DUPLICATE_bbfc_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2893_l2895_DUPLICATE_ec3d_return_output);

     -- CAST_TO_uint9_t[uxn_opcodes_h_l2898_c58_cffe] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2898_c58_cffe_return_output := CAST_TO_uint9_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2898_c68_2c54_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2918_l2794_DUPLICATE_8050 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2918_l2794_DUPLICATE_8050_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0(
     VAR_is_wait_MUX_uxn_opcodes_h_l2817_c2_9763_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2908_c39_44ff_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2909_c40_1582_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2910_c34_41b8_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2911_c30_a974_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2912_c33_2277_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2913_c34_44a4_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2914_c37_27cc_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2915_l2903_DUPLICATE_4b0c_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2916_c32_bee8_return_output);

     -- Submodule level 151
     VAR_MUX_uxn_opcodes_h_l2898_c29_e6ea_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_return_output;
     VAR_MUX_uxn_opcodes_h_l2899_c20_b3ed_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2892_c2_b006_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2892_c2_b006_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2890_c2_1454_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2893_l2895_DUPLICATE_bbfc_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2893_l2895_DUPLICATE_bbfc_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_right := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2898_c58_cffe_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2918_l2794_DUPLICATE_8050_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_fdc0_uxn_opcodes_h_l2918_l2794_DUPLICATE_8050_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2893_c3_7084] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_return_output;

     -- MUX[uxn_opcodes_h_l2899_c20_b3ed] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2899_c20_b3ed_cond <= VAR_MUX_uxn_opcodes_h_l2899_c20_b3ed_cond;
     MUX_uxn_opcodes_h_l2899_c20_b3ed_iftrue <= VAR_MUX_uxn_opcodes_h_l2899_c20_b3ed_iftrue;
     MUX_uxn_opcodes_h_l2899_c20_b3ed_iffalse <= VAR_MUX_uxn_opcodes_h_l2899_c20_b3ed_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2899_c20_b3ed_return_output := MUX_uxn_opcodes_h_l2899_c20_b3ed_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2895_c3_91e5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_return_output;

     -- Submodule level 152
     VAR_sp1_uxn_opcodes_h_l2893_c3_941c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2893_c3_7084_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2895_c3_c8e4 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2895_c3_91e5_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_right := VAR_MUX_uxn_opcodes_h_l2899_c20_b3ed_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2892_c2_b006_iffalse := VAR_sp0_uxn_opcodes_h_l2895_c3_c8e4;
     VAR_sp1_MUX_uxn_opcodes_h_l2892_c2_b006_iftrue := VAR_sp1_uxn_opcodes_h_l2893_c3_941c;
     -- sp0_MUX[uxn_opcodes_h_l2892_c2_b006] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2892_c2_b006_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2892_c2_b006_cond;
     sp0_MUX_uxn_opcodes_h_l2892_c2_b006_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2892_c2_b006_iftrue;
     sp0_MUX_uxn_opcodes_h_l2892_c2_b006_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2892_c2_b006_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2892_c2_b006_return_output := sp0_MUX_uxn_opcodes_h_l2892_c2_b006_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2892_c2_b006] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2892_c2_b006_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2892_c2_b006_cond;
     sp1_MUX_uxn_opcodes_h_l2892_c2_b006_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2892_c2_b006_iftrue;
     sp1_MUX_uxn_opcodes_h_l2892_c2_b006_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2892_c2_b006_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2892_c2_b006_return_output := sp1_MUX_uxn_opcodes_h_l2892_c2_b006_return_output;

     -- Submodule level 153
     VAR_MUX_uxn_opcodes_h_l2898_c29_e6ea_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2892_c2_b006_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2892_c2_b006_return_output;
     VAR_MUX_uxn_opcodes_h_l2898_c29_e6ea_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2892_c2_b006_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2892_c2_b006_return_output;
     -- MUX[uxn_opcodes_h_l2898_c29_e6ea] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2898_c29_e6ea_cond <= VAR_MUX_uxn_opcodes_h_l2898_c29_e6ea_cond;
     MUX_uxn_opcodes_h_l2898_c29_e6ea_iftrue <= VAR_MUX_uxn_opcodes_h_l2898_c29_e6ea_iftrue;
     MUX_uxn_opcodes_h_l2898_c29_e6ea_iffalse <= VAR_MUX_uxn_opcodes_h_l2898_c29_e6ea_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2898_c29_e6ea_return_output := MUX_uxn_opcodes_h_l2898_c29_e6ea_return_output;

     -- Submodule level 154
     -- CAST_TO_uint9_t[uxn_opcodes_h_l2898_c19_2e0a] LATENCY=0
     VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2898_c19_2e0a_return_output := CAST_TO_uint9_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2898_c29_e6ea_return_output);

     -- Submodule level 155
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_left := VAR_CAST_TO_uint9_t_uxn_opcodes_h_l2898_c19_2e0a_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2898_c19_7d2f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_return_output;

     -- Submodule level 156
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2898_c19_7d2f_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2899_c2_9943] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_return_output;

     -- Submodule level 157
     VAR_stack_address_uxn_opcodes_h_l2899_c2_d0ce := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2899_c2_9943_return_output, 9);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2899_c2_d0ce;
     VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_stack_address := VAR_stack_address_uxn_opcodes_h_l2899_c2_d0ce;
     -- stack_ram_update[uxn_opcodes_h_l2901_c24_20b4] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_stack_address;
     stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_value <= VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_value;
     stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_return_output := stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_return_output;

     -- Submodule level 158
     REG_VAR_previous_stack_read := VAR_stack_ram_update_uxn_opcodes_h_l2901_c24_20b4_return_output;
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
