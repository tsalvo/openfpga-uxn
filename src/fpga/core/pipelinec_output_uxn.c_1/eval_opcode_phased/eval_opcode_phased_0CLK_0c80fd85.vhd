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
-- Submodules: 378
entity eval_opcode_phased_0CLK_0c80fd85 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_0c80fd85;
architecture arch of eval_opcode_phased_0CLK_0c80fd85 is
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
signal stack_address : unsigned(11 downto 0) := to_unsigned(0, 12);
signal stack_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal device_ram_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
signal opc_result : opcode_result_t := (
is_pc_updated => to_unsigned(0, 1),
is_stack_index_flipped => to_unsigned(0, 1),
is_sp_shift => to_unsigned(0, 1),
sp_relative_shift => to_signed(0, 4),
is_stack_write => to_unsigned(0, 1),
stack_address_sp_offset => to_unsigned(0, 4),
is_ram_write => to_unsigned(0, 1),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
u8_value => to_unsigned(0, 8),
u16_value => to_unsigned(0, 16),
is_opc_done => to_unsigned(0, 1))
;
signal opc_eval_result : eval_opcode_result_t := (
is_pc_updated => to_unsigned(0, 1),
is_ram_write => to_unsigned(0, 1),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
u8_value => to_unsigned(0, 8),
u16_value => to_unsigned(0, 16),
is_opc_done => to_unsigned(0, 1))
;
signal REG_COMB_sp0 : unsigned(7 downto 0);
signal REG_COMB_sp1 : unsigned(7 downto 0);
signal REG_COMB_opc : unsigned(11 downto 0);
signal REG_COMB_stack_index : unsigned(0 downto 0);
signal REG_COMB_stack_address : unsigned(11 downto 0);
signal REG_COMB_stack_read_value : unsigned(7 downto 0);
signal REG_COMB_device_ram_read_value : unsigned(7 downto 0);
signal REG_COMB_opc_result : opcode_result_t;
signal REG_COMB_opc_eval_result : eval_opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_opcodes_h_l3045_c10_78dd]
signal BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3045_c10_af9c]
signal BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3045_c41_d67d]
signal BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l3045_c57_96b3]
signal CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l3045_c10_c11e]
signal MUX_uxn_opcodes_h_l3045_c10_c11e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3045_c10_c11e_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3045_c10_c11e_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3045_c10_c11e_return_output : unsigned(11 downto 0);

-- printf_uxn_opcodes_h_l3048_c2_9891[uxn_opcodes_h_l3048_c2_9891]
signal printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3050_c6_6b5d]
signal BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3051_c7_6b18]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3050_c2_f026]
signal opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3051_c11_9963]
signal BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3051_c1_5767]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3052_c7_46a7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3051_c7_6b18]
signal opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l3051_c41_f3d6]
signal jci_uxn_opcodes_h_l3051_c41_f3d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l3051_c41_f3d6_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3051_c41_f3d6_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l3051_c41_f3d6_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3051_c41_f3d6_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3051_c41_f3d6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3052_c11_b81c]
signal BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3052_c1_5431]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3053_c7_6d45]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3052_c7_46a7]
signal opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l3052_c41_4434]
signal jmi_uxn_opcodes_h_l3052_c41_4434_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l3052_c41_4434_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3052_c41_4434_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l3052_c41_4434_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3052_c41_4434_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3053_c11_4fa3]
signal BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3053_c1_7ca9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3054_c7_97ce]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3053_c7_6d45]
signal opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l3053_c41_0f46]
signal jsi_uxn_opcodes_h_l3053_c41_0f46_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l3053_c41_0f46_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3053_c41_0f46_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l3053_c41_0f46_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3053_c41_0f46_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3054_c11_3ebf]
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3054_c1_04f6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3055_c7_0abb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3054_c7_97ce]
signal opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3054_c41_8597]
signal lit_uxn_opcodes_h_l3054_c41_8597_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3054_c41_8597_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3054_c41_8597_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3054_c41_8597_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3054_c41_8597_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3055_c11_c355]
signal BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3055_c1_dc57]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3056_c7_7dd2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3055_c7_0abb]
signal opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3055_c41_d6e8]
signal lit2_uxn_opcodes_h_l3055_c41_d6e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3055_c41_d6e8_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3055_c41_d6e8_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3055_c41_d6e8_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3055_c41_d6e8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3056_c11_6e2b]
signal BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3056_c1_5041]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c7_6b0e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3056_c7_7dd2]
signal opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3056_c41_34c1]
signal lit_uxn_opcodes_h_l3056_c41_34c1_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3056_c41_34c1_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3056_c41_34c1_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3056_c41_34c1_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3056_c41_34c1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3057_c11_7f85]
signal BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c1_47ac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c7_9aaf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3057_c7_6b0e]
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3057_c41_f74d]
signal lit2_uxn_opcodes_h_l3057_c41_f74d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3057_c41_f74d_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3057_c41_f74d_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3057_c41_f74d_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3057_c41_f74d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3058_c11_5521]
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c1_1ee3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c7_7f00]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3058_c7_9aaf]
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l3058_c41_531f]
signal inc_uxn_opcodes_h_l3058_c41_531f_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l3058_c41_531f_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3058_c41_531f_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3058_c41_531f_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3058_c41_531f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3059_c11_25f0]
signal BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c1_da24]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c7_66f7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3059_c7_7f00]
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l3059_c41_0023]
signal inc2_uxn_opcodes_h_l3059_c41_0023_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l3059_c41_0023_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3059_c41_0023_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3059_c41_0023_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3059_c41_0023_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3060_c11_6177]
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c1_87b2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c7_b811]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3060_c7_66f7]
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l3060_c41_0878]
signal pop_uxn_opcodes_h_l3060_c41_0878_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l3060_c41_0878_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3060_c41_0878_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3060_c41_0878_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3061_c11_cd97]
signal BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c1_329a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c7_190c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3061_c7_b811]
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l3061_c41_e626]
signal pop2_uxn_opcodes_h_l3061_c41_e626_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l3061_c41_e626_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3061_c41_e626_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3061_c41_e626_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3062_c11_0aa1]
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c1_8356]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c7_ab5b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3062_c7_190c]
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l3062_c41_b331]
signal nip_uxn_opcodes_h_l3062_c41_b331_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l3062_c41_b331_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3062_c41_b331_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3062_c41_b331_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3062_c41_b331_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3063_c11_e27a]
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c1_7dc9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c7_24e3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3063_c7_ab5b]
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l3063_c41_64cf]
signal nip2_uxn_opcodes_h_l3063_c41_64cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l3063_c41_64cf_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3063_c41_64cf_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3063_c41_64cf_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3063_c41_64cf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3064_c11_174e]
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c1_dc43]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c7_a153]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3064_c7_24e3]
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l3064_c41_68c2]
signal swp_uxn_opcodes_h_l3064_c41_68c2_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l3064_c41_68c2_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3064_c41_68c2_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3064_c41_68c2_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3064_c41_68c2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3065_c11_1606]
signal BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c1_676e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c7_43fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3065_c7_a153]
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l3065_c41_25d7]
signal swp2_uxn_opcodes_h_l3065_c41_25d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l3065_c41_25d7_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3065_c41_25d7_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3065_c41_25d7_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3065_c41_25d7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3066_c11_3c94]
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c1_ee37]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c7_bfba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3066_c7_43fd]
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l3066_c41_f57e]
signal rot_uxn_opcodes_h_l3066_c41_f57e_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l3066_c41_f57e_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3066_c41_f57e_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3066_c41_f57e_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3066_c41_f57e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3067_c11_494a]
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c1_a067]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c7_26d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3067_c7_bfba]
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l3067_c41_bf62]
signal rot2_uxn_opcodes_h_l3067_c41_bf62_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l3067_c41_bf62_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3067_c41_bf62_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3067_c41_bf62_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3067_c41_bf62_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3068_c11_2830]
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c1_a6b4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c7_e0dc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3068_c7_26d4]
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l3068_c41_37a0]
signal dup_uxn_opcodes_h_l3068_c41_37a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l3068_c41_37a0_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3068_c41_37a0_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3068_c41_37a0_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3068_c41_37a0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3069_c11_1280]
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c1_3a48]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c7_eaa3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3069_c7_e0dc]
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l3069_c41_4d95]
signal dup2_uxn_opcodes_h_l3069_c41_4d95_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l3069_c41_4d95_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3069_c41_4d95_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3069_c41_4d95_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3069_c41_4d95_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3070_c11_6162]
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c1_45c4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c7_37ba]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3070_c7_eaa3]
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l3070_c41_1f1d]
signal ovr_uxn_opcodes_h_l3070_c41_1f1d_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l3070_c41_1f1d_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3070_c41_1f1d_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3070_c41_1f1d_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3070_c41_1f1d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3071_c11_3b6f]
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c1_a6e3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c7_5b4c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3071_c7_37ba]
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l3071_c41_2ee6]
signal ovr2_uxn_opcodes_h_l3071_c41_2ee6_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l3071_c41_2ee6_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3071_c41_2ee6_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3071_c41_2ee6_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3071_c41_2ee6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3072_c11_37ed]
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c1_93aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c7_5906]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3072_c7_5b4c]
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l3072_c41_024f]
signal equ_uxn_opcodes_h_l3072_c41_024f_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l3072_c41_024f_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3072_c41_024f_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3072_c41_024f_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3072_c41_024f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3073_c11_c252]
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c1_0939]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c7_8bfa]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3073_c7_5906]
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l3073_c41_1ae4]
signal equ2_uxn_opcodes_h_l3073_c41_1ae4_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l3073_c41_1ae4_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3073_c41_1ae4_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3073_c41_1ae4_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3073_c41_1ae4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3074_c11_2756]
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c1_9a00]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c7_0581]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3074_c7_8bfa]
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l3074_c41_9968]
signal neq_uxn_opcodes_h_l3074_c41_9968_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l3074_c41_9968_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3074_c41_9968_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3074_c41_9968_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3074_c41_9968_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3075_c11_da94]
signal BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c1_92e5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c7_63b5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3075_c7_0581]
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l3075_c41_48b8]
signal neq2_uxn_opcodes_h_l3075_c41_48b8_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l3075_c41_48b8_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3075_c41_48b8_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3075_c41_48b8_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3075_c41_48b8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3076_c11_03eb]
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c1_535b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c7_0183]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3076_c7_63b5]
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l3076_c41_53cc]
signal gth_uxn_opcodes_h_l3076_c41_53cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l3076_c41_53cc_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3076_c41_53cc_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3076_c41_53cc_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3076_c41_53cc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3077_c11_208c]
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c1_5e47]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c7_0809]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3077_c7_0183]
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l3077_c41_a4de]
signal gth2_uxn_opcodes_h_l3077_c41_a4de_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l3077_c41_a4de_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3077_c41_a4de_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3077_c41_a4de_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3077_c41_a4de_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3078_c11_cd86]
signal BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c1_582e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c7_26ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3078_c7_0809]
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l3078_c41_3fe7]
signal lth_uxn_opcodes_h_l3078_c41_3fe7_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l3078_c41_3fe7_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3078_c41_3fe7_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3078_c41_3fe7_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3078_c41_3fe7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3079_c11_d10b]
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c1_496f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c7_58cf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3079_c7_26ec]
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l3079_c41_2992]
signal lth2_uxn_opcodes_h_l3079_c41_2992_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l3079_c41_2992_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3079_c41_2992_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3079_c41_2992_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3079_c41_2992_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3080_c11_2184]
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c1_aacc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c7_118f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3080_c7_58cf]
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l3080_c41_658c]
signal jmp_uxn_opcodes_h_l3080_c41_658c_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l3080_c41_658c_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3080_c41_658c_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3080_c41_658c_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l3080_c41_658c_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3080_c41_658c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3081_c11_bbd9]
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c1_0ade]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c7_c39a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3081_c7_118f]
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l3081_c41_0056]
signal jmp2_uxn_opcodes_h_l3081_c41_0056_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l3081_c41_0056_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3081_c41_0056_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3081_c41_0056_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3081_c41_0056_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3082_c11_9382]
signal BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c1_453d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c7_dd4f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3082_c7_c39a]
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l3082_c41_32eb]
signal jcn_uxn_opcodes_h_l3082_c41_32eb_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l3082_c41_32eb_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3082_c41_32eb_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3082_c41_32eb_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l3082_c41_32eb_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3082_c41_32eb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3083_c11_ef66]
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c1_1b97]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c7_4724]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3083_c7_dd4f]
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l3083_c41_486f]
signal jcn2_uxn_opcodes_h_l3083_c41_486f_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l3083_c41_486f_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3083_c41_486f_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3083_c41_486f_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3083_c41_486f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3084_c11_1ae9]
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c1_95fe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c7_cb96]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3084_c7_4724]
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l3084_c41_6801]
signal jsr_uxn_opcodes_h_l3084_c41_6801_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l3084_c41_6801_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3084_c41_6801_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3084_c41_6801_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l3084_c41_6801_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3084_c41_6801_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3085_c11_b84c]
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c1_f9c5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c7_89d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3085_c7_cb96]
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l3085_c41_5485]
signal jsr2_uxn_opcodes_h_l3085_c41_5485_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l3085_c41_5485_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3085_c41_5485_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3085_c41_5485_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l3085_c41_5485_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3085_c41_5485_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3086_c11_c2a7]
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c1_26d8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c7_9377]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3086_c7_89d1]
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l3086_c41_e998]
signal sth_uxn_opcodes_h_l3086_c41_e998_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l3086_c41_e998_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3086_c41_e998_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3086_c41_e998_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3086_c41_e998_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3087_c11_0494]
signal BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c1_cd80]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c7_3d12]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3087_c7_9377]
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l3087_c41_fa07]
signal sth2_uxn_opcodes_h_l3087_c41_fa07_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l3087_c41_fa07_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3087_c41_fa07_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3087_c41_fa07_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3087_c41_fa07_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3088_c11_46f7]
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c1_9ab9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c7_4ac3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3088_c7_3d12]
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l3088_c41_d133]
signal ldz_uxn_opcodes_h_l3088_c41_d133_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l3088_c41_d133_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3088_c41_d133_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3088_c41_d133_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3088_c41_d133_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3088_c41_d133_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3089_c11_457a]
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c1_e7b8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c7_d89d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3089_c7_4ac3]
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l3089_c41_1a27]
signal ldz2_uxn_opcodes_h_l3089_c41_1a27_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l3089_c41_1a27_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3089_c41_1a27_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3089_c41_1a27_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3089_c41_1a27_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3089_c41_1a27_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3090_c11_0089]
signal BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c1_9792]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c7_d733]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3090_c7_d89d]
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l3090_c41_43cf]
signal stz_uxn_opcodes_h_l3090_c41_43cf_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l3090_c41_43cf_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3090_c41_43cf_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3090_c41_43cf_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3090_c41_43cf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3091_c11_507b]
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c1_a703]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c7_0b73]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3091_c7_d733]
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l3091_c41_cc53]
signal stz2_uxn_opcodes_h_l3091_c41_cc53_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l3091_c41_cc53_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3091_c41_cc53_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3091_c41_cc53_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3091_c41_cc53_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3092_c11_c2b7]
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c1_c6ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c7_716c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3092_c7_0b73]
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l3092_c41_a7b7]
signal ldr_uxn_opcodes_h_l3092_c41_a7b7_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l3092_c41_a7b7_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3092_c41_a7b7_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3092_c41_a7b7_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l3092_c41_a7b7_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3092_c41_a7b7_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3092_c41_a7b7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3093_c11_1da8]
signal BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c1_2d3c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c7_8ac5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3093_c7_716c]
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l3093_c41_c8e3]
signal ldr2_uxn_opcodes_h_l3093_c41_c8e3_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l3093_c41_c8e3_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3093_c41_c8e3_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3093_c41_c8e3_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l3093_c41_c8e3_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3093_c41_c8e3_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3093_c41_c8e3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3094_c11_7b5b]
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c1_c5f8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c7_9b70]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3094_c7_8ac5]
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l3094_c41_eef5]
signal str1_uxn_opcodes_h_l3094_c41_eef5_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l3094_c41_eef5_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3094_c41_eef5_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3094_c41_eef5_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l3094_c41_eef5_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3094_c41_eef5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_2dee]
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c1_42ca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c7_92ee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3095_c7_9b70]
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l3095_c41_9a26]
signal str2_uxn_opcodes_h_l3095_c41_9a26_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l3095_c41_9a26_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3095_c41_9a26_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3095_c41_9a26_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l3095_c41_9a26_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3095_c41_9a26_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3096_c11_aa57]
signal BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c1_8af5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c7_7132]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3096_c7_92ee]
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l3096_c41_7d8d]
signal lda_uxn_opcodes_h_l3096_c41_7d8d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l3096_c41_7d8d_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3096_c41_7d8d_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3096_c41_7d8d_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3096_c41_7d8d_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3096_c41_7d8d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3097_c11_a9ff]
signal BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c1_45ed]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c7_9389]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3097_c7_7132]
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l3097_c41_5087]
signal lda2_uxn_opcodes_h_l3097_c41_5087_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l3097_c41_5087_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3097_c41_5087_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3097_c41_5087_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3097_c41_5087_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3097_c41_5087_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3098_c11_1ca3]
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c1_b5a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c7_1a07]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3098_c7_9389]
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l3098_c41_9eac]
signal sta_uxn_opcodes_h_l3098_c41_9eac_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l3098_c41_9eac_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3098_c41_9eac_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3098_c41_9eac_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3098_c41_9eac_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_8221]
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c1_a0ad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c7_4855]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3099_c7_1a07]
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l3099_c41_beb5]
signal sta2_uxn_opcodes_h_l3099_c41_beb5_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l3099_c41_beb5_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3099_c41_beb5_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3099_c41_beb5_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3099_c41_beb5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3100_c11_5a31]
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c1_acef]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c7_f371]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3100_c7_4855]
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l3100_c41_821e]
signal dei_uxn_opcodes_h_l3100_c41_821e_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l3100_c41_821e_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3100_c41_821e_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3100_c41_821e_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3100_c41_821e_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3100_c41_821e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3101_c11_3e1d]
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c1_1a30]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c7_1df3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3101_c7_f371]
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l3101_c41_49bf]
signal dei2_uxn_opcodes_h_l3101_c41_49bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l3101_c41_49bf_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3101_c41_49bf_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3101_c41_49bf_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3101_c41_49bf_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3101_c41_49bf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3102_c11_a428]
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c1_ab13]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c7_233e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3102_c7_1df3]
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l3102_c41_476b]
signal deo_uxn_opcodes_h_l3102_c41_476b_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l3102_c41_476b_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3102_c41_476b_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3102_c41_476b_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3102_c41_476b_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3102_c41_476b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_7fc6]
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c1_d0cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c7_7968]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3103_c7_233e]
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l3103_c41_0046]
signal deo2_uxn_opcodes_h_l3103_c41_0046_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l3103_c41_0046_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3103_c41_0046_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3103_c41_0046_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3103_c41_0046_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3103_c41_0046_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3104_c11_4435]
signal BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c1_ed82]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c7_6cd8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3104_c7_7968]
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l3104_c41_5ab9]
signal add_uxn_opcodes_h_l3104_c41_5ab9_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l3104_c41_5ab9_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3104_c41_5ab9_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3104_c41_5ab9_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3104_c41_5ab9_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3105_c11_a200]
signal BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c1_5d8f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c7_e697]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3105_c7_6cd8]
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l3105_c41_924c]
signal add2_uxn_opcodes_h_l3105_c41_924c_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l3105_c41_924c_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3105_c41_924c_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3105_c41_924c_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3105_c41_924c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3106_c11_8df5]
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c1_a8b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c7_d268]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3106_c7_e697]
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l3106_c41_7bb4]
signal sub_uxn_opcodes_h_l3106_c41_7bb4_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l3106_c41_7bb4_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3106_c41_7bb4_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3106_c41_7bb4_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3106_c41_7bb4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3107_c11_966f]
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c1_5f57]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c7_2ca1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3107_c7_d268]
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l3107_c41_cc09]
signal sub2_uxn_opcodes_h_l3107_c41_cc09_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l3107_c41_cc09_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3107_c41_cc09_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3107_c41_cc09_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3107_c41_cc09_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3108_c11_6655]
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c1_0d05]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c7_8e64]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3108_c7_2ca1]
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l3108_c41_2961]
signal mul_uxn_opcodes_h_l3108_c41_2961_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l3108_c41_2961_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3108_c41_2961_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3108_c41_2961_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3108_c41_2961_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3109_c11_4618]
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c1_68c7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c7_9886]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3109_c7_8e64]
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l3109_c41_78b5]
signal mul2_uxn_opcodes_h_l3109_c41_78b5_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l3109_c41_78b5_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3109_c41_78b5_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3109_c41_78b5_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3109_c41_78b5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3110_c11_9e07]
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c1_3de5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c7_9b99]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3110_c7_9886]
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l3110_c41_0810]
signal div_uxn_opcodes_h_l3110_c41_0810_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l3110_c41_0810_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3110_c41_0810_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3110_c41_0810_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3110_c41_0810_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3111_c11_5b1b]
signal BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c1_d395]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c7_2af8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3111_c7_9b99]
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l3111_c41_4e50]
signal div2_uxn_opcodes_h_l3111_c41_4e50_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l3111_c41_4e50_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3111_c41_4e50_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3111_c41_4e50_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3111_c41_4e50_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3112_c11_c7f8]
signal BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c1_83a4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c7_ab8f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3112_c7_2af8]
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l3112_c41_717f]
signal and_uxn_opcodes_h_l3112_c41_717f_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l3112_c41_717f_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3112_c41_717f_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3112_c41_717f_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3112_c41_717f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3113_c11_84a7]
signal BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c1_9700]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c7_a9e0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3113_c7_ab8f]
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l3113_c41_42f4]
signal and2_uxn_opcodes_h_l3113_c41_42f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l3113_c41_42f4_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3113_c41_42f4_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3113_c41_42f4_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3113_c41_42f4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3114_c11_35b3]
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c1_6a20]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c7_a296]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3114_c7_a9e0]
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l3114_c41_9911]
signal ora_uxn_opcodes_h_l3114_c41_9911_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l3114_c41_9911_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3114_c41_9911_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3114_c41_9911_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3114_c41_9911_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3115_c11_f5a3]
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c1_9d0e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c7_92ae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3115_c7_a296]
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l3115_c41_11fa]
signal ora2_uxn_opcodes_h_l3115_c41_11fa_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l3115_c41_11fa_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3115_c41_11fa_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3115_c41_11fa_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3115_c41_11fa_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3116_c11_935c]
signal BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c1_92a1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c7_6066]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3116_c7_92ae]
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l3116_c41_896a]
signal eor_uxn_opcodes_h_l3116_c41_896a_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l3116_c41_896a_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3116_c41_896a_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3116_c41_896a_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3116_c41_896a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3117_c11_6978]
signal BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c1_2626]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c7_0ad9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3117_c7_6066]
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l3117_c41_62c5]
signal eor2_uxn_opcodes_h_l3117_c41_62c5_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l3117_c41_62c5_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3117_c41_62c5_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3117_c41_62c5_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3117_c41_62c5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3118_c11_60f4]
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c1_5177]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c7_472a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3118_c7_0ad9]
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l3118_c41_2f6c]
signal sft_uxn_opcodes_h_l3118_c41_2f6c_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l3118_c41_2f6c_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3118_c41_2f6c_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3118_c41_2f6c_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3118_c41_2f6c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3119_c11_5475]
signal BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c1_5b02]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3120_c1_902b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3119_c7_472a]
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l3119_c41_b9fb]
signal sft2_uxn_opcodes_h_l3119_c41_b9fb_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l3119_c41_b9fb_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3119_c41_b9fb_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3119_c41_b9fb_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3119_c41_b9fb_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l3120_c9_f344[uxn_opcodes_h_l3120_c9_f344]
signal printf_uxn_opcodes_h_l3120_c9_f344_uxn_opcodes_h_l3120_c9_f344_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3120_c9_f344_uxn_opcodes_h_l3120_c9_f344_arg0 : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3122_c18_bc93]
signal BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3122_c18_2c3b]
signal BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3122_c18_42ac]
signal MUX_uxn_opcodes_h_l3122_c18_42ac_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3122_c18_42ac_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3122_c18_42ac_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3122_c18_42ac_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l3123_c2_be56]
signal BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_return_output : unsigned(0 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3125_c2_9244]
signal sp0_MUX_uxn_opcodes_h_l3125_c2_9244_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3125_c2_9244_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3125_c2_9244_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3125_c2_9244_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3125_c2_9244]
signal sp1_MUX_uxn_opcodes_h_l3125_c2_9244_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3125_c2_9244_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3125_c2_9244_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3125_c2_9244_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3126_c3_0571]
signal sp0_MUX_uxn_opcodes_h_l3126_c3_0571_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3126_c3_0571_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3126_c3_0571_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3126_c3_0571_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3126_c3_0571]
signal sp1_MUX_uxn_opcodes_h_l3126_c3_0571_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3126_c3_0571_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3126_c3_0571_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3126_c3_0571_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3127_c4_e65c]
signal BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3129_c4_80b4]
signal BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l3133_c30_92be]
signal MUX_uxn_opcodes_h_l3133_c30_92be_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3133_c30_92be_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3133_c30_92be_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3133_c30_92be_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l3133_c19_d50f]
signal BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l3134_c20_0c87]
signal MUX_uxn_opcodes_h_l3134_c20_0c87_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3134_c20_0c87_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l3134_c20_0c87_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l3134_c20_0c87_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3134_c2_bd1c]
signal BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_return_output : unsigned(12 downto 0);

-- stack_ram_update[uxn_opcodes_h_l3136_c21_1995]
signal stack_ram_update_uxn_opcodes_h_l3136_c21_1995_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3136_c21_1995_stack_address : unsigned(11 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3136_c21_1995_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3136_c21_1995_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3136_c21_1995_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_opcodes_h_l3142_c26_ce1d]
signal device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_return_output : unsigned(7 downto 0);

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

function CAST_TO_uint12_t_uint4_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(3 downto 0);
  variable return_output : unsigned(11 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,12)));
    return return_output;
end function;

function CAST_TO_int8_t_int4_t( rhs : signed) return signed is

  --variable rhs : signed(3 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_2565( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return eval_opcode_result_t is
 
  variable base : eval_opcode_result_t; 
  variable return_output : eval_opcode_result_t;
begin
      base.is_pc_updated := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.vram_write_layer := ref_toks_4;
      base.vram_address := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd
BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_left,
BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_right,
BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c
BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_left,
BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_right,
BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d
BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_left,
BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_right,
BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_return_output);

-- CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3
CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3_x,
CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3_return_output);

-- MUX_uxn_opcodes_h_l3045_c10_c11e
MUX_uxn_opcodes_h_l3045_c10_c11e : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3045_c10_c11e_cond,
MUX_uxn_opcodes_h_l3045_c10_c11e_iftrue,
MUX_uxn_opcodes_h_l3045_c10_c11e_iffalse,
MUX_uxn_opcodes_h_l3045_c10_c11e_return_output);

-- printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891
printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891 : entity work.printf_uxn_opcodes_h_l3048_c2_9891_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg0,
printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg1,
printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d
BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_left,
BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_right,
BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3050_c2_f026
opc_result_MUX_uxn_opcodes_h_l3050_c2_f026 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_cond,
opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_iftrue,
opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_iffalse,
opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963
BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963 : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_left,
BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_right,
BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18
opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_cond,
opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_iftrue,
opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_iffalse,
opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output);

-- jci_uxn_opcodes_h_l3051_c41_f3d6
jci_uxn_opcodes_h_l3051_c41_f3d6 : entity work.jci_0CLK_9ff5fd8d port map (
clk,
jci_uxn_opcodes_h_l3051_c41_f3d6_CLOCK_ENABLE,
jci_uxn_opcodes_h_l3051_c41_f3d6_phase,
jci_uxn_opcodes_h_l3051_c41_f3d6_pc,
jci_uxn_opcodes_h_l3051_c41_f3d6_previous_stack_read,
jci_uxn_opcodes_h_l3051_c41_f3d6_previous_ram_read,
jci_uxn_opcodes_h_l3051_c41_f3d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c
BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_left,
BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_right,
BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7
opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_cond,
opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output);

-- jmi_uxn_opcodes_h_l3052_c41_4434
jmi_uxn_opcodes_h_l3052_c41_4434 : entity work.jmi_0CLK_e573058b port map (
clk,
jmi_uxn_opcodes_h_l3052_c41_4434_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l3052_c41_4434_phase,
jmi_uxn_opcodes_h_l3052_c41_4434_pc,
jmi_uxn_opcodes_h_l3052_c41_4434_previous_ram_read,
jmi_uxn_opcodes_h_l3052_c41_4434_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3
BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_left,
BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_right,
BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45
opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_cond,
opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_iftrue,
opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_iffalse,
opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output);

-- jsi_uxn_opcodes_h_l3053_c41_0f46
jsi_uxn_opcodes_h_l3053_c41_0f46 : entity work.jsi_0CLK_06911bbe port map (
clk,
jsi_uxn_opcodes_h_l3053_c41_0f46_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l3053_c41_0f46_phase,
jsi_uxn_opcodes_h_l3053_c41_0f46_pc,
jsi_uxn_opcodes_h_l3053_c41_0f46_previous_ram_read,
jsi_uxn_opcodes_h_l3053_c41_0f46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_left,
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_right,
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce
opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_cond,
opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_iftrue,
opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_iffalse,
opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output);

-- lit_uxn_opcodes_h_l3054_c41_8597
lit_uxn_opcodes_h_l3054_c41_8597 : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l3054_c41_8597_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3054_c41_8597_phase,
lit_uxn_opcodes_h_l3054_c41_8597_pc,
lit_uxn_opcodes_h_l3054_c41_8597_previous_ram_read,
lit_uxn_opcodes_h_l3054_c41_8597_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355
BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_left,
BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_right,
BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb
opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_cond,
opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_iftrue,
opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_iffalse,
opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output);

-- lit2_uxn_opcodes_h_l3055_c41_d6e8
lit2_uxn_opcodes_h_l3055_c41_d6e8 : entity work.lit2_0CLK_7c2e709f port map (
clk,
lit2_uxn_opcodes_h_l3055_c41_d6e8_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3055_c41_d6e8_phase,
lit2_uxn_opcodes_h_l3055_c41_d6e8_pc,
lit2_uxn_opcodes_h_l3055_c41_d6e8_previous_ram_read,
lit2_uxn_opcodes_h_l3055_c41_d6e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b
BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_left,
BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_right,
BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2
opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_cond,
opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_iftrue,
opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_iffalse,
opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output);

-- lit_uxn_opcodes_h_l3056_c41_34c1
lit_uxn_opcodes_h_l3056_c41_34c1 : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l3056_c41_34c1_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3056_c41_34c1_phase,
lit_uxn_opcodes_h_l3056_c41_34c1_pc,
lit_uxn_opcodes_h_l3056_c41_34c1_previous_ram_read,
lit_uxn_opcodes_h_l3056_c41_34c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_left,
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_right,
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e
opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_cond,
opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output);

-- lit2_uxn_opcodes_h_l3057_c41_f74d
lit2_uxn_opcodes_h_l3057_c41_f74d : entity work.lit2_0CLK_7c2e709f port map (
clk,
lit2_uxn_opcodes_h_l3057_c41_f74d_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3057_c41_f74d_phase,
lit2_uxn_opcodes_h_l3057_c41_f74d_pc,
lit2_uxn_opcodes_h_l3057_c41_f74d_previous_ram_read,
lit2_uxn_opcodes_h_l3057_c41_f74d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_left,
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_right,
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf
opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_cond,
opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_iftrue,
opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_iffalse,
opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output);

-- inc_uxn_opcodes_h_l3058_c41_531f
inc_uxn_opcodes_h_l3058_c41_531f : entity work.inc_0CLK_b7103d16 port map (
clk,
inc_uxn_opcodes_h_l3058_c41_531f_CLOCK_ENABLE,
inc_uxn_opcodes_h_l3058_c41_531f_phase,
inc_uxn_opcodes_h_l3058_c41_531f_ins,
inc_uxn_opcodes_h_l3058_c41_531f_previous_stack_read,
inc_uxn_opcodes_h_l3058_c41_531f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_left,
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_right,
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00
opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_cond,
opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_iftrue,
opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_iffalse,
opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output);

-- inc2_uxn_opcodes_h_l3059_c41_0023
inc2_uxn_opcodes_h_l3059_c41_0023 : entity work.inc2_0CLK_861257cf port map (
clk,
inc2_uxn_opcodes_h_l3059_c41_0023_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l3059_c41_0023_phase,
inc2_uxn_opcodes_h_l3059_c41_0023_ins,
inc2_uxn_opcodes_h_l3059_c41_0023_previous_stack_read,
inc2_uxn_opcodes_h_l3059_c41_0023_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_left,
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_right,
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7
opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_cond,
opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output);

-- pop_uxn_opcodes_h_l3060_c41_0878
pop_uxn_opcodes_h_l3060_c41_0878 : entity work.pop_0CLK_bd0fc640 port map (
clk,
pop_uxn_opcodes_h_l3060_c41_0878_CLOCK_ENABLE,
pop_uxn_opcodes_h_l3060_c41_0878_phase,
pop_uxn_opcodes_h_l3060_c41_0878_ins,
pop_uxn_opcodes_h_l3060_c41_0878_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_left,
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_right,
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3061_c7_b811
opc_result_MUX_uxn_opcodes_h_l3061_c7_b811 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_cond,
opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_iftrue,
opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_iffalse,
opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_return_output);

-- pop2_uxn_opcodes_h_l3061_c41_e626
pop2_uxn_opcodes_h_l3061_c41_e626 : entity work.pop2_0CLK_bd0fc640 port map (
clk,
pop2_uxn_opcodes_h_l3061_c41_e626_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l3061_c41_e626_phase,
pop2_uxn_opcodes_h_l3061_c41_e626_ins,
pop2_uxn_opcodes_h_l3061_c41_e626_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_left,
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_right,
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3062_c7_190c
opc_result_MUX_uxn_opcodes_h_l3062_c7_190c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_cond,
opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_return_output);

-- nip_uxn_opcodes_h_l3062_c41_b331
nip_uxn_opcodes_h_l3062_c41_b331 : entity work.nip_0CLK_a9f1e08f port map (
clk,
nip_uxn_opcodes_h_l3062_c41_b331_CLOCK_ENABLE,
nip_uxn_opcodes_h_l3062_c41_b331_phase,
nip_uxn_opcodes_h_l3062_c41_b331_ins,
nip_uxn_opcodes_h_l3062_c41_b331_previous_stack_read,
nip_uxn_opcodes_h_l3062_c41_b331_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_left,
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_right,
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b
opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_cond,
opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output);

-- nip2_uxn_opcodes_h_l3063_c41_64cf
nip2_uxn_opcodes_h_l3063_c41_64cf : entity work.nip2_0CLK_15c648e1 port map (
clk,
nip2_uxn_opcodes_h_l3063_c41_64cf_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l3063_c41_64cf_phase,
nip2_uxn_opcodes_h_l3063_c41_64cf_ins,
nip2_uxn_opcodes_h_l3063_c41_64cf_previous_stack_read,
nip2_uxn_opcodes_h_l3063_c41_64cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_left,
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_right,
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3
opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_cond,
opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output);

-- swp_uxn_opcodes_h_l3064_c41_68c2
swp_uxn_opcodes_h_l3064_c41_68c2 : entity work.swp_0CLK_bf6dd460 port map (
clk,
swp_uxn_opcodes_h_l3064_c41_68c2_CLOCK_ENABLE,
swp_uxn_opcodes_h_l3064_c41_68c2_phase,
swp_uxn_opcodes_h_l3064_c41_68c2_ins,
swp_uxn_opcodes_h_l3064_c41_68c2_previous_stack_read,
swp_uxn_opcodes_h_l3064_c41_68c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_left,
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_right,
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3065_c7_a153
opc_result_MUX_uxn_opcodes_h_l3065_c7_a153 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_cond,
opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_iftrue,
opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_iffalse,
opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_return_output);

-- swp2_uxn_opcodes_h_l3065_c41_25d7
swp2_uxn_opcodes_h_l3065_c41_25d7 : entity work.swp2_0CLK_27acc40e port map (
clk,
swp2_uxn_opcodes_h_l3065_c41_25d7_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l3065_c41_25d7_phase,
swp2_uxn_opcodes_h_l3065_c41_25d7_ins,
swp2_uxn_opcodes_h_l3065_c41_25d7_previous_stack_read,
swp2_uxn_opcodes_h_l3065_c41_25d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_left,
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_right,
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd
opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_cond,
opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_iftrue,
opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_iffalse,
opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output);

-- rot_uxn_opcodes_h_l3066_c41_f57e
rot_uxn_opcodes_h_l3066_c41_f57e : entity work.rot_0CLK_97b3b4bb port map (
clk,
rot_uxn_opcodes_h_l3066_c41_f57e_CLOCK_ENABLE,
rot_uxn_opcodes_h_l3066_c41_f57e_phase,
rot_uxn_opcodes_h_l3066_c41_f57e_ins,
rot_uxn_opcodes_h_l3066_c41_f57e_previous_stack_read,
rot_uxn_opcodes_h_l3066_c41_f57e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_left,
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_right,
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba
opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_cond,
opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_iftrue,
opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_iffalse,
opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output);

-- rot2_uxn_opcodes_h_l3067_c41_bf62
rot2_uxn_opcodes_h_l3067_c41_bf62 : entity work.rot2_0CLK_fc44b089 port map (
clk,
rot2_uxn_opcodes_h_l3067_c41_bf62_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l3067_c41_bf62_phase,
rot2_uxn_opcodes_h_l3067_c41_bf62_ins,
rot2_uxn_opcodes_h_l3067_c41_bf62_previous_stack_read,
rot2_uxn_opcodes_h_l3067_c41_bf62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_left,
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_right,
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4
opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_cond,
opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_iftrue,
opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_iffalse,
opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output);

-- dup_uxn_opcodes_h_l3068_c41_37a0
dup_uxn_opcodes_h_l3068_c41_37a0 : entity work.dup_0CLK_6be78140 port map (
clk,
dup_uxn_opcodes_h_l3068_c41_37a0_CLOCK_ENABLE,
dup_uxn_opcodes_h_l3068_c41_37a0_phase,
dup_uxn_opcodes_h_l3068_c41_37a0_ins,
dup_uxn_opcodes_h_l3068_c41_37a0_previous_stack_read,
dup_uxn_opcodes_h_l3068_c41_37a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_left,
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_right,
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc
opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_cond,
opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_iftrue,
opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_iffalse,
opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output);

-- dup2_uxn_opcodes_h_l3069_c41_4d95
dup2_uxn_opcodes_h_l3069_c41_4d95 : entity work.dup2_0CLK_be266937 port map (
clk,
dup2_uxn_opcodes_h_l3069_c41_4d95_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l3069_c41_4d95_phase,
dup2_uxn_opcodes_h_l3069_c41_4d95_ins,
dup2_uxn_opcodes_h_l3069_c41_4d95_previous_stack_read,
dup2_uxn_opcodes_h_l3069_c41_4d95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_left,
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_right,
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3
opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_cond,
opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output);

-- ovr_uxn_opcodes_h_l3070_c41_1f1d
ovr_uxn_opcodes_h_l3070_c41_1f1d : entity work.ovr_0CLK_a1f536f9 port map (
clk,
ovr_uxn_opcodes_h_l3070_c41_1f1d_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l3070_c41_1f1d_phase,
ovr_uxn_opcodes_h_l3070_c41_1f1d_ins,
ovr_uxn_opcodes_h_l3070_c41_1f1d_previous_stack_read,
ovr_uxn_opcodes_h_l3070_c41_1f1d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_left,
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_right,
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba
opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_cond,
opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_iftrue,
opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_iffalse,
opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output);

-- ovr2_uxn_opcodes_h_l3071_c41_2ee6
ovr2_uxn_opcodes_h_l3071_c41_2ee6 : entity work.ovr2_0CLK_a10f7d9d port map (
clk,
ovr2_uxn_opcodes_h_l3071_c41_2ee6_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l3071_c41_2ee6_phase,
ovr2_uxn_opcodes_h_l3071_c41_2ee6_ins,
ovr2_uxn_opcodes_h_l3071_c41_2ee6_previous_stack_read,
ovr2_uxn_opcodes_h_l3071_c41_2ee6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_left,
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_right,
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c
opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_cond,
opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output);

-- equ_uxn_opcodes_h_l3072_c41_024f
equ_uxn_opcodes_h_l3072_c41_024f : entity work.equ_0CLK_6d7675a8 port map (
clk,
equ_uxn_opcodes_h_l3072_c41_024f_CLOCK_ENABLE,
equ_uxn_opcodes_h_l3072_c41_024f_phase,
equ_uxn_opcodes_h_l3072_c41_024f_ins,
equ_uxn_opcodes_h_l3072_c41_024f_previous_stack_read,
equ_uxn_opcodes_h_l3072_c41_024f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_left,
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_right,
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3073_c7_5906
opc_result_MUX_uxn_opcodes_h_l3073_c7_5906 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_cond,
opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_iftrue,
opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_iffalse,
opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_return_output);

-- equ2_uxn_opcodes_h_l3073_c41_1ae4
equ2_uxn_opcodes_h_l3073_c41_1ae4 : entity work.equ2_0CLK_c96e1a89 port map (
clk,
equ2_uxn_opcodes_h_l3073_c41_1ae4_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l3073_c41_1ae4_phase,
equ2_uxn_opcodes_h_l3073_c41_1ae4_ins,
equ2_uxn_opcodes_h_l3073_c41_1ae4_previous_stack_read,
equ2_uxn_opcodes_h_l3073_c41_1ae4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_left,
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_right,
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa
opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_cond,
opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_iftrue,
opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_iffalse,
opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output);

-- neq_uxn_opcodes_h_l3074_c41_9968
neq_uxn_opcodes_h_l3074_c41_9968 : entity work.neq_0CLK_6d7675a8 port map (
clk,
neq_uxn_opcodes_h_l3074_c41_9968_CLOCK_ENABLE,
neq_uxn_opcodes_h_l3074_c41_9968_phase,
neq_uxn_opcodes_h_l3074_c41_9968_ins,
neq_uxn_opcodes_h_l3074_c41_9968_previous_stack_read,
neq_uxn_opcodes_h_l3074_c41_9968_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_left,
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_right,
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3075_c7_0581
opc_result_MUX_uxn_opcodes_h_l3075_c7_0581 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_cond,
opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_iftrue,
opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_iffalse,
opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_return_output);

-- neq2_uxn_opcodes_h_l3075_c41_48b8
neq2_uxn_opcodes_h_l3075_c41_48b8 : entity work.neq2_0CLK_c96e1a89 port map (
clk,
neq2_uxn_opcodes_h_l3075_c41_48b8_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l3075_c41_48b8_phase,
neq2_uxn_opcodes_h_l3075_c41_48b8_ins,
neq2_uxn_opcodes_h_l3075_c41_48b8_previous_stack_read,
neq2_uxn_opcodes_h_l3075_c41_48b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_left,
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_right,
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5
opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_cond,
opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output);

-- gth_uxn_opcodes_h_l3076_c41_53cc
gth_uxn_opcodes_h_l3076_c41_53cc : entity work.gth_0CLK_6d7675a8 port map (
clk,
gth_uxn_opcodes_h_l3076_c41_53cc_CLOCK_ENABLE,
gth_uxn_opcodes_h_l3076_c41_53cc_phase,
gth_uxn_opcodes_h_l3076_c41_53cc_ins,
gth_uxn_opcodes_h_l3076_c41_53cc_previous_stack_read,
gth_uxn_opcodes_h_l3076_c41_53cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_left,
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_right,
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3077_c7_0183
opc_result_MUX_uxn_opcodes_h_l3077_c7_0183 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_cond,
opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_iftrue,
opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_iffalse,
opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_return_output);

-- gth2_uxn_opcodes_h_l3077_c41_a4de
gth2_uxn_opcodes_h_l3077_c41_a4de : entity work.gth2_0CLK_c96e1a89 port map (
clk,
gth2_uxn_opcodes_h_l3077_c41_a4de_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l3077_c41_a4de_phase,
gth2_uxn_opcodes_h_l3077_c41_a4de_ins,
gth2_uxn_opcodes_h_l3077_c41_a4de_previous_stack_read,
gth2_uxn_opcodes_h_l3077_c41_a4de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_left,
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_right,
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3078_c7_0809
opc_result_MUX_uxn_opcodes_h_l3078_c7_0809 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_cond,
opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_iftrue,
opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_iffalse,
opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_return_output);

-- lth_uxn_opcodes_h_l3078_c41_3fe7
lth_uxn_opcodes_h_l3078_c41_3fe7 : entity work.lth_0CLK_6d7675a8 port map (
clk,
lth_uxn_opcodes_h_l3078_c41_3fe7_CLOCK_ENABLE,
lth_uxn_opcodes_h_l3078_c41_3fe7_phase,
lth_uxn_opcodes_h_l3078_c41_3fe7_ins,
lth_uxn_opcodes_h_l3078_c41_3fe7_previous_stack_read,
lth_uxn_opcodes_h_l3078_c41_3fe7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_left,
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_right,
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec
opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_cond,
opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_iftrue,
opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_iffalse,
opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output);

-- lth2_uxn_opcodes_h_l3079_c41_2992
lth2_uxn_opcodes_h_l3079_c41_2992 : entity work.lth2_0CLK_c96e1a89 port map (
clk,
lth2_uxn_opcodes_h_l3079_c41_2992_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l3079_c41_2992_phase,
lth2_uxn_opcodes_h_l3079_c41_2992_ins,
lth2_uxn_opcodes_h_l3079_c41_2992_previous_stack_read,
lth2_uxn_opcodes_h_l3079_c41_2992_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_left,
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_right,
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf
opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_cond,
opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_iftrue,
opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_iffalse,
opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output);

-- jmp_uxn_opcodes_h_l3080_c41_658c
jmp_uxn_opcodes_h_l3080_c41_658c : entity work.jmp_0CLK_b7103d16 port map (
clk,
jmp_uxn_opcodes_h_l3080_c41_658c_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l3080_c41_658c_phase,
jmp_uxn_opcodes_h_l3080_c41_658c_ins,
jmp_uxn_opcodes_h_l3080_c41_658c_pc,
jmp_uxn_opcodes_h_l3080_c41_658c_previous_stack_read,
jmp_uxn_opcodes_h_l3080_c41_658c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_left,
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_right,
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3081_c7_118f
opc_result_MUX_uxn_opcodes_h_l3081_c7_118f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_cond,
opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_return_output);

-- jmp2_uxn_opcodes_h_l3081_c41_0056
jmp2_uxn_opcodes_h_l3081_c41_0056 : entity work.jmp2_0CLK_be70b838 port map (
clk,
jmp2_uxn_opcodes_h_l3081_c41_0056_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l3081_c41_0056_phase,
jmp2_uxn_opcodes_h_l3081_c41_0056_ins,
jmp2_uxn_opcodes_h_l3081_c41_0056_previous_stack_read,
jmp2_uxn_opcodes_h_l3081_c41_0056_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_left,
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_right,
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a
opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_cond,
opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output);

-- jcn_uxn_opcodes_h_l3082_c41_32eb
jcn_uxn_opcodes_h_l3082_c41_32eb : entity work.jcn_0CLK_b288bfb7 port map (
clk,
jcn_uxn_opcodes_h_l3082_c41_32eb_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l3082_c41_32eb_phase,
jcn_uxn_opcodes_h_l3082_c41_32eb_ins,
jcn_uxn_opcodes_h_l3082_c41_32eb_pc,
jcn_uxn_opcodes_h_l3082_c41_32eb_previous_stack_read,
jcn_uxn_opcodes_h_l3082_c41_32eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_left,
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_right,
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f
opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_cond,
opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output);

-- jcn2_uxn_opcodes_h_l3083_c41_486f
jcn2_uxn_opcodes_h_l3083_c41_486f : entity work.jcn2_0CLK_f91b0bf2 port map (
clk,
jcn2_uxn_opcodes_h_l3083_c41_486f_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l3083_c41_486f_phase,
jcn2_uxn_opcodes_h_l3083_c41_486f_ins,
jcn2_uxn_opcodes_h_l3083_c41_486f_previous_stack_read,
jcn2_uxn_opcodes_h_l3083_c41_486f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_left,
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_right,
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3084_c7_4724
opc_result_MUX_uxn_opcodes_h_l3084_c7_4724 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_cond,
opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_iftrue,
opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_iffalse,
opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_return_output);

-- jsr_uxn_opcodes_h_l3084_c41_6801
jsr_uxn_opcodes_h_l3084_c41_6801 : entity work.jsr_0CLK_4f993427 port map (
clk,
jsr_uxn_opcodes_h_l3084_c41_6801_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l3084_c41_6801_phase,
jsr_uxn_opcodes_h_l3084_c41_6801_ins,
jsr_uxn_opcodes_h_l3084_c41_6801_pc,
jsr_uxn_opcodes_h_l3084_c41_6801_previous_stack_read,
jsr_uxn_opcodes_h_l3084_c41_6801_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_left,
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_right,
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96
opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_cond,
opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_iftrue,
opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_iffalse,
opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output);

-- jsr2_uxn_opcodes_h_l3085_c41_5485
jsr2_uxn_opcodes_h_l3085_c41_5485 : entity work.jsr2_0CLK_6e0dc44d port map (
clk,
jsr2_uxn_opcodes_h_l3085_c41_5485_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l3085_c41_5485_phase,
jsr2_uxn_opcodes_h_l3085_c41_5485_ins,
jsr2_uxn_opcodes_h_l3085_c41_5485_pc,
jsr2_uxn_opcodes_h_l3085_c41_5485_previous_stack_read,
jsr2_uxn_opcodes_h_l3085_c41_5485_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_left,
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_right,
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1
opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_cond,
opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output);

-- sth_uxn_opcodes_h_l3086_c41_e998
sth_uxn_opcodes_h_l3086_c41_e998 : entity work.sth_0CLK_85d5529e port map (
clk,
sth_uxn_opcodes_h_l3086_c41_e998_CLOCK_ENABLE,
sth_uxn_opcodes_h_l3086_c41_e998_phase,
sth_uxn_opcodes_h_l3086_c41_e998_ins,
sth_uxn_opcodes_h_l3086_c41_e998_previous_stack_read,
sth_uxn_opcodes_h_l3086_c41_e998_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_left,
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_right,
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3087_c7_9377
opc_result_MUX_uxn_opcodes_h_l3087_c7_9377 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_cond,
opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_iftrue,
opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_iffalse,
opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_return_output);

-- sth2_uxn_opcodes_h_l3087_c41_fa07
sth2_uxn_opcodes_h_l3087_c41_fa07 : entity work.sth2_0CLK_f91b0bf2 port map (
clk,
sth2_uxn_opcodes_h_l3087_c41_fa07_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l3087_c41_fa07_phase,
sth2_uxn_opcodes_h_l3087_c41_fa07_ins,
sth2_uxn_opcodes_h_l3087_c41_fa07_previous_stack_read,
sth2_uxn_opcodes_h_l3087_c41_fa07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_left,
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_right,
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12
opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_cond,
opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_iftrue,
opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_iffalse,
opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output);

-- ldz_uxn_opcodes_h_l3088_c41_d133
ldz_uxn_opcodes_h_l3088_c41_d133 : entity work.ldz_0CLK_46731a7b port map (
clk,
ldz_uxn_opcodes_h_l3088_c41_d133_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l3088_c41_d133_phase,
ldz_uxn_opcodes_h_l3088_c41_d133_ins,
ldz_uxn_opcodes_h_l3088_c41_d133_previous_stack_read,
ldz_uxn_opcodes_h_l3088_c41_d133_previous_ram_read,
ldz_uxn_opcodes_h_l3088_c41_d133_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_left,
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_right,
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3
opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_cond,
opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output);

-- ldz2_uxn_opcodes_h_l3089_c41_1a27
ldz2_uxn_opcodes_h_l3089_c41_1a27 : entity work.ldz2_0CLK_1417ec42 port map (
clk,
ldz2_uxn_opcodes_h_l3089_c41_1a27_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l3089_c41_1a27_phase,
ldz2_uxn_opcodes_h_l3089_c41_1a27_ins,
ldz2_uxn_opcodes_h_l3089_c41_1a27_previous_stack_read,
ldz2_uxn_opcodes_h_l3089_c41_1a27_previous_ram_read,
ldz2_uxn_opcodes_h_l3089_c41_1a27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_left,
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_right,
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d
opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_cond,
opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output);

-- stz_uxn_opcodes_h_l3090_c41_43cf
stz_uxn_opcodes_h_l3090_c41_43cf : entity work.stz_0CLK_75b4bee3 port map (
clk,
stz_uxn_opcodes_h_l3090_c41_43cf_CLOCK_ENABLE,
stz_uxn_opcodes_h_l3090_c41_43cf_phase,
stz_uxn_opcodes_h_l3090_c41_43cf_ins,
stz_uxn_opcodes_h_l3090_c41_43cf_previous_stack_read,
stz_uxn_opcodes_h_l3090_c41_43cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_left,
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_right,
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3091_c7_d733
opc_result_MUX_uxn_opcodes_h_l3091_c7_d733 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_cond,
opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_iftrue,
opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_iffalse,
opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_return_output);

-- stz2_uxn_opcodes_h_l3091_c41_cc53
stz2_uxn_opcodes_h_l3091_c41_cc53 : entity work.stz2_0CLK_f2c34df9 port map (
clk,
stz2_uxn_opcodes_h_l3091_c41_cc53_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l3091_c41_cc53_phase,
stz2_uxn_opcodes_h_l3091_c41_cc53_ins,
stz2_uxn_opcodes_h_l3091_c41_cc53_previous_stack_read,
stz2_uxn_opcodes_h_l3091_c41_cc53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_left,
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_right,
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73
opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_cond,
opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_iftrue,
opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_iffalse,
opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output);

-- ldr_uxn_opcodes_h_l3092_c41_a7b7
ldr_uxn_opcodes_h_l3092_c41_a7b7 : entity work.ldr_0CLK_a6885b22 port map (
clk,
ldr_uxn_opcodes_h_l3092_c41_a7b7_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l3092_c41_a7b7_phase,
ldr_uxn_opcodes_h_l3092_c41_a7b7_ins,
ldr_uxn_opcodes_h_l3092_c41_a7b7_pc,
ldr_uxn_opcodes_h_l3092_c41_a7b7_previous_stack_read,
ldr_uxn_opcodes_h_l3092_c41_a7b7_previous_ram_read,
ldr_uxn_opcodes_h_l3092_c41_a7b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_left,
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_right,
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3093_c7_716c
opc_result_MUX_uxn_opcodes_h_l3093_c7_716c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_cond,
opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_return_output);

-- ldr2_uxn_opcodes_h_l3093_c41_c8e3
ldr2_uxn_opcodes_h_l3093_c41_c8e3 : entity work.ldr2_0CLK_1417ec42 port map (
clk,
ldr2_uxn_opcodes_h_l3093_c41_c8e3_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l3093_c41_c8e3_phase,
ldr2_uxn_opcodes_h_l3093_c41_c8e3_ins,
ldr2_uxn_opcodes_h_l3093_c41_c8e3_pc,
ldr2_uxn_opcodes_h_l3093_c41_c8e3_previous_stack_read,
ldr2_uxn_opcodes_h_l3093_c41_c8e3_previous_ram_read,
ldr2_uxn_opcodes_h_l3093_c41_c8e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_left,
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_right,
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5
opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_cond,
opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output);

-- str1_uxn_opcodes_h_l3094_c41_eef5
str1_uxn_opcodes_h_l3094_c41_eef5 : entity work.str1_0CLK_90cbec6a port map (
clk,
str1_uxn_opcodes_h_l3094_c41_eef5_CLOCK_ENABLE,
str1_uxn_opcodes_h_l3094_c41_eef5_phase,
str1_uxn_opcodes_h_l3094_c41_eef5_ins,
str1_uxn_opcodes_h_l3094_c41_eef5_pc,
str1_uxn_opcodes_h_l3094_c41_eef5_previous_stack_read,
str1_uxn_opcodes_h_l3094_c41_eef5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_left,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_right,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70
opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_cond,
opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_iftrue,
opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_iffalse,
opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output);

-- str2_uxn_opcodes_h_l3095_c41_9a26
str2_uxn_opcodes_h_l3095_c41_9a26 : entity work.str2_0CLK_f2c34df9 port map (
clk,
str2_uxn_opcodes_h_l3095_c41_9a26_CLOCK_ENABLE,
str2_uxn_opcodes_h_l3095_c41_9a26_phase,
str2_uxn_opcodes_h_l3095_c41_9a26_ins,
str2_uxn_opcodes_h_l3095_c41_9a26_pc,
str2_uxn_opcodes_h_l3095_c41_9a26_previous_stack_read,
str2_uxn_opcodes_h_l3095_c41_9a26_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_left,
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_right,
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee
opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_cond,
opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_iftrue,
opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_iffalse,
opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output);

-- lda_uxn_opcodes_h_l3096_c41_7d8d
lda_uxn_opcodes_h_l3096_c41_7d8d : entity work.lda_0CLK_05e131b1 port map (
clk,
lda_uxn_opcodes_h_l3096_c41_7d8d_CLOCK_ENABLE,
lda_uxn_opcodes_h_l3096_c41_7d8d_phase,
lda_uxn_opcodes_h_l3096_c41_7d8d_ins,
lda_uxn_opcodes_h_l3096_c41_7d8d_previous_stack_read,
lda_uxn_opcodes_h_l3096_c41_7d8d_previous_ram_read,
lda_uxn_opcodes_h_l3096_c41_7d8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_left,
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_right,
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3097_c7_7132
opc_result_MUX_uxn_opcodes_h_l3097_c7_7132 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_cond,
opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_iftrue,
opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_iffalse,
opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_return_output);

-- lda2_uxn_opcodes_h_l3097_c41_5087
lda2_uxn_opcodes_h_l3097_c41_5087 : entity work.lda2_0CLK_c8be2b47 port map (
clk,
lda2_uxn_opcodes_h_l3097_c41_5087_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l3097_c41_5087_phase,
lda2_uxn_opcodes_h_l3097_c41_5087_ins,
lda2_uxn_opcodes_h_l3097_c41_5087_previous_stack_read,
lda2_uxn_opcodes_h_l3097_c41_5087_previous_ram_read,
lda2_uxn_opcodes_h_l3097_c41_5087_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_left,
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_right,
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3098_c7_9389
opc_result_MUX_uxn_opcodes_h_l3098_c7_9389 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_cond,
opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_iftrue,
opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_iffalse,
opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_return_output);

-- sta_uxn_opcodes_h_l3098_c41_9eac
sta_uxn_opcodes_h_l3098_c41_9eac : entity work.sta_0CLK_89f6ba96 port map (
clk,
sta_uxn_opcodes_h_l3098_c41_9eac_CLOCK_ENABLE,
sta_uxn_opcodes_h_l3098_c41_9eac_phase,
sta_uxn_opcodes_h_l3098_c41_9eac_ins,
sta_uxn_opcodes_h_l3098_c41_9eac_previous_stack_read,
sta_uxn_opcodes_h_l3098_c41_9eac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_left,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_right,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07
opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_cond,
opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_iftrue,
opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_iffalse,
opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output);

-- sta2_uxn_opcodes_h_l3099_c41_beb5
sta2_uxn_opcodes_h_l3099_c41_beb5 : entity work.sta2_0CLK_44f2ccf6 port map (
clk,
sta2_uxn_opcodes_h_l3099_c41_beb5_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l3099_c41_beb5_phase,
sta2_uxn_opcodes_h_l3099_c41_beb5_ins,
sta2_uxn_opcodes_h_l3099_c41_beb5_previous_stack_read,
sta2_uxn_opcodes_h_l3099_c41_beb5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_left,
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_right,
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3100_c7_4855
opc_result_MUX_uxn_opcodes_h_l3100_c7_4855 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_cond,
opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_iftrue,
opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_iffalse,
opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_return_output);

-- dei_uxn_opcodes_h_l3100_c41_821e
dei_uxn_opcodes_h_l3100_c41_821e : entity work.dei_0CLK_540d7a59 port map (
clk,
dei_uxn_opcodes_h_l3100_c41_821e_CLOCK_ENABLE,
dei_uxn_opcodes_h_l3100_c41_821e_phase,
dei_uxn_opcodes_h_l3100_c41_821e_ins,
dei_uxn_opcodes_h_l3100_c41_821e_previous_stack_read,
dei_uxn_opcodes_h_l3100_c41_821e_previous_device_ram_read,
dei_uxn_opcodes_h_l3100_c41_821e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_left,
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_right,
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3101_c7_f371
opc_result_MUX_uxn_opcodes_h_l3101_c7_f371 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_cond,
opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_iftrue,
opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_iffalse,
opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_return_output);

-- dei2_uxn_opcodes_h_l3101_c41_49bf
dei2_uxn_opcodes_h_l3101_c41_49bf : entity work.dei2_0CLK_5ef9c585 port map (
clk,
dei2_uxn_opcodes_h_l3101_c41_49bf_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l3101_c41_49bf_phase,
dei2_uxn_opcodes_h_l3101_c41_49bf_ins,
dei2_uxn_opcodes_h_l3101_c41_49bf_previous_stack_read,
dei2_uxn_opcodes_h_l3101_c41_49bf_previous_device_ram_read,
dei2_uxn_opcodes_h_l3101_c41_49bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_left,
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_right,
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3
opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_cond,
opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output);

-- deo_uxn_opcodes_h_l3102_c41_476b
deo_uxn_opcodes_h_l3102_c41_476b : entity work.deo_0CLK_e53cbd5e port map (
clk,
deo_uxn_opcodes_h_l3102_c41_476b_CLOCK_ENABLE,
deo_uxn_opcodes_h_l3102_c41_476b_phase,
deo_uxn_opcodes_h_l3102_c41_476b_ins,
deo_uxn_opcodes_h_l3102_c41_476b_previous_stack_read,
deo_uxn_opcodes_h_l3102_c41_476b_previous_device_ram_read,
deo_uxn_opcodes_h_l3102_c41_476b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_left,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_right,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3103_c7_233e
opc_result_MUX_uxn_opcodes_h_l3103_c7_233e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_cond,
opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_return_output);

-- deo2_uxn_opcodes_h_l3103_c41_0046
deo2_uxn_opcodes_h_l3103_c41_0046 : entity work.deo2_0CLK_c38f245c port map (
clk,
deo2_uxn_opcodes_h_l3103_c41_0046_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l3103_c41_0046_phase,
deo2_uxn_opcodes_h_l3103_c41_0046_ins,
deo2_uxn_opcodes_h_l3103_c41_0046_previous_stack_read,
deo2_uxn_opcodes_h_l3103_c41_0046_previous_device_ram_read,
deo2_uxn_opcodes_h_l3103_c41_0046_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_left,
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_right,
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3104_c7_7968
opc_result_MUX_uxn_opcodes_h_l3104_c7_7968 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_cond,
opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_iftrue,
opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_iffalse,
opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_return_output);

-- add_uxn_opcodes_h_l3104_c41_5ab9
add_uxn_opcodes_h_l3104_c41_5ab9 : entity work.add_0CLK_f62d646e port map (
clk,
add_uxn_opcodes_h_l3104_c41_5ab9_CLOCK_ENABLE,
add_uxn_opcodes_h_l3104_c41_5ab9_phase,
add_uxn_opcodes_h_l3104_c41_5ab9_ins,
add_uxn_opcodes_h_l3104_c41_5ab9_previous_stack_read,
add_uxn_opcodes_h_l3104_c41_5ab9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_left,
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_right,
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8
opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_cond,
opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output);

-- add2_uxn_opcodes_h_l3105_c41_924c
add2_uxn_opcodes_h_l3105_c41_924c : entity work.add2_0CLK_a7b4806f port map (
clk,
add2_uxn_opcodes_h_l3105_c41_924c_CLOCK_ENABLE,
add2_uxn_opcodes_h_l3105_c41_924c_phase,
add2_uxn_opcodes_h_l3105_c41_924c_ins,
add2_uxn_opcodes_h_l3105_c41_924c_previous_stack_read,
add2_uxn_opcodes_h_l3105_c41_924c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_left,
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_right,
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3106_c7_e697
opc_result_MUX_uxn_opcodes_h_l3106_c7_e697 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_cond,
opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_iftrue,
opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_iffalse,
opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_return_output);

-- sub_uxn_opcodes_h_l3106_c41_7bb4
sub_uxn_opcodes_h_l3106_c41_7bb4 : entity work.sub_0CLK_f62d646e port map (
clk,
sub_uxn_opcodes_h_l3106_c41_7bb4_CLOCK_ENABLE,
sub_uxn_opcodes_h_l3106_c41_7bb4_phase,
sub_uxn_opcodes_h_l3106_c41_7bb4_ins,
sub_uxn_opcodes_h_l3106_c41_7bb4_previous_stack_read,
sub_uxn_opcodes_h_l3106_c41_7bb4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_left,
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_right,
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3107_c7_d268
opc_result_MUX_uxn_opcodes_h_l3107_c7_d268 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_cond,
opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_iftrue,
opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_iffalse,
opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_return_output);

-- sub2_uxn_opcodes_h_l3107_c41_cc09
sub2_uxn_opcodes_h_l3107_c41_cc09 : entity work.sub2_0CLK_a7b4806f port map (
clk,
sub2_uxn_opcodes_h_l3107_c41_cc09_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l3107_c41_cc09_phase,
sub2_uxn_opcodes_h_l3107_c41_cc09_ins,
sub2_uxn_opcodes_h_l3107_c41_cc09_previous_stack_read,
sub2_uxn_opcodes_h_l3107_c41_cc09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_left,
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_right,
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1
opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_cond,
opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output);

-- mul_uxn_opcodes_h_l3108_c41_2961
mul_uxn_opcodes_h_l3108_c41_2961 : entity work.mul_0CLK_f62d646e port map (
clk,
mul_uxn_opcodes_h_l3108_c41_2961_CLOCK_ENABLE,
mul_uxn_opcodes_h_l3108_c41_2961_phase,
mul_uxn_opcodes_h_l3108_c41_2961_ins,
mul_uxn_opcodes_h_l3108_c41_2961_previous_stack_read,
mul_uxn_opcodes_h_l3108_c41_2961_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_left,
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_right,
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64
opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_cond,
opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_iftrue,
opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_iffalse,
opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output);

-- mul2_uxn_opcodes_h_l3109_c41_78b5
mul2_uxn_opcodes_h_l3109_c41_78b5 : entity work.mul2_0CLK_a7b4806f port map (
clk,
mul2_uxn_opcodes_h_l3109_c41_78b5_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l3109_c41_78b5_phase,
mul2_uxn_opcodes_h_l3109_c41_78b5_ins,
mul2_uxn_opcodes_h_l3109_c41_78b5_previous_stack_read,
mul2_uxn_opcodes_h_l3109_c41_78b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_left,
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_right,
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3110_c7_9886
opc_result_MUX_uxn_opcodes_h_l3110_c7_9886 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_cond,
opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_iftrue,
opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_iffalse,
opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_return_output);

-- div_uxn_opcodes_h_l3110_c41_0810
div_uxn_opcodes_h_l3110_c41_0810 : entity work.div_0CLK_af9273cc port map (
clk,
div_uxn_opcodes_h_l3110_c41_0810_CLOCK_ENABLE,
div_uxn_opcodes_h_l3110_c41_0810_phase,
div_uxn_opcodes_h_l3110_c41_0810_ins,
div_uxn_opcodes_h_l3110_c41_0810_previous_stack_read,
div_uxn_opcodes_h_l3110_c41_0810_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_left,
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_right,
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99
opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_cond,
opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_iftrue,
opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_iffalse,
opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output);

-- div2_uxn_opcodes_h_l3111_c41_4e50
div2_uxn_opcodes_h_l3111_c41_4e50 : entity work.div2_0CLK_db5cbd9a port map (
clk,
div2_uxn_opcodes_h_l3111_c41_4e50_CLOCK_ENABLE,
div2_uxn_opcodes_h_l3111_c41_4e50_phase,
div2_uxn_opcodes_h_l3111_c41_4e50_ins,
div2_uxn_opcodes_h_l3111_c41_4e50_previous_stack_read,
div2_uxn_opcodes_h_l3111_c41_4e50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_left,
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_right,
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8
opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_cond,
opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output);

-- and_uxn_opcodes_h_l3112_c41_717f
and_uxn_opcodes_h_l3112_c41_717f : entity work.and_0CLK_f62d646e port map (
clk,
and_uxn_opcodes_h_l3112_c41_717f_CLOCK_ENABLE,
and_uxn_opcodes_h_l3112_c41_717f_phase,
and_uxn_opcodes_h_l3112_c41_717f_ins,
and_uxn_opcodes_h_l3112_c41_717f_previous_stack_read,
and_uxn_opcodes_h_l3112_c41_717f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_left,
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_right,
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f
opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_cond,
opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output);

-- and2_uxn_opcodes_h_l3113_c41_42f4
and2_uxn_opcodes_h_l3113_c41_42f4 : entity work.and2_0CLK_a7b4806f port map (
clk,
and2_uxn_opcodes_h_l3113_c41_42f4_CLOCK_ENABLE,
and2_uxn_opcodes_h_l3113_c41_42f4_phase,
and2_uxn_opcodes_h_l3113_c41_42f4_ins,
and2_uxn_opcodes_h_l3113_c41_42f4_previous_stack_read,
and2_uxn_opcodes_h_l3113_c41_42f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_left,
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_right,
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0
opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_cond,
opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_iftrue,
opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_iffalse,
opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output);

-- ora_uxn_opcodes_h_l3114_c41_9911
ora_uxn_opcodes_h_l3114_c41_9911 : entity work.ora_0CLK_f62d646e port map (
clk,
ora_uxn_opcodes_h_l3114_c41_9911_CLOCK_ENABLE,
ora_uxn_opcodes_h_l3114_c41_9911_phase,
ora_uxn_opcodes_h_l3114_c41_9911_ins,
ora_uxn_opcodes_h_l3114_c41_9911_previous_stack_read,
ora_uxn_opcodes_h_l3114_c41_9911_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_left,
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_right,
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3115_c7_a296
opc_result_MUX_uxn_opcodes_h_l3115_c7_a296 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_cond,
opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_iftrue,
opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_iffalse,
opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_return_output);

-- ora2_uxn_opcodes_h_l3115_c41_11fa
ora2_uxn_opcodes_h_l3115_c41_11fa : entity work.ora2_0CLK_a7b4806f port map (
clk,
ora2_uxn_opcodes_h_l3115_c41_11fa_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l3115_c41_11fa_phase,
ora2_uxn_opcodes_h_l3115_c41_11fa_ins,
ora2_uxn_opcodes_h_l3115_c41_11fa_previous_stack_read,
ora2_uxn_opcodes_h_l3115_c41_11fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_left,
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_right,
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae
opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_cond,
opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_iftrue,
opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_iffalse,
opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output);

-- eor_uxn_opcodes_h_l3116_c41_896a
eor_uxn_opcodes_h_l3116_c41_896a : entity work.eor_0CLK_f62d646e port map (
clk,
eor_uxn_opcodes_h_l3116_c41_896a_CLOCK_ENABLE,
eor_uxn_opcodes_h_l3116_c41_896a_phase,
eor_uxn_opcodes_h_l3116_c41_896a_ins,
eor_uxn_opcodes_h_l3116_c41_896a_previous_stack_read,
eor_uxn_opcodes_h_l3116_c41_896a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_left,
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_right,
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3117_c7_6066
opc_result_MUX_uxn_opcodes_h_l3117_c7_6066 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_cond,
opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_iftrue,
opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_iffalse,
opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_return_output);

-- eor2_uxn_opcodes_h_l3117_c41_62c5
eor2_uxn_opcodes_h_l3117_c41_62c5 : entity work.eor2_0CLK_a7b4806f port map (
clk,
eor2_uxn_opcodes_h_l3117_c41_62c5_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l3117_c41_62c5_phase,
eor2_uxn_opcodes_h_l3117_c41_62c5_ins,
eor2_uxn_opcodes_h_l3117_c41_62c5_previous_stack_read,
eor2_uxn_opcodes_h_l3117_c41_62c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_left,
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_right,
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9
opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_cond,
opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_iftrue,
opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_iffalse,
opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output);

-- sft_uxn_opcodes_h_l3118_c41_2f6c
sft_uxn_opcodes_h_l3118_c41_2f6c : entity work.sft_0CLK_7bf7ae34 port map (
clk,
sft_uxn_opcodes_h_l3118_c41_2f6c_CLOCK_ENABLE,
sft_uxn_opcodes_h_l3118_c41_2f6c_phase,
sft_uxn_opcodes_h_l3118_c41_2f6c_ins,
sft_uxn_opcodes_h_l3118_c41_2f6c_previous_stack_read,
sft_uxn_opcodes_h_l3118_c41_2f6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_left,
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_right,
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3119_c7_472a
opc_result_MUX_uxn_opcodes_h_l3119_c7_472a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_cond,
opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_return_output);

-- sft2_uxn_opcodes_h_l3119_c41_b9fb
sft2_uxn_opcodes_h_l3119_c41_b9fb : entity work.sft2_0CLK_4392568d port map (
clk,
sft2_uxn_opcodes_h_l3119_c41_b9fb_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l3119_c41_b9fb_phase,
sft2_uxn_opcodes_h_l3119_c41_b9fb_ins,
sft2_uxn_opcodes_h_l3119_c41_b9fb_previous_stack_read,
sft2_uxn_opcodes_h_l3119_c41_b9fb_return_output);

-- printf_uxn_opcodes_h_l3120_c9_f344_uxn_opcodes_h_l3120_c9_f344
printf_uxn_opcodes_h_l3120_c9_f344_uxn_opcodes_h_l3120_c9_f344 : entity work.printf_uxn_opcodes_h_l3120_c9_f344_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3120_c9_f344_uxn_opcodes_h_l3120_c9_f344_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3120_c9_f344_uxn_opcodes_h_l3120_c9_f344_arg0);

-- BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93
BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_left,
BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_right,
BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b
BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_left,
BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_right,
BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_return_output);

-- MUX_uxn_opcodes_h_l3122_c18_42ac
MUX_uxn_opcodes_h_l3122_c18_42ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3122_c18_42ac_cond,
MUX_uxn_opcodes_h_l3122_c18_42ac_iftrue,
MUX_uxn_opcodes_h_l3122_c18_42ac_iffalse,
MUX_uxn_opcodes_h_l3122_c18_42ac_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56
BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56 : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_left,
BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_right,
BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_return_output);

-- sp0_MUX_uxn_opcodes_h_l3125_c2_9244
sp0_MUX_uxn_opcodes_h_l3125_c2_9244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3125_c2_9244_cond,
sp0_MUX_uxn_opcodes_h_l3125_c2_9244_iftrue,
sp0_MUX_uxn_opcodes_h_l3125_c2_9244_iffalse,
sp0_MUX_uxn_opcodes_h_l3125_c2_9244_return_output);

-- sp1_MUX_uxn_opcodes_h_l3125_c2_9244
sp1_MUX_uxn_opcodes_h_l3125_c2_9244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3125_c2_9244_cond,
sp1_MUX_uxn_opcodes_h_l3125_c2_9244_iftrue,
sp1_MUX_uxn_opcodes_h_l3125_c2_9244_iffalse,
sp1_MUX_uxn_opcodes_h_l3125_c2_9244_return_output);

-- sp0_MUX_uxn_opcodes_h_l3126_c3_0571
sp0_MUX_uxn_opcodes_h_l3126_c3_0571 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3126_c3_0571_cond,
sp0_MUX_uxn_opcodes_h_l3126_c3_0571_iftrue,
sp0_MUX_uxn_opcodes_h_l3126_c3_0571_iffalse,
sp0_MUX_uxn_opcodes_h_l3126_c3_0571_return_output);

-- sp1_MUX_uxn_opcodes_h_l3126_c3_0571
sp1_MUX_uxn_opcodes_h_l3126_c3_0571 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3126_c3_0571_cond,
sp1_MUX_uxn_opcodes_h_l3126_c3_0571_iftrue,
sp1_MUX_uxn_opcodes_h_l3126_c3_0571_iffalse,
sp1_MUX_uxn_opcodes_h_l3126_c3_0571_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c
BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_left,
BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_right,
BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4
BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_left,
BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_right,
BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_return_output);

-- MUX_uxn_opcodes_h_l3133_c30_92be
MUX_uxn_opcodes_h_l3133_c30_92be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3133_c30_92be_cond,
MUX_uxn_opcodes_h_l3133_c30_92be_iftrue,
MUX_uxn_opcodes_h_l3133_c30_92be_iffalse,
MUX_uxn_opcodes_h_l3133_c30_92be_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f
BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_left,
BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_right,
BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_return_output);

-- MUX_uxn_opcodes_h_l3134_c20_0c87
MUX_uxn_opcodes_h_l3134_c20_0c87 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3134_c20_0c87_cond,
MUX_uxn_opcodes_h_l3134_c20_0c87_iftrue,
MUX_uxn_opcodes_h_l3134_c20_0c87_iffalse,
MUX_uxn_opcodes_h_l3134_c20_0c87_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c
BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c : entity work.BIN_OP_PLUS_uint12_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_left,
BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_right,
BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_return_output);

-- stack_ram_update_uxn_opcodes_h_l3136_c21_1995
stack_ram_update_uxn_opcodes_h_l3136_c21_1995 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l3136_c21_1995_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l3136_c21_1995_stack_address,
stack_ram_update_uxn_opcodes_h_l3136_c21_1995_value,
stack_ram_update_uxn_opcodes_h_l3136_c21_1995_write_enable,
stack_ram_update_uxn_opcodes_h_l3136_c21_1995_return_output);

-- device_ram_update_uxn_opcodes_h_l3142_c26_ce1d
device_ram_update_uxn_opcodes_h_l3142_c26_ce1d : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_device_address,
device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_value,
device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_write_enable,
device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_return_output);



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
 stack_address,
 stack_read_value,
 device_ram_read_value,
 opc_result,
 opc_eval_result,
 -- All submodule outputs
 BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_return_output,
 CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3_return_output,
 MUX_uxn_opcodes_h_l3045_c10_c11e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output,
 opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output,
 jci_uxn_opcodes_h_l3051_c41_f3d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output,
 opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output,
 jmi_uxn_opcodes_h_l3052_c41_4434_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output,
 opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output,
 jsi_uxn_opcodes_h_l3053_c41_0f46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output,
 opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output,
 lit_uxn_opcodes_h_l3054_c41_8597_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output,
 opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output,
 lit2_uxn_opcodes_h_l3055_c41_d6e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output,
 lit_uxn_opcodes_h_l3056_c41_34c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output,
 opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output,
 lit2_uxn_opcodes_h_l3057_c41_f74d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output,
 opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output,
 inc_uxn_opcodes_h_l3058_c41_531f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output,
 inc2_uxn_opcodes_h_l3059_c41_0023_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_return_output,
 opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output,
 pop_uxn_opcodes_h_l3060_c41_0878_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_return_output,
 pop2_uxn_opcodes_h_l3061_c41_e626_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_return_output,
 nip_uxn_opcodes_h_l3062_c41_b331_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output,
 nip2_uxn_opcodes_h_l3063_c41_64cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_return_output,
 opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output,
 swp_uxn_opcodes_h_l3064_c41_68c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output,
 opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_return_output,
 swp2_uxn_opcodes_h_l3065_c41_25d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output,
 opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output,
 rot_uxn_opcodes_h_l3066_c41_f57e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output,
 opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output,
 rot2_uxn_opcodes_h_l3067_c41_bf62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output,
 opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output,
 dup_uxn_opcodes_h_l3068_c41_37a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output,
 dup2_uxn_opcodes_h_l3069_c41_4d95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output,
 opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output,
 ovr_uxn_opcodes_h_l3070_c41_1f1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output,
 ovr2_uxn_opcodes_h_l3071_c41_2ee6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_return_output,
 opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output,
 equ_uxn_opcodes_h_l3072_c41_024f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output,
 opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_return_output,
 equ2_uxn_opcodes_h_l3073_c41_1ae4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_return_output,
 opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output,
 neq_uxn_opcodes_h_l3074_c41_9968_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_return_output,
 neq2_uxn_opcodes_h_l3075_c41_48b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_return_output,
 opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output,
 gth_uxn_opcodes_h_l3076_c41_53cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_return_output,
 opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_return_output,
 gth2_uxn_opcodes_h_l3077_c41_a4de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output,
 opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_return_output,
 lth_uxn_opcodes_h_l3078_c41_3fe7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output,
 opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output,
 lth2_uxn_opcodes_h_l3079_c41_2992_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output,
 jmp_uxn_opcodes_h_l3080_c41_658c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_return_output,
 jmp2_uxn_opcodes_h_l3081_c41_0056_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output,
 jcn_uxn_opcodes_h_l3082_c41_32eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_return_output,
 opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output,
 jcn2_uxn_opcodes_h_l3083_c41_486f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output,
 opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_return_output,
 jsr_uxn_opcodes_h_l3084_c41_6801_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output,
 jsr2_uxn_opcodes_h_l3085_c41_5485_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_return_output,
 opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output,
 sth_uxn_opcodes_h_l3086_c41_e998_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output,
 opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_return_output,
 sth2_uxn_opcodes_h_l3087_c41_fa07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output,
 ldz_uxn_opcodes_h_l3088_c41_d133_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output,
 ldz2_uxn_opcodes_h_l3089_c41_1a27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_return_output,
 opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output,
 stz_uxn_opcodes_h_l3090_c41_43cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output,
 opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_return_output,
 stz2_uxn_opcodes_h_l3091_c41_cc53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output,
 ldr_uxn_opcodes_h_l3092_c41_a7b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_return_output,
 ldr2_uxn_opcodes_h_l3093_c41_c8e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output,
 opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output,
 str1_uxn_opcodes_h_l3094_c41_eef5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output,
 opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output,
 str2_uxn_opcodes_h_l3095_c41_9a26_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_return_output,
 opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output,
 lda_uxn_opcodes_h_l3096_c41_7d8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_return_output,
 opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_return_output,
 lda2_uxn_opcodes_h_l3097_c41_5087_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output,
 opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_return_output,
 sta_uxn_opcodes_h_l3098_c41_9eac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_return_output,
 opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output,
 sta2_uxn_opcodes_h_l3099_c41_beb5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_return_output,
 opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_return_output,
 dei_uxn_opcodes_h_l3100_c41_821e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_return_output,
 dei2_uxn_opcodes_h_l3101_c41_49bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output,
 deo_uxn_opcodes_h_l3102_c41_476b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_return_output,
 opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_return_output,
 deo2_uxn_opcodes_h_l3103_c41_0046_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_return_output,
 add_uxn_opcodes_h_l3104_c41_5ab9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_return_output,
 opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output,
 add2_uxn_opcodes_h_l3105_c41_924c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_return_output,
 opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_return_output,
 sub_uxn_opcodes_h_l3106_c41_7bb4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_return_output,
 sub2_uxn_opcodes_h_l3107_c41_cc09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output,
 opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output,
 mul_uxn_opcodes_h_l3108_c41_2961_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_return_output,
 opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output,
 mul2_uxn_opcodes_h_l3109_c41_78b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output,
 opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_return_output,
 div_uxn_opcodes_h_l3110_c41_0810_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output,
 div2_uxn_opcodes_h_l3111_c41_4e50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output,
 and_uxn_opcodes_h_l3112_c41_717f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output,
 opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output,
 and2_uxn_opcodes_h_l3113_c41_42f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_return_output,
 opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output,
 ora_uxn_opcodes_h_l3114_c41_9911_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output,
 opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_return_output,
 ora2_uxn_opcodes_h_l3115_c41_11fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_return_output,
 opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output,
 eor_uxn_opcodes_h_l3116_c41_896a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output,
 opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_return_output,
 eor2_uxn_opcodes_h_l3117_c41_62c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output,
 sft_uxn_opcodes_h_l3118_c41_2f6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_return_output,
 sft2_uxn_opcodes_h_l3119_c41_b9fb_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_return_output,
 MUX_uxn_opcodes_h_l3122_c18_42ac_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_return_output,
 sp0_MUX_uxn_opcodes_h_l3125_c2_9244_return_output,
 sp1_MUX_uxn_opcodes_h_l3125_c2_9244_return_output,
 sp0_MUX_uxn_opcodes_h_l3126_c3_0571_return_output,
 sp1_MUX_uxn_opcodes_h_l3126_c3_0571_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_return_output,
 MUX_uxn_opcodes_h_l3133_c30_92be_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_return_output,
 MUX_uxn_opcodes_h_l3134_c20_0c87_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_return_output,
 stack_ram_update_uxn_opcodes_h_l3136_c21_1995_return_output,
 device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l3045_c2_c9fa : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3045_c10_c11e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3045_c10_c11e_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3045_c10_c11e_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3045_c30_29dd_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3045_c57_c337_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3045_c10_c11e_return_output : unsigned(11 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3050_c2_f026_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3052_c41_4434_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3052_c41_4434_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3052_c41_4434_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3052_c41_4434_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3052_c41_4434_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3054_c41_8597_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3054_c41_8597_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3054_c41_8597_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3054_c41_8597_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3054_c41_8597_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3056_c41_34c1_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3056_c41_34c1_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3056_c41_34c1_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3056_c41_34c1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3056_c41_34c1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3058_c41_531f_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3058_c41_531f_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3058_c41_531f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3058_c41_531f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3058_c41_531f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3059_c41_0023_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3059_c41_0023_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3059_c41_0023_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3059_c41_0023_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3059_c41_0023_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3060_c41_0878_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3060_c41_0878_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3060_c41_0878_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3060_c41_0878_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3061_c41_e626_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3061_c41_e626_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3061_c41_e626_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3061_c41_e626_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3062_c41_b331_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3062_c41_b331_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3062_c41_b331_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3062_c41_b331_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3062_c41_b331_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3064_c41_68c2_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3064_c41_68c2_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3064_c41_68c2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3064_c41_68c2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3064_c41_68c2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3066_c41_f57e_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3066_c41_f57e_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3066_c41_f57e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3066_c41_f57e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3066_c41_f57e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3068_c41_37a0_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3068_c41_37a0_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3068_c41_37a0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3068_c41_37a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3068_c41_37a0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3072_c41_024f_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3072_c41_024f_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3072_c41_024f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3072_c41_024f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3072_c41_024f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3074_c41_9968_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3074_c41_9968_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3074_c41_9968_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3074_c41_9968_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3074_c41_9968_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3076_c41_53cc_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3076_c41_53cc_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3076_c41_53cc_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3076_c41_53cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3076_c41_53cc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3079_c41_2992_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3079_c41_2992_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3079_c41_2992_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3079_c41_2992_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3079_c41_2992_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3080_c41_658c_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3080_c41_658c_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3080_c41_658c_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3080_c41_658c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3080_c41_658c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3080_c41_658c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3084_c41_6801_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3084_c41_6801_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3084_c41_6801_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3084_c41_6801_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3084_c41_6801_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3084_c41_6801_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3086_c41_e998_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3086_c41_e998_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3086_c41_e998_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3086_c41_e998_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3086_c41_e998_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3088_c41_d133_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3088_c41_d133_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3088_c41_d133_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3088_c41_d133_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3088_c41_d133_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3088_c41_d133_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3090_c41_43cf_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3090_c41_43cf_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3090_c41_43cf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3090_c41_43cf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3090_c41_43cf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3094_c41_eef5_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3094_c41_eef5_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3094_c41_eef5_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3094_c41_eef5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3094_c41_eef5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3094_c41_eef5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3095_c41_9a26_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3095_c41_9a26_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3095_c41_9a26_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3095_c41_9a26_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3095_c41_9a26_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3095_c41_9a26_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3097_c41_5087_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3097_c41_5087_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3097_c41_5087_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3097_c41_5087_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3097_c41_5087_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3097_c41_5087_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3098_c41_9eac_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3098_c41_9eac_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3098_c41_9eac_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3098_c41_9eac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3098_c41_9eac_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3100_c41_821e_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3100_c41_821e_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3100_c41_821e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3100_c41_821e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3100_c41_821e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3100_c41_821e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3102_c41_476b_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3102_c41_476b_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3102_c41_476b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3102_c41_476b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3102_c41_476b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3102_c41_476b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3103_c41_0046_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3103_c41_0046_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3103_c41_0046_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3103_c41_0046_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3103_c41_0046_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3103_c41_0046_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3104_c41_5ab9_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3104_c41_5ab9_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3104_c41_5ab9_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3104_c41_5ab9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3104_c41_5ab9_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3105_c41_924c_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3105_c41_924c_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3105_c41_924c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3105_c41_924c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3105_c41_924c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3108_c41_2961_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3108_c41_2961_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3108_c41_2961_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3108_c41_2961_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3108_c41_2961_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3110_c41_0810_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3110_c41_0810_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3110_c41_0810_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3110_c41_0810_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3110_c41_0810_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3111_c41_4e50_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3111_c41_4e50_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3111_c41_4e50_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3111_c41_4e50_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3111_c41_4e50_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3112_c41_717f_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3112_c41_717f_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3112_c41_717f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3112_c41_717f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3112_c41_717f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3113_c41_42f4_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3113_c41_42f4_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3113_c41_42f4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3113_c41_42f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3113_c41_42f4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3114_c41_9911_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3114_c41_9911_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3114_c41_9911_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3114_c41_9911_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3114_c41_9911_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3116_c41_896a_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3116_c41_896a_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3116_c41_896a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3116_c41_896a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3116_c41_896a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l3120_c9_f344_uxn_opcodes_h_l3120_c9_f344_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3120_c9_f344_uxn_opcodes_h_l3120_c9_f344_arg0 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3122_c18_42ac_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3122_c18_42ac_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3122_c18_42ac_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3122_c18_42ac_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3123_c17_7545_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3125_c6_b5be_return_output : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9244_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0571_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9244_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9244_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9244_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9244_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0571_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9244_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9244_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9244_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0571_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0571_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l3129_c4_7590 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0571_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0571_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l3127_c4_af9f : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0571_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0571_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3133_c30_92be_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3133_c30_92be_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3133_c30_92be_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3133_c30_92be_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3133_c19_e1b4_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_left : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3133_c70_d815_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3133_c59_1e84_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_return_output : unsigned(11 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l3134_c2_f4dc : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_left : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3134_c20_0c87_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3134_c20_0c87_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3134_c20_0c87_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3134_c20_0c87_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_return_output : unsigned(12 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_stack_address : unsigned(11 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3139_c3_5f69_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3143_c3_5226_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3145_c3_1997_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3148_c34_f462_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l3149_c30_b7a8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3150_c33_3bee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3151_c34_0ceb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3152_c37_433b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3153_c33_4202_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3155_c32_6310_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3127_l3129_DUPLICATE_f1aa_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3129_l3127_DUPLICATE_4476_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3144_l3154_l3138_DUPLICATE_8d3a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_2565_uxn_opcodes_h_l3157_l3031_DUPLICATE_29ed_return_output : eval_opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_sp0 : unsigned(7 downto 0);
variable REG_VAR_sp1 : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(11 downto 0);
variable REG_VAR_stack_index : unsigned(0 downto 0);
variable REG_VAR_stack_address : unsigned(11 downto 0);
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
  REG_VAR_stack_address := stack_address;
  REG_VAR_stack_read_value := stack_read_value;
  REG_VAR_device_ram_read_value := device_ram_read_value;
  REG_VAR_opc_result := opc_result;
  REG_VAR_opc_eval_result := opc_eval_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_right := to_unsigned(14, 4);
     VAR_MUX_uxn_opcodes_h_l3134_c20_0c87_iftrue := to_unsigned(256, 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_right := to_unsigned(3584, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_right := to_unsigned(38, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_right := to_unsigned(48, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_right := to_unsigned(1024, 11);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_right := to_unsigned(56, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_right := to_unsigned(44, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_right := to_unsigned(31, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_right := to_unsigned(25, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_right := to_unsigned(35, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_right := to_unsigned(23, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_right := to_unsigned(31, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_right := to_unsigned(45, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_right := to_unsigned(11, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_right := to_unsigned(3072, 12);
     VAR_MUX_uxn_opcodes_h_l3122_c18_42ac_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_right := to_unsigned(60, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_right := to_unsigned(41, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_right := to_unsigned(47, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_right := to_unsigned(63, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_right := to_unsigned(29, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_right := to_unsigned(12, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_right := to_unsigned(15, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_right := to_unsigned(20, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_right := to_unsigned(2048, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_right := to_unsigned(46, 6);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_right := to_unsigned(26, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_right := to_unsigned(40, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_right := to_unsigned(24, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3122_c18_42ac_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_right := to_unsigned(34, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_right := to_unsigned(30, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_right := to_unsigned(54, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_right := to_unsigned(58, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_right := to_unsigned(53, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_right := to_unsigned(50, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_right := to_unsigned(512, 10);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_right := to_unsigned(1536, 11);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_right := to_unsigned(59, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_right := to_unsigned(21, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_right := to_unsigned(2560, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_right := to_unsigned(61, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_right := to_unsigned(10, 4);
     VAR_MUX_uxn_opcodes_h_l3134_c20_0c87_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_right := to_unsigned(63, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_right := to_unsigned(57, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_right := to_unsigned(43, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_right := to_unsigned(19, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_right := to_unsigned(51, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_right := to_unsigned(36, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_right := to_unsigned(49, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_right := to_unsigned(62, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_right := to_unsigned(18, 5);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_previous_device_ram_read := device_ram_read_value;
     VAR_dei_uxn_opcodes_h_l3100_c41_821e_previous_device_ram_read := device_ram_read_value;
     VAR_deo2_uxn_opcodes_h_l3103_c41_0046_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l3102_c41_476b_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l3105_c41_924c_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l3104_c41_5ab9_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l3113_c41_42f4_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l3112_c41_717f_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l3100_c41_821e_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l3103_c41_0046_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l3102_c41_476b_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l3111_c41_4e50_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l3110_c41_0810_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l3068_c41_37a0_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l3116_c41_896a_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l3072_c41_024f_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l3076_c41_53cc_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l3059_c41_0023_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l3058_c41_531f_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l3080_c41_658c_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l3084_c41_6801_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l3097_c41_5087_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l3088_c41_d133_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l3079_c41_2992_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l3108_c41_2961_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l3074_c41_9968_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l3062_c41_b331_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l3114_c41_9911_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l3061_c41_e626_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l3060_c41_0878_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l3066_c41_f57e_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l3098_c41_9eac_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l3086_c41_e998_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l3094_c41_eef5_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l3095_c41_9a26_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l3090_c41_43cf_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l3064_c41_68c2_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l3052_c41_4434_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l3080_c41_658c_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l3084_c41_6801_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3054_c41_8597_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3056_c41_34c1_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l3094_c41_eef5_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l3095_c41_9a26_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l3105_c41_924c_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l3104_c41_5ab9_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l3113_c41_42f4_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l3112_c41_717f_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l3100_c41_821e_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l3103_c41_0046_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l3102_c41_476b_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l3111_c41_4e50_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l3110_c41_0810_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l3068_c41_37a0_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l3116_c41_896a_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l3072_c41_024f_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l3076_c41_53cc_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l3059_c41_0023_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l3058_c41_531f_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l3052_c41_4434_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l3080_c41_658c_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l3084_c41_6801_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l3097_c41_5087_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l3088_c41_d133_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3054_c41_8597_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3056_c41_34c1_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l3079_c41_2992_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l3108_c41_2961_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l3074_c41_9968_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l3062_c41_b331_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l3114_c41_9911_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l3061_c41_e626_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l3060_c41_0878_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l3066_c41_f57e_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l3098_c41_9eac_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l3086_c41_e998_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l3094_c41_eef5_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l3095_c41_9a26_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l3090_c41_43cf_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l3064_c41_68c2_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l3052_c41_4434_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l3097_c41_5087_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l3088_c41_d133_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3054_c41_8597_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3056_c41_34c1_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9244_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0571_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9244_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0571_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l3105_c41_924c_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l3104_c41_5ab9_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l3113_c41_42f4_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l3112_c41_717f_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l3100_c41_821e_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l3103_c41_0046_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l3102_c41_476b_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l3111_c41_4e50_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l3110_c41_0810_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l3068_c41_37a0_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l3116_c41_896a_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l3072_c41_024f_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l3076_c41_53cc_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l3059_c41_0023_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l3058_c41_531f_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l3080_c41_658c_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l3084_c41_6801_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l3097_c41_5087_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l3088_c41_d133_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l3079_c41_2992_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l3108_c41_2961_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l3074_c41_9968_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l3062_c41_b331_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l3114_c41_9911_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l3066_c41_f57e_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l3098_c41_9eac_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l3086_c41_e998_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l3094_c41_eef5_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l3095_c41_9a26_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l3090_c41_43cf_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l3064_c41_68c2_previous_stack_read := stack_read_value;
     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l3050_c2_f026] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3050_c2_f026_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l3122_c18_bc93] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_left;
     BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_return_output := BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3045_c10_78dd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_left;
     BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_return_output := BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3045_c41_d67d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_left;
     BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_return_output := BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3045_c57_c337] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3045_c57_c337_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_78dd_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_bc93_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3045_c57_c337_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3050_c2_f026_return_output;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l3045_c30_29dd] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3045_c30_29dd_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_d67d_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l3122_c18_2c3b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_left;
     BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_return_output := BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3045_c10_af9c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_left;
     BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_return_output := BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_return_output;

     -- CONST_SL_4[uxn_opcodes_h_l3045_c57_96b3] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3_x <= VAR_CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3_return_output := CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3045_c10_c11e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_af9c_return_output;
     VAR_MUX_uxn_opcodes_h_l3122_c18_42ac_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_2c3b_return_output;
     VAR_MUX_uxn_opcodes_h_l3045_c10_c11e_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3045_c30_29dd_return_output;
     VAR_MUX_uxn_opcodes_h_l3045_c10_c11e_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l3045_c57_96b3_return_output;
     -- MUX[uxn_opcodes_h_l3122_c18_42ac] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3122_c18_42ac_cond <= VAR_MUX_uxn_opcodes_h_l3122_c18_42ac_cond;
     MUX_uxn_opcodes_h_l3122_c18_42ac_iftrue <= VAR_MUX_uxn_opcodes_h_l3122_c18_42ac_iftrue;
     MUX_uxn_opcodes_h_l3122_c18_42ac_iffalse <= VAR_MUX_uxn_opcodes_h_l3122_c18_42ac_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3122_c18_42ac_return_output := MUX_uxn_opcodes_h_l3122_c18_42ac_return_output;

     -- MUX[uxn_opcodes_h_l3045_c10_c11e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3045_c10_c11e_cond <= VAR_MUX_uxn_opcodes_h_l3045_c10_c11e_cond;
     MUX_uxn_opcodes_h_l3045_c10_c11e_iftrue <= VAR_MUX_uxn_opcodes_h_l3045_c10_c11e_iftrue;
     MUX_uxn_opcodes_h_l3045_c10_c11e_iffalse <= VAR_MUX_uxn_opcodes_h_l3045_c10_c11e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3045_c10_c11e_return_output := MUX_uxn_opcodes_h_l3045_c10_c11e_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l3045_c2_c9fa := VAR_MUX_uxn_opcodes_h_l3045_c10_c11e_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_left := VAR_MUX_uxn_opcodes_h_l3122_c18_42ac_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_left := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l3045_c2_c9fa;
     VAR_printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg1 := resize(VAR_opc_uxn_opcodes_h_l3045_c2_c9fa, 32);
     VAR_printf_uxn_opcodes_h_l3120_c9_f344_uxn_opcodes_h_l3120_c9_f344_arg0 := resize(VAR_opc_uxn_opcodes_h_l3045_c2_c9fa, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l3058_c11_5521] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_left;
     BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_return_output := BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3098_c11_1ca3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3114_c11_35b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3118_c11_60f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3088_c11_46f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_return_output;

     -- printf_uxn_opcodes_h_l3048_c2_9891[uxn_opcodes_h_l3048_c2_9891] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg0 <= VAR_printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg0;
     printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg1 <= VAR_printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg1;
     printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg2 <= VAR_printf_uxn_opcodes_h_l3048_c2_9891_uxn_opcodes_h_l3048_c2_9891_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l3115_c11_f5a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3111_c11_5b1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3057_c11_7f85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_left;
     BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_return_output := BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3117_c11_6978] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_left;
     BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_return_output := BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3094_c11_7b5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3073_c11_c252] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_left;
     BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_return_output := BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3084_c11_1ae9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3066_c11_3c94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_left;
     BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_return_output := BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3064_c11_174e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3053_c11_4fa3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_7fc6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3074_c11_2756] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_left;
     BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_return_output := BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3059_c11_25f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3112_c11_c7f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3071_c11_3b6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3096_c11_aa57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_left;
     BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_return_output := BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3087_c11_0494] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_left;
     BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_return_output := BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3051_c11_9963] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_left;
     BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_return_output := BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3090_c11_0089] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_left;
     BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_return_output := BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3093_c11_1da8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3110_c11_9e07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_left;
     BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_return_output := BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3083_c11_ef66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_left;
     BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_return_output := BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3062_c11_0aa1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3113_c11_84a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3082_c11_9382] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_left;
     BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_return_output := BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3102_c11_a428] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_left;
     BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_return_output := BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3056_c11_6e2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3077_c11_208c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_8221] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_left;
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_return_output := BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3079_c11_d10b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3092_c11_c2b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3072_c11_37ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3061_c11_cd97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_left;
     BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_return_output := BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3097_c11_a9ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3108_c11_6655] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_left;
     BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_return_output := BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3055_c11_c355] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_left;
     BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_return_output := BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3089_c11_457a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3104_c11_4435] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_left;
     BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_return_output := BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3085_c11_b84c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3067_c11_494a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3076_c11_03eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3101_c11_3e1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3106_c11_8df5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3050_c6_6b5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3060_c11_6177] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_left;
     BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_return_output := BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3075_c11_da94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_left;
     BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_return_output := BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_2dee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_left;
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_return_output := BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3116_c11_935c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3080_c11_2184] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_left;
     BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_return_output := BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3105_c11_a200] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_left;
     BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_return_output := BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3065_c11_1606] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_left;
     BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_return_output := BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3086_c11_c2a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3063_c11_e27a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3119_c11_5475] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_left;
     BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_return_output := BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3100_c11_5a31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_left;
     BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_return_output := BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3070_c11_6162] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_left;
     BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_return_output := BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3081_c11_bbd9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3109_c11_4618] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_left;
     BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_return_output := BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3052_c11_b81c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3091_c11_507b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3107_c11_966f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3054_c11_3ebf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_left;
     BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_return_output := BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3069_c11_1280] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_left;
     BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_return_output := BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3078_c11_cd86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_left;
     BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_return_output := BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3068_c11_2830] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_left;
     BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_return_output := BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_6b5d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_9963_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_b81c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_4fa3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_3ebf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_c355_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_6e2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_7f85_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_5521_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_25f0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_6177_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_cd97_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_0aa1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_e27a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_174e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_1606_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3c94_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_494a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_2830_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_1280_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_6162_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3b6f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_37ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_c252_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_2756_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_da94_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_03eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_208c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cd86_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_d10b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_2184_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_bbd9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_9382_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_ef66_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_1ae9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_b84c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_c2a7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_0494_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_46f7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_457a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0089_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_507b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_c2b7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_1da8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_7b5b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_2dee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_aa57_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_a9ff_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_1ca3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_8221_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_5a31_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_3e1d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a428_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_7fc6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_4435_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_a200_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_8df5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_966f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_6655_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_4618_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_9e07_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_5b1b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_c7f8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_84a7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_35b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_f5a3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_935c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_6978_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_60f4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_5475_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3051_c7_6b18] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3052_c7_46a7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3051_c1_5767] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output;
     VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_5767_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3053_c7_6d45] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output;

     -- jci[uxn_opcodes_h_l3051_c41_f3d6] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l3051_c41_f3d6_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l3051_c41_f3d6_phase <= VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_phase;
     jci_uxn_opcodes_h_l3051_c41_f3d6_pc <= VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_pc;
     jci_uxn_opcodes_h_l3051_c41_f3d6_previous_stack_read <= VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_previous_stack_read;
     jci_uxn_opcodes_h_l3051_c41_f3d6_previous_ram_read <= VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_return_output := jci_uxn_opcodes_h_l3051_c41_f3d6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3052_c1_5431] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output;
     VAR_jmi_uxn_opcodes_h_l3052_c41_4434_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_5431_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_iftrue := VAR_jci_uxn_opcodes_h_l3051_c41_f3d6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3054_c7_97ce] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output;

     -- jmi[uxn_opcodes_h_l3052_c41_4434] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l3052_c41_4434_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l3052_c41_4434_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l3052_c41_4434_phase <= VAR_jmi_uxn_opcodes_h_l3052_c41_4434_phase;
     jmi_uxn_opcodes_h_l3052_c41_4434_pc <= VAR_jmi_uxn_opcodes_h_l3052_c41_4434_pc;
     jmi_uxn_opcodes_h_l3052_c41_4434_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l3052_c41_4434_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l3052_c41_4434_return_output := jmi_uxn_opcodes_h_l3052_c41_4434_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3053_c1_7ca9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output;
     VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_7ca9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_iftrue := VAR_jmi_uxn_opcodes_h_l3052_c41_4434_return_output;
     -- jsi[uxn_opcodes_h_l3053_c41_0f46] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l3053_c41_0f46_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l3053_c41_0f46_phase <= VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_phase;
     jsi_uxn_opcodes_h_l3053_c41_0f46_pc <= VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_pc;
     jsi_uxn_opcodes_h_l3053_c41_0f46_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_return_output := jsi_uxn_opcodes_h_l3053_c41_0f46_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3054_c1_04f6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3055_c7_0abb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output;
     VAR_lit_uxn_opcodes_h_l3054_c41_8597_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_04f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_iftrue := VAR_jsi_uxn_opcodes_h_l3053_c41_0f46_return_output;
     -- lit[uxn_opcodes_h_l3054_c41_8597] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3054_c41_8597_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3054_c41_8597_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3054_c41_8597_phase <= VAR_lit_uxn_opcodes_h_l3054_c41_8597_phase;
     lit_uxn_opcodes_h_l3054_c41_8597_pc <= VAR_lit_uxn_opcodes_h_l3054_c41_8597_pc;
     lit_uxn_opcodes_h_l3054_c41_8597_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3054_c41_8597_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3054_c41_8597_return_output := lit_uxn_opcodes_h_l3054_c41_8597_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3056_c7_7dd2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3055_c1_dc57] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output;
     VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_dc57_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_iftrue := VAR_lit_uxn_opcodes_h_l3054_c41_8597_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3056_c1_5041] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_return_output;

     -- lit2[uxn_opcodes_h_l3055_c41_d6e8] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3055_c41_d6e8_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3055_c41_d6e8_phase <= VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_phase;
     lit2_uxn_opcodes_h_l3055_c41_d6e8_pc <= VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_pc;
     lit2_uxn_opcodes_h_l3055_c41_d6e8_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_return_output := lit2_uxn_opcodes_h_l3055_c41_d6e8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c7_6b0e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output;
     VAR_lit_uxn_opcodes_h_l3056_c41_34c1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_5041_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_iftrue := VAR_lit2_uxn_opcodes_h_l3055_c41_d6e8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c7_9aaf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output;

     -- lit[uxn_opcodes_h_l3056_c41_34c1] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3056_c41_34c1_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3056_c41_34c1_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3056_c41_34c1_phase <= VAR_lit_uxn_opcodes_h_l3056_c41_34c1_phase;
     lit_uxn_opcodes_h_l3056_c41_34c1_pc <= VAR_lit_uxn_opcodes_h_l3056_c41_34c1_pc;
     lit_uxn_opcodes_h_l3056_c41_34c1_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3056_c41_34c1_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3056_c41_34c1_return_output := lit_uxn_opcodes_h_l3056_c41_34c1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c1_47ac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output;
     VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_47ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_iftrue := VAR_lit_uxn_opcodes_h_l3056_c41_34c1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c7_7f00] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output;

     -- lit2[uxn_opcodes_h_l3057_c41_f74d] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3057_c41_f74d_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3057_c41_f74d_phase <= VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_phase;
     lit2_uxn_opcodes_h_l3057_c41_f74d_pc <= VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_pc;
     lit2_uxn_opcodes_h_l3057_c41_f74d_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_return_output := lit2_uxn_opcodes_h_l3057_c41_f74d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c1_1ee3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output;
     VAR_inc_uxn_opcodes_h_l3058_c41_531f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_1ee3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_iftrue := VAR_lit2_uxn_opcodes_h_l3057_c41_f74d_return_output;
     -- inc[uxn_opcodes_h_l3058_c41_531f] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l3058_c41_531f_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l3058_c41_531f_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l3058_c41_531f_phase <= VAR_inc_uxn_opcodes_h_l3058_c41_531f_phase;
     inc_uxn_opcodes_h_l3058_c41_531f_ins <= VAR_inc_uxn_opcodes_h_l3058_c41_531f_ins;
     inc_uxn_opcodes_h_l3058_c41_531f_previous_stack_read <= VAR_inc_uxn_opcodes_h_l3058_c41_531f_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l3058_c41_531f_return_output := inc_uxn_opcodes_h_l3058_c41_531f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c1_da24] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c7_66f7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output;
     VAR_inc2_uxn_opcodes_h_l3059_c41_0023_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_da24_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_iftrue := VAR_inc_uxn_opcodes_h_l3058_c41_531f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c7_b811] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_return_output;

     -- inc2[uxn_opcodes_h_l3059_c41_0023] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l3059_c41_0023_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l3059_c41_0023_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l3059_c41_0023_phase <= VAR_inc2_uxn_opcodes_h_l3059_c41_0023_phase;
     inc2_uxn_opcodes_h_l3059_c41_0023_ins <= VAR_inc2_uxn_opcodes_h_l3059_c41_0023_ins;
     inc2_uxn_opcodes_h_l3059_c41_0023_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l3059_c41_0023_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l3059_c41_0023_return_output := inc2_uxn_opcodes_h_l3059_c41_0023_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c1_87b2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_b811_return_output;
     VAR_pop_uxn_opcodes_h_l3060_c41_0878_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_87b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_iftrue := VAR_inc2_uxn_opcodes_h_l3059_c41_0023_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c7_190c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_return_output;

     -- pop[uxn_opcodes_h_l3060_c41_0878] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l3060_c41_0878_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l3060_c41_0878_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l3060_c41_0878_phase <= VAR_pop_uxn_opcodes_h_l3060_c41_0878_phase;
     pop_uxn_opcodes_h_l3060_c41_0878_ins <= VAR_pop_uxn_opcodes_h_l3060_c41_0878_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l3060_c41_0878_return_output := pop_uxn_opcodes_h_l3060_c41_0878_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c1_329a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_190c_return_output;
     VAR_pop2_uxn_opcodes_h_l3061_c41_e626_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_329a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_iftrue := VAR_pop_uxn_opcodes_h_l3060_c41_0878_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c1_8356] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c7_ab5b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output;

     -- pop2[uxn_opcodes_h_l3061_c41_e626] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l3061_c41_e626_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l3061_c41_e626_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l3061_c41_e626_phase <= VAR_pop2_uxn_opcodes_h_l3061_c41_e626_phase;
     pop2_uxn_opcodes_h_l3061_c41_e626_ins <= VAR_pop2_uxn_opcodes_h_l3061_c41_e626_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l3061_c41_e626_return_output := pop2_uxn_opcodes_h_l3061_c41_e626_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output;
     VAR_nip_uxn_opcodes_h_l3062_c41_b331_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_8356_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_iftrue := VAR_pop2_uxn_opcodes_h_l3061_c41_e626_return_output;
     -- nip[uxn_opcodes_h_l3062_c41_b331] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l3062_c41_b331_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l3062_c41_b331_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l3062_c41_b331_phase <= VAR_nip_uxn_opcodes_h_l3062_c41_b331_phase;
     nip_uxn_opcodes_h_l3062_c41_b331_ins <= VAR_nip_uxn_opcodes_h_l3062_c41_b331_ins;
     nip_uxn_opcodes_h_l3062_c41_b331_previous_stack_read <= VAR_nip_uxn_opcodes_h_l3062_c41_b331_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l3062_c41_b331_return_output := nip_uxn_opcodes_h_l3062_c41_b331_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c7_24e3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c1_7dc9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output;
     VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_7dc9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_iftrue := VAR_nip_uxn_opcodes_h_l3062_c41_b331_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c1_dc43] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_return_output;

     -- nip2[uxn_opcodes_h_l3063_c41_64cf] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l3063_c41_64cf_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l3063_c41_64cf_phase <= VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_phase;
     nip2_uxn_opcodes_h_l3063_c41_64cf_ins <= VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_ins;
     nip2_uxn_opcodes_h_l3063_c41_64cf_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_return_output := nip2_uxn_opcodes_h_l3063_c41_64cf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c7_a153] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_a153_return_output;
     VAR_swp_uxn_opcodes_h_l3064_c41_68c2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_dc43_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_iftrue := VAR_nip2_uxn_opcodes_h_l3063_c41_64cf_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c1_676e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c7_43fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output;

     -- swp[uxn_opcodes_h_l3064_c41_68c2] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l3064_c41_68c2_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l3064_c41_68c2_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l3064_c41_68c2_phase <= VAR_swp_uxn_opcodes_h_l3064_c41_68c2_phase;
     swp_uxn_opcodes_h_l3064_c41_68c2_ins <= VAR_swp_uxn_opcodes_h_l3064_c41_68c2_ins;
     swp_uxn_opcodes_h_l3064_c41_68c2_previous_stack_read <= VAR_swp_uxn_opcodes_h_l3064_c41_68c2_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l3064_c41_68c2_return_output := swp_uxn_opcodes_h_l3064_c41_68c2_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output;
     VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_676e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_iftrue := VAR_swp_uxn_opcodes_h_l3064_c41_68c2_return_output;
     -- swp2[uxn_opcodes_h_l3065_c41_25d7] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l3065_c41_25d7_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l3065_c41_25d7_phase <= VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_phase;
     swp2_uxn_opcodes_h_l3065_c41_25d7_ins <= VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_ins;
     swp2_uxn_opcodes_h_l3065_c41_25d7_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_return_output := swp2_uxn_opcodes_h_l3065_c41_25d7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c1_ee37] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c7_bfba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output;
     VAR_rot_uxn_opcodes_h_l3066_c41_f57e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_ee37_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_iftrue := VAR_swp2_uxn_opcodes_h_l3065_c41_25d7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c7_26d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output;

     -- rot[uxn_opcodes_h_l3066_c41_f57e] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l3066_c41_f57e_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l3066_c41_f57e_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l3066_c41_f57e_phase <= VAR_rot_uxn_opcodes_h_l3066_c41_f57e_phase;
     rot_uxn_opcodes_h_l3066_c41_f57e_ins <= VAR_rot_uxn_opcodes_h_l3066_c41_f57e_ins;
     rot_uxn_opcodes_h_l3066_c41_f57e_previous_stack_read <= VAR_rot_uxn_opcodes_h_l3066_c41_f57e_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l3066_c41_f57e_return_output := rot_uxn_opcodes_h_l3066_c41_f57e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c1_a067] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output;
     VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_a067_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_iftrue := VAR_rot_uxn_opcodes_h_l3066_c41_f57e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c7_e0dc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c1_a6b4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_return_output;

     -- rot2[uxn_opcodes_h_l3067_c41_bf62] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l3067_c41_bf62_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l3067_c41_bf62_phase <= VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_phase;
     rot2_uxn_opcodes_h_l3067_c41_bf62_ins <= VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_ins;
     rot2_uxn_opcodes_h_l3067_c41_bf62_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_return_output := rot2_uxn_opcodes_h_l3067_c41_bf62_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output;
     VAR_dup_uxn_opcodes_h_l3068_c41_37a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_a6b4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_iftrue := VAR_rot2_uxn_opcodes_h_l3067_c41_bf62_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c1_3a48] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c7_eaa3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output;

     -- dup[uxn_opcodes_h_l3068_c41_37a0] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l3068_c41_37a0_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l3068_c41_37a0_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l3068_c41_37a0_phase <= VAR_dup_uxn_opcodes_h_l3068_c41_37a0_phase;
     dup_uxn_opcodes_h_l3068_c41_37a0_ins <= VAR_dup_uxn_opcodes_h_l3068_c41_37a0_ins;
     dup_uxn_opcodes_h_l3068_c41_37a0_previous_stack_read <= VAR_dup_uxn_opcodes_h_l3068_c41_37a0_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l3068_c41_37a0_return_output := dup_uxn_opcodes_h_l3068_c41_37a0_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output;
     VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_3a48_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_iftrue := VAR_dup_uxn_opcodes_h_l3068_c41_37a0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c1_45c4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_return_output;

     -- dup2[uxn_opcodes_h_l3069_c41_4d95] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l3069_c41_4d95_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l3069_c41_4d95_phase <= VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_phase;
     dup2_uxn_opcodes_h_l3069_c41_4d95_ins <= VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_ins;
     dup2_uxn_opcodes_h_l3069_c41_4d95_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_return_output := dup2_uxn_opcodes_h_l3069_c41_4d95_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c7_37ba] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output;
     VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_45c4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_iftrue := VAR_dup2_uxn_opcodes_h_l3069_c41_4d95_return_output;
     -- ovr[uxn_opcodes_h_l3070_c41_1f1d] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l3070_c41_1f1d_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l3070_c41_1f1d_phase <= VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_phase;
     ovr_uxn_opcodes_h_l3070_c41_1f1d_ins <= VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_ins;
     ovr_uxn_opcodes_h_l3070_c41_1f1d_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_return_output := ovr_uxn_opcodes_h_l3070_c41_1f1d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c7_5b4c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c1_a6e3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output;
     VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_a6e3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_iftrue := VAR_ovr_uxn_opcodes_h_l3070_c41_1f1d_return_output;
     -- ovr2[uxn_opcodes_h_l3071_c41_2ee6] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l3071_c41_2ee6_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l3071_c41_2ee6_phase <= VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_phase;
     ovr2_uxn_opcodes_h_l3071_c41_2ee6_ins <= VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_ins;
     ovr2_uxn_opcodes_h_l3071_c41_2ee6_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_return_output := ovr2_uxn_opcodes_h_l3071_c41_2ee6_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c7_5906] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c1_93aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_5906_return_output;
     VAR_equ_uxn_opcodes_h_l3072_c41_024f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_93aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_iftrue := VAR_ovr2_uxn_opcodes_h_l3071_c41_2ee6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c7_8bfa] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output;

     -- equ[uxn_opcodes_h_l3072_c41_024f] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l3072_c41_024f_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l3072_c41_024f_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l3072_c41_024f_phase <= VAR_equ_uxn_opcodes_h_l3072_c41_024f_phase;
     equ_uxn_opcodes_h_l3072_c41_024f_ins <= VAR_equ_uxn_opcodes_h_l3072_c41_024f_ins;
     equ_uxn_opcodes_h_l3072_c41_024f_previous_stack_read <= VAR_equ_uxn_opcodes_h_l3072_c41_024f_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l3072_c41_024f_return_output := equ_uxn_opcodes_h_l3072_c41_024f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c1_0939] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output;
     VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_0939_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_iftrue := VAR_equ_uxn_opcodes_h_l3072_c41_024f_return_output;
     -- equ2[uxn_opcodes_h_l3073_c41_1ae4] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l3073_c41_1ae4_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l3073_c41_1ae4_phase <= VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_phase;
     equ2_uxn_opcodes_h_l3073_c41_1ae4_ins <= VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_ins;
     equ2_uxn_opcodes_h_l3073_c41_1ae4_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_return_output := equ2_uxn_opcodes_h_l3073_c41_1ae4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c7_0581] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c1_9a00] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_0581_return_output;
     VAR_neq_uxn_opcodes_h_l3074_c41_9968_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_9a00_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_iftrue := VAR_equ2_uxn_opcodes_h_l3073_c41_1ae4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c7_63b5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output;

     -- neq[uxn_opcodes_h_l3074_c41_9968] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l3074_c41_9968_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l3074_c41_9968_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l3074_c41_9968_phase <= VAR_neq_uxn_opcodes_h_l3074_c41_9968_phase;
     neq_uxn_opcodes_h_l3074_c41_9968_ins <= VAR_neq_uxn_opcodes_h_l3074_c41_9968_ins;
     neq_uxn_opcodes_h_l3074_c41_9968_previous_stack_read <= VAR_neq_uxn_opcodes_h_l3074_c41_9968_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l3074_c41_9968_return_output := neq_uxn_opcodes_h_l3074_c41_9968_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c1_92e5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output;
     VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_92e5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_iftrue := VAR_neq_uxn_opcodes_h_l3074_c41_9968_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c1_535b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_return_output;

     -- neq2[uxn_opcodes_h_l3075_c41_48b8] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l3075_c41_48b8_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l3075_c41_48b8_phase <= VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_phase;
     neq2_uxn_opcodes_h_l3075_c41_48b8_ins <= VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_ins;
     neq2_uxn_opcodes_h_l3075_c41_48b8_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_return_output := neq2_uxn_opcodes_h_l3075_c41_48b8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c7_0183] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0183_return_output;
     VAR_gth_uxn_opcodes_h_l3076_c41_53cc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_535b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_iftrue := VAR_neq2_uxn_opcodes_h_l3075_c41_48b8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c7_0809] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c1_5e47] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_return_output;

     -- gth[uxn_opcodes_h_l3076_c41_53cc] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l3076_c41_53cc_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l3076_c41_53cc_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l3076_c41_53cc_phase <= VAR_gth_uxn_opcodes_h_l3076_c41_53cc_phase;
     gth_uxn_opcodes_h_l3076_c41_53cc_ins <= VAR_gth_uxn_opcodes_h_l3076_c41_53cc_ins;
     gth_uxn_opcodes_h_l3076_c41_53cc_previous_stack_read <= VAR_gth_uxn_opcodes_h_l3076_c41_53cc_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l3076_c41_53cc_return_output := gth_uxn_opcodes_h_l3076_c41_53cc_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_0809_return_output;
     VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_5e47_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_iftrue := VAR_gth_uxn_opcodes_h_l3076_c41_53cc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c7_26ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output;

     -- gth2[uxn_opcodes_h_l3077_c41_a4de] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l3077_c41_a4de_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l3077_c41_a4de_phase <= VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_phase;
     gth2_uxn_opcodes_h_l3077_c41_a4de_ins <= VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_ins;
     gth2_uxn_opcodes_h_l3077_c41_a4de_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_return_output := gth2_uxn_opcodes_h_l3077_c41_a4de_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c1_582e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output;
     VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_582e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_iftrue := VAR_gth2_uxn_opcodes_h_l3077_c41_a4de_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c1_496f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c7_58cf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output;

     -- lth[uxn_opcodes_h_l3078_c41_3fe7] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l3078_c41_3fe7_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l3078_c41_3fe7_phase <= VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_phase;
     lth_uxn_opcodes_h_l3078_c41_3fe7_ins <= VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_ins;
     lth_uxn_opcodes_h_l3078_c41_3fe7_previous_stack_read <= VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_return_output := lth_uxn_opcodes_h_l3078_c41_3fe7_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output;
     VAR_lth2_uxn_opcodes_h_l3079_c41_2992_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_496f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_iftrue := VAR_lth_uxn_opcodes_h_l3078_c41_3fe7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c1_aacc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c7_118f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_return_output;

     -- lth2[uxn_opcodes_h_l3079_c41_2992] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l3079_c41_2992_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l3079_c41_2992_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l3079_c41_2992_phase <= VAR_lth2_uxn_opcodes_h_l3079_c41_2992_phase;
     lth2_uxn_opcodes_h_l3079_c41_2992_ins <= VAR_lth2_uxn_opcodes_h_l3079_c41_2992_ins;
     lth2_uxn_opcodes_h_l3079_c41_2992_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l3079_c41_2992_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l3079_c41_2992_return_output := lth2_uxn_opcodes_h_l3079_c41_2992_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_118f_return_output;
     VAR_jmp_uxn_opcodes_h_l3080_c41_658c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_aacc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_iftrue := VAR_lth2_uxn_opcodes_h_l3079_c41_2992_return_output;
     -- jmp[uxn_opcodes_h_l3080_c41_658c] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l3080_c41_658c_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l3080_c41_658c_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l3080_c41_658c_phase <= VAR_jmp_uxn_opcodes_h_l3080_c41_658c_phase;
     jmp_uxn_opcodes_h_l3080_c41_658c_ins <= VAR_jmp_uxn_opcodes_h_l3080_c41_658c_ins;
     jmp_uxn_opcodes_h_l3080_c41_658c_pc <= VAR_jmp_uxn_opcodes_h_l3080_c41_658c_pc;
     jmp_uxn_opcodes_h_l3080_c41_658c_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l3080_c41_658c_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l3080_c41_658c_return_output := jmp_uxn_opcodes_h_l3080_c41_658c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c7_c39a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c1_0ade] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output;
     VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_0ade_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_iftrue := VAR_jmp_uxn_opcodes_h_l3080_c41_658c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c1_453d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_return_output;

     -- jmp2[uxn_opcodes_h_l3081_c41_0056] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l3081_c41_0056_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l3081_c41_0056_phase <= VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_phase;
     jmp2_uxn_opcodes_h_l3081_c41_0056_ins <= VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_ins;
     jmp2_uxn_opcodes_h_l3081_c41_0056_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_return_output := jmp2_uxn_opcodes_h_l3081_c41_0056_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c7_dd4f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output;
     VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_453d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_iftrue := VAR_jmp2_uxn_opcodes_h_l3081_c41_0056_return_output;
     -- jcn[uxn_opcodes_h_l3082_c41_32eb] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l3082_c41_32eb_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l3082_c41_32eb_phase <= VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_phase;
     jcn_uxn_opcodes_h_l3082_c41_32eb_ins <= VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_ins;
     jcn_uxn_opcodes_h_l3082_c41_32eb_pc <= VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_pc;
     jcn_uxn_opcodes_h_l3082_c41_32eb_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_return_output := jcn_uxn_opcodes_h_l3082_c41_32eb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c1_1b97] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c7_4724] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_4724_return_output;
     VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_1b97_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_iftrue := VAR_jcn_uxn_opcodes_h_l3082_c41_32eb_return_output;
     -- jcn2[uxn_opcodes_h_l3083_c41_486f] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l3083_c41_486f_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l3083_c41_486f_phase <= VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_phase;
     jcn2_uxn_opcodes_h_l3083_c41_486f_ins <= VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_ins;
     jcn2_uxn_opcodes_h_l3083_c41_486f_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_return_output := jcn2_uxn_opcodes_h_l3083_c41_486f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c1_95fe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c7_cb96] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output;
     VAR_jsr_uxn_opcodes_h_l3084_c41_6801_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_95fe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_iftrue := VAR_jcn2_uxn_opcodes_h_l3083_c41_486f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c7_89d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c1_f9c5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_return_output;

     -- jsr[uxn_opcodes_h_l3084_c41_6801] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l3084_c41_6801_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l3084_c41_6801_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l3084_c41_6801_phase <= VAR_jsr_uxn_opcodes_h_l3084_c41_6801_phase;
     jsr_uxn_opcodes_h_l3084_c41_6801_ins <= VAR_jsr_uxn_opcodes_h_l3084_c41_6801_ins;
     jsr_uxn_opcodes_h_l3084_c41_6801_pc <= VAR_jsr_uxn_opcodes_h_l3084_c41_6801_pc;
     jsr_uxn_opcodes_h_l3084_c41_6801_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l3084_c41_6801_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l3084_c41_6801_return_output := jsr_uxn_opcodes_h_l3084_c41_6801_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output;
     VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_f9c5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_iftrue := VAR_jsr_uxn_opcodes_h_l3084_c41_6801_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c7_9377] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_return_output;

     -- jsr2[uxn_opcodes_h_l3085_c41_5485] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l3085_c41_5485_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l3085_c41_5485_phase <= VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_phase;
     jsr2_uxn_opcodes_h_l3085_c41_5485_ins <= VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_ins;
     jsr2_uxn_opcodes_h_l3085_c41_5485_pc <= VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_pc;
     jsr2_uxn_opcodes_h_l3085_c41_5485_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_return_output := jsr2_uxn_opcodes_h_l3085_c41_5485_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c1_26d8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9377_return_output;
     VAR_sth_uxn_opcodes_h_l3086_c41_e998_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_26d8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_iftrue := VAR_jsr2_uxn_opcodes_h_l3085_c41_5485_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c7_3d12] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output;

     -- sth[uxn_opcodes_h_l3086_c41_e998] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l3086_c41_e998_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l3086_c41_e998_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l3086_c41_e998_phase <= VAR_sth_uxn_opcodes_h_l3086_c41_e998_phase;
     sth_uxn_opcodes_h_l3086_c41_e998_ins <= VAR_sth_uxn_opcodes_h_l3086_c41_e998_ins;
     sth_uxn_opcodes_h_l3086_c41_e998_previous_stack_read <= VAR_sth_uxn_opcodes_h_l3086_c41_e998_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l3086_c41_e998_return_output := sth_uxn_opcodes_h_l3086_c41_e998_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c1_cd80] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output;
     VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_cd80_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_iftrue := VAR_sth_uxn_opcodes_h_l3086_c41_e998_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c1_9ab9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c7_4ac3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output;

     -- sth2[uxn_opcodes_h_l3087_c41_fa07] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l3087_c41_fa07_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l3087_c41_fa07_phase <= VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_phase;
     sth2_uxn_opcodes_h_l3087_c41_fa07_ins <= VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_ins;
     sth2_uxn_opcodes_h_l3087_c41_fa07_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_return_output := sth2_uxn_opcodes_h_l3087_c41_fa07_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output;
     VAR_ldz_uxn_opcodes_h_l3088_c41_d133_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_9ab9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_iftrue := VAR_sth2_uxn_opcodes_h_l3087_c41_fa07_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c1_e7b8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c7_d89d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output;

     -- ldz[uxn_opcodes_h_l3088_c41_d133] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l3088_c41_d133_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l3088_c41_d133_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l3088_c41_d133_phase <= VAR_ldz_uxn_opcodes_h_l3088_c41_d133_phase;
     ldz_uxn_opcodes_h_l3088_c41_d133_ins <= VAR_ldz_uxn_opcodes_h_l3088_c41_d133_ins;
     ldz_uxn_opcodes_h_l3088_c41_d133_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l3088_c41_d133_previous_stack_read;
     ldz_uxn_opcodes_h_l3088_c41_d133_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l3088_c41_d133_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l3088_c41_d133_return_output := ldz_uxn_opcodes_h_l3088_c41_d133_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output;
     VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_e7b8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_iftrue := VAR_ldz_uxn_opcodes_h_l3088_c41_d133_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c7_d733] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c1_9792] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_return_output;

     -- ldz2[uxn_opcodes_h_l3089_c41_1a27] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l3089_c41_1a27_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l3089_c41_1a27_phase <= VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_phase;
     ldz2_uxn_opcodes_h_l3089_c41_1a27_ins <= VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_ins;
     ldz2_uxn_opcodes_h_l3089_c41_1a27_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_previous_stack_read;
     ldz2_uxn_opcodes_h_l3089_c41_1a27_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_return_output := ldz2_uxn_opcodes_h_l3089_c41_1a27_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_d733_return_output;
     VAR_stz_uxn_opcodes_h_l3090_c41_43cf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_9792_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_iftrue := VAR_ldz2_uxn_opcodes_h_l3089_c41_1a27_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c7_0b73] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c1_a703] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_return_output;

     -- stz[uxn_opcodes_h_l3090_c41_43cf] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l3090_c41_43cf_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l3090_c41_43cf_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l3090_c41_43cf_phase <= VAR_stz_uxn_opcodes_h_l3090_c41_43cf_phase;
     stz_uxn_opcodes_h_l3090_c41_43cf_ins <= VAR_stz_uxn_opcodes_h_l3090_c41_43cf_ins;
     stz_uxn_opcodes_h_l3090_c41_43cf_previous_stack_read <= VAR_stz_uxn_opcodes_h_l3090_c41_43cf_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l3090_c41_43cf_return_output := stz_uxn_opcodes_h_l3090_c41_43cf_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output;
     VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_a703_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_iftrue := VAR_stz_uxn_opcodes_h_l3090_c41_43cf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c7_716c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_return_output;

     -- stz2[uxn_opcodes_h_l3091_c41_cc53] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l3091_c41_cc53_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l3091_c41_cc53_phase <= VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_phase;
     stz2_uxn_opcodes_h_l3091_c41_cc53_ins <= VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_ins;
     stz2_uxn_opcodes_h_l3091_c41_cc53_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_return_output := stz2_uxn_opcodes_h_l3091_c41_cc53_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c1_c6ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_716c_return_output;
     VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_c6ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_iftrue := VAR_stz2_uxn_opcodes_h_l3091_c41_cc53_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c1_2d3c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c7_8ac5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output;

     -- ldr[uxn_opcodes_h_l3092_c41_a7b7] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l3092_c41_a7b7_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l3092_c41_a7b7_phase <= VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_phase;
     ldr_uxn_opcodes_h_l3092_c41_a7b7_ins <= VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_ins;
     ldr_uxn_opcodes_h_l3092_c41_a7b7_pc <= VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_pc;
     ldr_uxn_opcodes_h_l3092_c41_a7b7_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_previous_stack_read;
     ldr_uxn_opcodes_h_l3092_c41_a7b7_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_return_output := ldr_uxn_opcodes_h_l3092_c41_a7b7_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output;
     VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_2d3c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_iftrue := VAR_ldr_uxn_opcodes_h_l3092_c41_a7b7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c7_9b70] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output;

     -- ldr2[uxn_opcodes_h_l3093_c41_c8e3] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l3093_c41_c8e3_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l3093_c41_c8e3_phase <= VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_phase;
     ldr2_uxn_opcodes_h_l3093_c41_c8e3_ins <= VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_ins;
     ldr2_uxn_opcodes_h_l3093_c41_c8e3_pc <= VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_pc;
     ldr2_uxn_opcodes_h_l3093_c41_c8e3_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_previous_stack_read;
     ldr2_uxn_opcodes_h_l3093_c41_c8e3_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_return_output := ldr2_uxn_opcodes_h_l3093_c41_c8e3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c1_c5f8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output;
     VAR_str1_uxn_opcodes_h_l3094_c41_eef5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_c5f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_iftrue := VAR_ldr2_uxn_opcodes_h_l3093_c41_c8e3_return_output;
     -- str1[uxn_opcodes_h_l3094_c41_eef5] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l3094_c41_eef5_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l3094_c41_eef5_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l3094_c41_eef5_phase <= VAR_str1_uxn_opcodes_h_l3094_c41_eef5_phase;
     str1_uxn_opcodes_h_l3094_c41_eef5_ins <= VAR_str1_uxn_opcodes_h_l3094_c41_eef5_ins;
     str1_uxn_opcodes_h_l3094_c41_eef5_pc <= VAR_str1_uxn_opcodes_h_l3094_c41_eef5_pc;
     str1_uxn_opcodes_h_l3094_c41_eef5_previous_stack_read <= VAR_str1_uxn_opcodes_h_l3094_c41_eef5_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l3094_c41_eef5_return_output := str1_uxn_opcodes_h_l3094_c41_eef5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c1_42ca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c7_92ee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output;
     VAR_str2_uxn_opcodes_h_l3095_c41_9a26_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_42ca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_iftrue := VAR_str1_uxn_opcodes_h_l3094_c41_eef5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c7_7132] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_return_output;

     -- str2[uxn_opcodes_h_l3095_c41_9a26] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l3095_c41_9a26_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l3095_c41_9a26_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l3095_c41_9a26_phase <= VAR_str2_uxn_opcodes_h_l3095_c41_9a26_phase;
     str2_uxn_opcodes_h_l3095_c41_9a26_ins <= VAR_str2_uxn_opcodes_h_l3095_c41_9a26_ins;
     str2_uxn_opcodes_h_l3095_c41_9a26_pc <= VAR_str2_uxn_opcodes_h_l3095_c41_9a26_pc;
     str2_uxn_opcodes_h_l3095_c41_9a26_previous_stack_read <= VAR_str2_uxn_opcodes_h_l3095_c41_9a26_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l3095_c41_9a26_return_output := str2_uxn_opcodes_h_l3095_c41_9a26_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c1_8af5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_7132_return_output;
     VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_8af5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_iftrue := VAR_str2_uxn_opcodes_h_l3095_c41_9a26_return_output;
     -- lda[uxn_opcodes_h_l3096_c41_7d8d] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l3096_c41_7d8d_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l3096_c41_7d8d_phase <= VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_phase;
     lda_uxn_opcodes_h_l3096_c41_7d8d_ins <= VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_ins;
     lda_uxn_opcodes_h_l3096_c41_7d8d_previous_stack_read <= VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_previous_stack_read;
     lda_uxn_opcodes_h_l3096_c41_7d8d_previous_ram_read <= VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_return_output := lda_uxn_opcodes_h_l3096_c41_7d8d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c1_45ed] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c7_9389] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9389_return_output;
     VAR_lda2_uxn_opcodes_h_l3097_c41_5087_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_45ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_iftrue := VAR_lda_uxn_opcodes_h_l3096_c41_7d8d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c1_b5a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_return_output;

     -- lda2[uxn_opcodes_h_l3097_c41_5087] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l3097_c41_5087_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l3097_c41_5087_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l3097_c41_5087_phase <= VAR_lda2_uxn_opcodes_h_l3097_c41_5087_phase;
     lda2_uxn_opcodes_h_l3097_c41_5087_ins <= VAR_lda2_uxn_opcodes_h_l3097_c41_5087_ins;
     lda2_uxn_opcodes_h_l3097_c41_5087_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l3097_c41_5087_previous_stack_read;
     lda2_uxn_opcodes_h_l3097_c41_5087_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l3097_c41_5087_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l3097_c41_5087_return_output := lda2_uxn_opcodes_h_l3097_c41_5087_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c7_1a07] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output;
     VAR_sta_uxn_opcodes_h_l3098_c41_9eac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_b5a2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_iftrue := VAR_lda2_uxn_opcodes_h_l3097_c41_5087_return_output;
     -- sta[uxn_opcodes_h_l3098_c41_9eac] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l3098_c41_9eac_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l3098_c41_9eac_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l3098_c41_9eac_phase <= VAR_sta_uxn_opcodes_h_l3098_c41_9eac_phase;
     sta_uxn_opcodes_h_l3098_c41_9eac_ins <= VAR_sta_uxn_opcodes_h_l3098_c41_9eac_ins;
     sta_uxn_opcodes_h_l3098_c41_9eac_previous_stack_read <= VAR_sta_uxn_opcodes_h_l3098_c41_9eac_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l3098_c41_9eac_return_output := sta_uxn_opcodes_h_l3098_c41_9eac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c1_a0ad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c7_4855] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_4855_return_output;
     VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_a0ad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_iftrue := VAR_sta_uxn_opcodes_h_l3098_c41_9eac_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c7_f371] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_return_output;

     -- sta2[uxn_opcodes_h_l3099_c41_beb5] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l3099_c41_beb5_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l3099_c41_beb5_phase <= VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_phase;
     sta2_uxn_opcodes_h_l3099_c41_beb5_ins <= VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_ins;
     sta2_uxn_opcodes_h_l3099_c41_beb5_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_return_output := sta2_uxn_opcodes_h_l3099_c41_beb5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c1_acef] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_f371_return_output;
     VAR_dei_uxn_opcodes_h_l3100_c41_821e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_acef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_iftrue := VAR_sta2_uxn_opcodes_h_l3099_c41_beb5_return_output;
     -- dei[uxn_opcodes_h_l3100_c41_821e] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l3100_c41_821e_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l3100_c41_821e_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l3100_c41_821e_phase <= VAR_dei_uxn_opcodes_h_l3100_c41_821e_phase;
     dei_uxn_opcodes_h_l3100_c41_821e_ins <= VAR_dei_uxn_opcodes_h_l3100_c41_821e_ins;
     dei_uxn_opcodes_h_l3100_c41_821e_previous_stack_read <= VAR_dei_uxn_opcodes_h_l3100_c41_821e_previous_stack_read;
     dei_uxn_opcodes_h_l3100_c41_821e_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l3100_c41_821e_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l3100_c41_821e_return_output := dei_uxn_opcodes_h_l3100_c41_821e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c1_1a30] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c7_1df3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output;
     VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_1a30_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_iftrue := VAR_dei_uxn_opcodes_h_l3100_c41_821e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c7_233e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c1_ab13] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_return_output;

     -- dei2[uxn_opcodes_h_l3101_c41_49bf] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l3101_c41_49bf_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l3101_c41_49bf_phase <= VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_phase;
     dei2_uxn_opcodes_h_l3101_c41_49bf_ins <= VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_ins;
     dei2_uxn_opcodes_h_l3101_c41_49bf_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_previous_stack_read;
     dei2_uxn_opcodes_h_l3101_c41_49bf_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_return_output := dei2_uxn_opcodes_h_l3101_c41_49bf_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_233e_return_output;
     VAR_deo_uxn_opcodes_h_l3102_c41_476b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_ab13_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_iftrue := VAR_dei2_uxn_opcodes_h_l3101_c41_49bf_return_output;
     -- deo[uxn_opcodes_h_l3102_c41_476b] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l3102_c41_476b_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l3102_c41_476b_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l3102_c41_476b_phase <= VAR_deo_uxn_opcodes_h_l3102_c41_476b_phase;
     deo_uxn_opcodes_h_l3102_c41_476b_ins <= VAR_deo_uxn_opcodes_h_l3102_c41_476b_ins;
     deo_uxn_opcodes_h_l3102_c41_476b_previous_stack_read <= VAR_deo_uxn_opcodes_h_l3102_c41_476b_previous_stack_read;
     deo_uxn_opcodes_h_l3102_c41_476b_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l3102_c41_476b_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l3102_c41_476b_return_output := deo_uxn_opcodes_h_l3102_c41_476b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c1_d0cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c7_7968] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_7968_return_output;
     VAR_deo2_uxn_opcodes_h_l3103_c41_0046_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_d0cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_iftrue := VAR_deo_uxn_opcodes_h_l3102_c41_476b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c1_ed82] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c7_6cd8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output;

     -- deo2[uxn_opcodes_h_l3103_c41_0046] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l3103_c41_0046_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l3103_c41_0046_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l3103_c41_0046_phase <= VAR_deo2_uxn_opcodes_h_l3103_c41_0046_phase;
     deo2_uxn_opcodes_h_l3103_c41_0046_ins <= VAR_deo2_uxn_opcodes_h_l3103_c41_0046_ins;
     deo2_uxn_opcodes_h_l3103_c41_0046_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l3103_c41_0046_previous_stack_read;
     deo2_uxn_opcodes_h_l3103_c41_0046_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l3103_c41_0046_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l3103_c41_0046_return_output := deo2_uxn_opcodes_h_l3103_c41_0046_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output;
     VAR_add_uxn_opcodes_h_l3104_c41_5ab9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_ed82_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_iftrue := VAR_deo2_uxn_opcodes_h_l3103_c41_0046_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c1_5d8f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_return_output;

     -- add[uxn_opcodes_h_l3104_c41_5ab9] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l3104_c41_5ab9_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l3104_c41_5ab9_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l3104_c41_5ab9_phase <= VAR_add_uxn_opcodes_h_l3104_c41_5ab9_phase;
     add_uxn_opcodes_h_l3104_c41_5ab9_ins <= VAR_add_uxn_opcodes_h_l3104_c41_5ab9_ins;
     add_uxn_opcodes_h_l3104_c41_5ab9_previous_stack_read <= VAR_add_uxn_opcodes_h_l3104_c41_5ab9_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l3104_c41_5ab9_return_output := add_uxn_opcodes_h_l3104_c41_5ab9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c7_e697] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_e697_return_output;
     VAR_add2_uxn_opcodes_h_l3105_c41_924c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_5d8f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_iftrue := VAR_add_uxn_opcodes_h_l3104_c41_5ab9_return_output;
     -- add2[uxn_opcodes_h_l3105_c41_924c] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l3105_c41_924c_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l3105_c41_924c_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l3105_c41_924c_phase <= VAR_add2_uxn_opcodes_h_l3105_c41_924c_phase;
     add2_uxn_opcodes_h_l3105_c41_924c_ins <= VAR_add2_uxn_opcodes_h_l3105_c41_924c_ins;
     add2_uxn_opcodes_h_l3105_c41_924c_previous_stack_read <= VAR_add2_uxn_opcodes_h_l3105_c41_924c_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l3105_c41_924c_return_output := add2_uxn_opcodes_h_l3105_c41_924c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c7_d268] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c1_a8b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_d268_return_output;
     VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_a8b5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_iftrue := VAR_add2_uxn_opcodes_h_l3105_c41_924c_return_output;
     -- sub[uxn_opcodes_h_l3106_c41_7bb4] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l3106_c41_7bb4_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l3106_c41_7bb4_phase <= VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_phase;
     sub_uxn_opcodes_h_l3106_c41_7bb4_ins <= VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_ins;
     sub_uxn_opcodes_h_l3106_c41_7bb4_previous_stack_read <= VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_return_output := sub_uxn_opcodes_h_l3106_c41_7bb4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c1_5f57] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c7_2ca1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output;
     VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_5f57_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_iftrue := VAR_sub_uxn_opcodes_h_l3106_c41_7bb4_return_output;
     -- sub2[uxn_opcodes_h_l3107_c41_cc09] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l3107_c41_cc09_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l3107_c41_cc09_phase <= VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_phase;
     sub2_uxn_opcodes_h_l3107_c41_cc09_ins <= VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_ins;
     sub2_uxn_opcodes_h_l3107_c41_cc09_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_return_output := sub2_uxn_opcodes_h_l3107_c41_cc09_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c7_8e64] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c1_0d05] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output;
     VAR_mul_uxn_opcodes_h_l3108_c41_2961_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_0d05_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_iftrue := VAR_sub2_uxn_opcodes_h_l3107_c41_cc09_return_output;
     -- mul[uxn_opcodes_h_l3108_c41_2961] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l3108_c41_2961_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l3108_c41_2961_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l3108_c41_2961_phase <= VAR_mul_uxn_opcodes_h_l3108_c41_2961_phase;
     mul_uxn_opcodes_h_l3108_c41_2961_ins <= VAR_mul_uxn_opcodes_h_l3108_c41_2961_ins;
     mul_uxn_opcodes_h_l3108_c41_2961_previous_stack_read <= VAR_mul_uxn_opcodes_h_l3108_c41_2961_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l3108_c41_2961_return_output := mul_uxn_opcodes_h_l3108_c41_2961_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c7_9886] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c1_68c7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_9886_return_output;
     VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_68c7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_iftrue := VAR_mul_uxn_opcodes_h_l3108_c41_2961_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c1_3de5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c7_9b99] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output;

     -- mul2[uxn_opcodes_h_l3109_c41_78b5] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l3109_c41_78b5_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l3109_c41_78b5_phase <= VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_phase;
     mul2_uxn_opcodes_h_l3109_c41_78b5_ins <= VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_ins;
     mul2_uxn_opcodes_h_l3109_c41_78b5_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_return_output := mul2_uxn_opcodes_h_l3109_c41_78b5_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output;
     VAR_div_uxn_opcodes_h_l3110_c41_0810_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_3de5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_iftrue := VAR_mul2_uxn_opcodes_h_l3109_c41_78b5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c7_2af8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c1_d395] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_return_output;

     -- div[uxn_opcodes_h_l3110_c41_0810] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l3110_c41_0810_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l3110_c41_0810_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l3110_c41_0810_phase <= VAR_div_uxn_opcodes_h_l3110_c41_0810_phase;
     div_uxn_opcodes_h_l3110_c41_0810_ins <= VAR_div_uxn_opcodes_h_l3110_c41_0810_ins;
     div_uxn_opcodes_h_l3110_c41_0810_previous_stack_read <= VAR_div_uxn_opcodes_h_l3110_c41_0810_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l3110_c41_0810_return_output := div_uxn_opcodes_h_l3110_c41_0810_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output;
     VAR_div2_uxn_opcodes_h_l3111_c41_4e50_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_d395_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_iftrue := VAR_div_uxn_opcodes_h_l3110_c41_0810_return_output;
     -- div2[uxn_opcodes_h_l3111_c41_4e50] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l3111_c41_4e50_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l3111_c41_4e50_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l3111_c41_4e50_phase <= VAR_div2_uxn_opcodes_h_l3111_c41_4e50_phase;
     div2_uxn_opcodes_h_l3111_c41_4e50_ins <= VAR_div2_uxn_opcodes_h_l3111_c41_4e50_ins;
     div2_uxn_opcodes_h_l3111_c41_4e50_previous_stack_read <= VAR_div2_uxn_opcodes_h_l3111_c41_4e50_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l3111_c41_4e50_return_output := div2_uxn_opcodes_h_l3111_c41_4e50_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c7_ab8f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c1_83a4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output;
     VAR_and_uxn_opcodes_h_l3112_c41_717f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_83a4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_iftrue := VAR_div2_uxn_opcodes_h_l3111_c41_4e50_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c1_9700] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c7_a9e0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output;

     -- and[uxn_opcodes_h_l3112_c41_717f] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l3112_c41_717f_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l3112_c41_717f_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l3112_c41_717f_phase <= VAR_and_uxn_opcodes_h_l3112_c41_717f_phase;
     and_uxn_opcodes_h_l3112_c41_717f_ins <= VAR_and_uxn_opcodes_h_l3112_c41_717f_ins;
     and_uxn_opcodes_h_l3112_c41_717f_previous_stack_read <= VAR_and_uxn_opcodes_h_l3112_c41_717f_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l3112_c41_717f_return_output := and_uxn_opcodes_h_l3112_c41_717f_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output;
     VAR_and2_uxn_opcodes_h_l3113_c41_42f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_9700_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_iftrue := VAR_and_uxn_opcodes_h_l3112_c41_717f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c7_a296] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c1_6a20] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_return_output;

     -- and2[uxn_opcodes_h_l3113_c41_42f4] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l3113_c41_42f4_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l3113_c41_42f4_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l3113_c41_42f4_phase <= VAR_and2_uxn_opcodes_h_l3113_c41_42f4_phase;
     and2_uxn_opcodes_h_l3113_c41_42f4_ins <= VAR_and2_uxn_opcodes_h_l3113_c41_42f4_ins;
     and2_uxn_opcodes_h_l3113_c41_42f4_previous_stack_read <= VAR_and2_uxn_opcodes_h_l3113_c41_42f4_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l3113_c41_42f4_return_output := and2_uxn_opcodes_h_l3113_c41_42f4_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a296_return_output;
     VAR_ora_uxn_opcodes_h_l3114_c41_9911_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_6a20_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_iftrue := VAR_and2_uxn_opcodes_h_l3113_c41_42f4_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c1_9d0e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_return_output;

     -- ora[uxn_opcodes_h_l3114_c41_9911] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l3114_c41_9911_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l3114_c41_9911_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l3114_c41_9911_phase <= VAR_ora_uxn_opcodes_h_l3114_c41_9911_phase;
     ora_uxn_opcodes_h_l3114_c41_9911_ins <= VAR_ora_uxn_opcodes_h_l3114_c41_9911_ins;
     ora_uxn_opcodes_h_l3114_c41_9911_previous_stack_read <= VAR_ora_uxn_opcodes_h_l3114_c41_9911_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l3114_c41_9911_return_output := ora_uxn_opcodes_h_l3114_c41_9911_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c7_92ae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output;
     VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_9d0e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_iftrue := VAR_ora_uxn_opcodes_h_l3114_c41_9911_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c1_92a1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c7_6066] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_return_output;

     -- ora2[uxn_opcodes_h_l3115_c41_11fa] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l3115_c41_11fa_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l3115_c41_11fa_phase <= VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_phase;
     ora2_uxn_opcodes_h_l3115_c41_11fa_ins <= VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_ins;
     ora2_uxn_opcodes_h_l3115_c41_11fa_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_return_output := ora2_uxn_opcodes_h_l3115_c41_11fa_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_6066_return_output;
     VAR_eor_uxn_opcodes_h_l3116_c41_896a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_92a1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_iftrue := VAR_ora2_uxn_opcodes_h_l3115_c41_11fa_return_output;
     -- eor[uxn_opcodes_h_l3116_c41_896a] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l3116_c41_896a_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l3116_c41_896a_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l3116_c41_896a_phase <= VAR_eor_uxn_opcodes_h_l3116_c41_896a_phase;
     eor_uxn_opcodes_h_l3116_c41_896a_ins <= VAR_eor_uxn_opcodes_h_l3116_c41_896a_ins;
     eor_uxn_opcodes_h_l3116_c41_896a_previous_stack_read <= VAR_eor_uxn_opcodes_h_l3116_c41_896a_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l3116_c41_896a_return_output := eor_uxn_opcodes_h_l3116_c41_896a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c7_0ad9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c1_2626] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output;
     VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_2626_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_iftrue := VAR_eor_uxn_opcodes_h_l3116_c41_896a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c1_5177] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_return_output;

     -- eor2[uxn_opcodes_h_l3117_c41_62c5] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l3117_c41_62c5_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l3117_c41_62c5_phase <= VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_phase;
     eor2_uxn_opcodes_h_l3117_c41_62c5_ins <= VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_ins;
     eor2_uxn_opcodes_h_l3117_c41_62c5_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_return_output := eor2_uxn_opcodes_h_l3117_c41_62c5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c7_472a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_472a_return_output;
     VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_5177_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_iftrue := VAR_eor2_uxn_opcodes_h_l3117_c41_62c5_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3120_c1_902b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c1_5b02] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_return_output;

     -- sft[uxn_opcodes_h_l3118_c41_2f6c] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l3118_c41_2f6c_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l3118_c41_2f6c_phase <= VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_phase;
     sft_uxn_opcodes_h_l3118_c41_2f6c_ins <= VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_ins;
     sft_uxn_opcodes_h_l3118_c41_2f6c_previous_stack_read <= VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_return_output := sft_uxn_opcodes_h_l3118_c41_2f6c_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l3120_c9_f344_uxn_opcodes_h_l3120_c9_f344_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_902b_return_output;
     VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_5b02_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_iftrue := VAR_sft_uxn_opcodes_h_l3118_c41_2f6c_return_output;
     -- sft2[uxn_opcodes_h_l3119_c41_b9fb] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l3119_c41_b9fb_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l3119_c41_b9fb_phase <= VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_phase;
     sft2_uxn_opcodes_h_l3119_c41_b9fb_ins <= VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_ins;
     sft2_uxn_opcodes_h_l3119_c41_b9fb_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_return_output := sft2_uxn_opcodes_h_l3119_c41_b9fb_return_output;

     -- printf_uxn_opcodes_h_l3120_c9_f344[uxn_opcodes_h_l3120_c9_f344] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3120_c9_f344_uxn_opcodes_h_l3120_c9_f344_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3120_c9_f344_uxn_opcodes_h_l3120_c9_f344_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3120_c9_f344_uxn_opcodes_h_l3120_c9_f344_arg0 <= VAR_printf_uxn_opcodes_h_l3120_c9_f344_uxn_opcodes_h_l3120_c9_f344_arg0;
     -- Outputs

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_iftrue := VAR_sft2_uxn_opcodes_h_l3119_c41_b9fb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3119_c7_472a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_cond;
     opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_return_output := opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_472a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3118_c7_0ad9] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_cond;
     opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output := opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_0ad9_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3117_c7_6066] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_cond;
     opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_return_output := opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_6066_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3116_c7_92ae] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_cond;
     opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output := opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_92ae_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3115_c7_a296] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_cond;
     opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_return_output := opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a296_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3114_c7_a9e0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_cond;
     opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output := opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_a9e0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3113_c7_ab8f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_cond;
     opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output := opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_ab8f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3112_c7_2af8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_cond;
     opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output := opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_2af8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3111_c7_9b99] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_cond;
     opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output := opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_9b99_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3110_c7_9886] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_cond;
     opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_return_output := opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_9886_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3109_c7_8e64] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_cond;
     opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output := opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_8e64_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3108_c7_2ca1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_cond;
     opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output := opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_2ca1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3107_c7_d268] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_cond;
     opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_return_output := opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_d268_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3106_c7_e697] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_cond;
     opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_return_output := opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_e697_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3105_c7_6cd8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_cond;
     opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output := opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_6cd8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3104_c7_7968] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_cond;
     opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_return_output := opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_7968_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3103_c7_233e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_cond;
     opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_return_output := opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_233e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3102_c7_1df3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_cond;
     opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output := opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_1df3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3101_c7_f371] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_cond;
     opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_return_output := opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_f371_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3100_c7_4855] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_cond;
     opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_return_output := opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_4855_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3099_c7_1a07] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_cond;
     opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output := opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_1a07_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3098_c7_9389] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_cond;
     opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_return_output := opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9389_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3097_c7_7132] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_cond;
     opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_return_output := opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_7132_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3096_c7_92ee] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_cond;
     opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output := opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_92ee_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3095_c7_9b70] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_cond;
     opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output := opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_9b70_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3094_c7_8ac5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_cond;
     opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output := opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_8ac5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3093_c7_716c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_cond;
     opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_return_output := opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_716c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3092_c7_0b73] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_cond;
     opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output := opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_0b73_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3091_c7_d733] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_cond;
     opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_return_output := opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_d733_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3090_c7_d89d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_cond;
     opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output := opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_d89d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3089_c7_4ac3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_cond;
     opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output := opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_4ac3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3088_c7_3d12] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_cond;
     opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output := opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_3d12_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3087_c7_9377] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_cond;
     opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_return_output := opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9377_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3086_c7_89d1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_cond;
     opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output := opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_89d1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3085_c7_cb96] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_cond;
     opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output := opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_cb96_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3084_c7_4724] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_cond;
     opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_return_output := opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_4724_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3083_c7_dd4f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_cond;
     opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output := opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_dd4f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3082_c7_c39a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_cond;
     opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output := opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_c39a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3081_c7_118f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_cond;
     opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_return_output := opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_118f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3080_c7_58cf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_cond;
     opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output := opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_58cf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3079_c7_26ec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_cond;
     opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output := opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_26ec_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3078_c7_0809] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_cond;
     opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_return_output := opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_0809_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3077_c7_0183] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_cond;
     opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_return_output := opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0183_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3076_c7_63b5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_cond;
     opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output := opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_63b5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3075_c7_0581] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_cond;
     opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_return_output := opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_0581_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3074_c7_8bfa] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_cond;
     opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output := opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_8bfa_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3073_c7_5906] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_cond;
     opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_return_output := opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_5906_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3072_c7_5b4c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_cond;
     opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output := opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_5b4c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3071_c7_37ba] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_cond;
     opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output := opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_37ba_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3070_c7_eaa3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_cond;
     opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output := opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_eaa3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3069_c7_e0dc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_cond;
     opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output := opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_e0dc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3068_c7_26d4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_cond;
     opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output := opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_26d4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3067_c7_bfba] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_cond;
     opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output := opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_bfba_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3066_c7_43fd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_cond;
     opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output := opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_43fd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3065_c7_a153] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_cond;
     opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_return_output := opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_a153_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3064_c7_24e3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_cond;
     opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output := opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_24e3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3063_c7_ab5b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_cond;
     opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output := opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_ab5b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3062_c7_190c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_cond;
     opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_return_output := opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_190c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3061_c7_b811] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_cond;
     opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_return_output := opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_b811_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3060_c7_66f7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_cond;
     opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output := opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_66f7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3059_c7_7f00] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_cond;
     opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output := opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_7f00_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3058_c7_9aaf] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_cond;
     opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output := opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_9aaf_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3057_c7_6b0e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_cond;
     opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output := opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6b0e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3056_c7_7dd2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_cond;
     opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output := opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_7dd2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3055_c7_0abb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_cond;
     opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output := opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_0abb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3054_c7_97ce] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_cond;
     opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output := opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_97ce_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3053_c7_6d45] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_cond;
     opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output := opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_6d45_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3052_c7_46a7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_cond;
     opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output := opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_46a7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3051_c7_6b18] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_cond;
     opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output := opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_6b18_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3050_c2_f026] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_cond;
     opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output := opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l3155_c32_6310] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3155_c32_6310_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l3148_c34_f462] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3148_c34_f462_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l3145_c3_1997] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3145_c3_1997_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l3153_c33_4202] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3153_c33_4202_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.vram_address;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l3143_c3_5226] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3143_c3_5226_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.device_ram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l3123_c17_7545] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3123_c17_7545_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3127_l3129_DUPLICATE_f1aa LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3127_l3129_DUPLICATE_f1aa_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l3152_c37_433b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3152_c37_433b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l3151_c34_0ceb] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3151_c34_0ceb_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l3139_c3_5f69] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3139_c3_5f69_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l3149_c30_b7a8] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l3149_c30_b7a8_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.u16_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l3133_c70_d815] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3133_c70_d815_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l3150_c33_3bee] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3150_c33_3bee_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3144_l3154_l3138_DUPLICATE_8d3a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3144_l3154_l3138_DUPLICATE_8d3a_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l3125_c6_b5be] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3125_c6_b5be_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_f026_return_output.is_sp_shift;

     -- Submodule level 146
     VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3145_c3_1997_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9244_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3125_c6_b5be_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9244_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3125_c6_b5be_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3123_c17_7545_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3139_c3_5f69_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_device_address := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3143_c3_5226_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3144_l3154_l3138_DUPLICATE_8d3a_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3144_l3154_l3138_DUPLICATE_8d3a_return_output;
     -- BIN_OP_XOR[uxn_opcodes_h_l3123_c2_be56] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_left;
     BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_return_output := BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3133_c59_1e84] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3133_c59_1e84_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3133_c70_d815_return_output);

     -- device_ram_update[uxn_opcodes_h_l3142_c26_ce1d] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_device_address <= VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_device_address;
     device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_value <= VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_value;
     device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_write_enable <= VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_return_output := device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_2565_uxn_opcodes_h_l3157_l3031_DUPLICATE_29ed LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_2565_uxn_opcodes_h_l3157_l3031_DUPLICATE_29ed_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_2565(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3148_c34_f462_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l3149_c30_b7a8_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3150_c33_3bee_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3151_c34_0ceb_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3152_c37_433b_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3153_c33_4202_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3144_l3154_l3138_DUPLICATE_8d3a_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3155_c32_6310_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3129_l3127_DUPLICATE_4476 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3129_l3127_DUPLICATE_4476_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3127_l3129_DUPLICATE_f1aa_return_output);

     -- Submodule level 147
     VAR_MUX_uxn_opcodes_h_l3133_c30_92be_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_return_output;
     VAR_MUX_uxn_opcodes_h_l3134_c20_0c87_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0571_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0571_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_be56_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3129_l3127_DUPLICATE_4476_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3129_l3127_DUPLICATE_4476_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_right := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3133_c59_1e84_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_2565_uxn_opcodes_h_l3157_l3031_DUPLICATE_29ed_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_2565_uxn_opcodes_h_l3157_l3031_DUPLICATE_29ed_return_output;
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_opcodes_h_l3142_c26_ce1d_return_output;
     -- MUX[uxn_opcodes_h_l3134_c20_0c87] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3134_c20_0c87_cond <= VAR_MUX_uxn_opcodes_h_l3134_c20_0c87_cond;
     MUX_uxn_opcodes_h_l3134_c20_0c87_iftrue <= VAR_MUX_uxn_opcodes_h_l3134_c20_0c87_iftrue;
     MUX_uxn_opcodes_h_l3134_c20_0c87_iffalse <= VAR_MUX_uxn_opcodes_h_l3134_c20_0c87_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3134_c20_0c87_return_output := MUX_uxn_opcodes_h_l3134_c20_0c87_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3127_c4_e65c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3129_c4_80b4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_return_output;

     -- Submodule level 148
     VAR_sp1_uxn_opcodes_h_l3127_c4_af9f := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_e65c_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l3129_c4_7590 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_80b4_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_right := VAR_MUX_uxn_opcodes_h_l3134_c20_0c87_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0571_iffalse := VAR_sp0_uxn_opcodes_h_l3129_c4_7590;
     VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0571_iftrue := VAR_sp1_uxn_opcodes_h_l3127_c4_af9f;
     -- sp1_MUX[uxn_opcodes_h_l3126_c3_0571] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3126_c3_0571_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0571_cond;
     sp1_MUX_uxn_opcodes_h_l3126_c3_0571_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0571_iftrue;
     sp1_MUX_uxn_opcodes_h_l3126_c3_0571_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0571_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0571_return_output := sp1_MUX_uxn_opcodes_h_l3126_c3_0571_return_output;

     -- sp0_MUX[uxn_opcodes_h_l3126_c3_0571] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3126_c3_0571_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0571_cond;
     sp0_MUX_uxn_opcodes_h_l3126_c3_0571_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0571_iftrue;
     sp0_MUX_uxn_opcodes_h_l3126_c3_0571_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0571_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0571_return_output := sp0_MUX_uxn_opcodes_h_l3126_c3_0571_return_output;

     -- Submodule level 149
     VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9244_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0571_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9244_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0571_return_output;
     -- sp0_MUX[uxn_opcodes_h_l3125_c2_9244] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3125_c2_9244_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9244_cond;
     sp0_MUX_uxn_opcodes_h_l3125_c2_9244_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9244_iftrue;
     sp0_MUX_uxn_opcodes_h_l3125_c2_9244_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9244_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9244_return_output := sp0_MUX_uxn_opcodes_h_l3125_c2_9244_return_output;

     -- sp1_MUX[uxn_opcodes_h_l3125_c2_9244] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3125_c2_9244_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9244_cond;
     sp1_MUX_uxn_opcodes_h_l3125_c2_9244_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9244_iftrue;
     sp1_MUX_uxn_opcodes_h_l3125_c2_9244_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9244_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9244_return_output := sp1_MUX_uxn_opcodes_h_l3125_c2_9244_return_output;

     -- Submodule level 150
     VAR_MUX_uxn_opcodes_h_l3133_c30_92be_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9244_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9244_return_output;
     VAR_MUX_uxn_opcodes_h_l3133_c30_92be_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9244_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9244_return_output;
     -- MUX[uxn_opcodes_h_l3133_c30_92be] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3133_c30_92be_cond <= VAR_MUX_uxn_opcodes_h_l3133_c30_92be_cond;
     MUX_uxn_opcodes_h_l3133_c30_92be_iftrue <= VAR_MUX_uxn_opcodes_h_l3133_c30_92be_iftrue;
     MUX_uxn_opcodes_h_l3133_c30_92be_iffalse <= VAR_MUX_uxn_opcodes_h_l3133_c30_92be_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3133_c30_92be_return_output := MUX_uxn_opcodes_h_l3133_c30_92be_return_output;

     -- Submodule level 151
     -- CAST_TO_uint12_t[uxn_opcodes_h_l3133_c19_e1b4] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3133_c19_e1b4_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l3133_c30_92be_return_output);

     -- Submodule level 152
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_left := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3133_c19_e1b4_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l3133_c19_d50f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_left;
     BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_return_output := BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_return_output;

     -- Submodule level 153
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_d50f_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l3134_c2_bd1c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_return_output;

     -- Submodule level 154
     VAR_stack_address_uxn_opcodes_h_l3134_c2_f4dc := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_bd1c_return_output, 12);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l3134_c2_f4dc;
     VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_stack_address := VAR_stack_address_uxn_opcodes_h_l3134_c2_f4dc;
     -- stack_ram_update[uxn_opcodes_h_l3136_c21_1995] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l3136_c21_1995_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l3136_c21_1995_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_stack_address;
     stack_ram_update_uxn_opcodes_h_l3136_c21_1995_value <= VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_value;
     stack_ram_update_uxn_opcodes_h_l3136_c21_1995_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_return_output := stack_ram_update_uxn_opcodes_h_l3136_c21_1995_return_output;

     -- Submodule level 155
     REG_VAR_stack_read_value := VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_1995_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_sp0 <= REG_VAR_sp0;
REG_COMB_sp1 <= REG_VAR_sp1;
REG_COMB_opc <= REG_VAR_opc;
REG_COMB_stack_index <= REG_VAR_stack_index;
REG_COMB_stack_address <= REG_VAR_stack_address;
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
     stack_address <= REG_COMB_stack_address;
     stack_read_value <= REG_COMB_stack_read_value;
     device_ram_read_value <= REG_COMB_device_ram_read_value;
     opc_result <= REG_COMB_opc_result;
     opc_eval_result <= REG_COMB_opc_eval_result;
 end if;
 end if;
end process;

end arch;
