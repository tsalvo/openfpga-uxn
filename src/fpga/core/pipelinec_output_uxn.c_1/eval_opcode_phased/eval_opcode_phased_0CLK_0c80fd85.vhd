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
-- BIN_OP_AND[uxn_opcodes_h_l3045_c10_1ea3]
signal BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3045_c10_8f3a]
signal BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3045_c41_e3f9]
signal BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l3045_c57_34b0]
signal CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l3045_c10_6d30]
signal MUX_uxn_opcodes_h_l3045_c10_6d30_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3045_c10_6d30_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3045_c10_6d30_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l3045_c10_6d30_return_output : unsigned(11 downto 0);

-- printf_uxn_opcodes_h_l3048_c2_acae[uxn_opcodes_h_l3048_c2_acae]
signal printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3050_c6_05bb]
signal BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3051_c7_c0c2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3050_c2_296b]
signal opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3051_c11_0232]
signal BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3051_c1_c54b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3052_c7_4389]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3051_c7_c0c2]
signal opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l3051_c41_7c05]
signal jci_uxn_opcodes_h_l3051_c41_7c05_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l3051_c41_7c05_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3051_c41_7c05_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l3051_c41_7c05_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3051_c41_7c05_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l3051_c41_7c05_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3052_c11_99ad]
signal BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3052_c1_57cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3053_c7_f676]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3052_c7_4389]
signal opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l3052_c41_4d8a]
signal jmi_uxn_opcodes_h_l3052_c41_4d8a_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l3052_c41_4d8a_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3052_c41_4d8a_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l3052_c41_4d8a_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l3052_c41_4d8a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3053_c11_c5bf]
signal BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3053_c1_e755]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3054_c7_1c59]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3053_c7_f676]
signal opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l3053_c41_39ec]
signal jsi_uxn_opcodes_h_l3053_c41_39ec_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l3053_c41_39ec_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3053_c41_39ec_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l3053_c41_39ec_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l3053_c41_39ec_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3054_c11_00b6]
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3054_c1_414a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3055_c7_46d5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3054_c7_1c59]
signal opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3054_c41_088e]
signal lit_uxn_opcodes_h_l3054_c41_088e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3054_c41_088e_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3054_c41_088e_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3054_c41_088e_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3054_c41_088e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3055_c11_0fef]
signal BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3055_c1_2e91]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3056_c7_6b9e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3055_c7_46d5]
signal opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3055_c41_25f7]
signal lit2_uxn_opcodes_h_l3055_c41_25f7_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3055_c41_25f7_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3055_c41_25f7_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3055_c41_25f7_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3055_c41_25f7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3056_c11_57b2]
signal BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3056_c1_4244]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c7_6900]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3056_c7_6b9e]
signal opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l3056_c41_e625]
signal lit_uxn_opcodes_h_l3056_c41_e625_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l3056_c41_e625_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3056_c41_e625_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l3056_c41_e625_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l3056_c41_e625_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3057_c11_2d4f]
signal BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c1_cba1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c7_3864]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3057_c7_6900]
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l3057_c41_1477]
signal lit2_uxn_opcodes_h_l3057_c41_1477_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l3057_c41_1477_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3057_c41_1477_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l3057_c41_1477_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l3057_c41_1477_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3058_c11_2ff4]
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c1_d41c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c7_640d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3058_c7_3864]
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l3058_c41_f56c]
signal inc_uxn_opcodes_h_l3058_c41_f56c_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l3058_c41_f56c_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3058_c41_f56c_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3058_c41_f56c_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l3058_c41_f56c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3059_c11_2110]
signal BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c1_a9a1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c7_1592]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3059_c7_640d]
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l3059_c41_b410]
signal inc2_uxn_opcodes_h_l3059_c41_b410_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l3059_c41_b410_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3059_c41_b410_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3059_c41_b410_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l3059_c41_b410_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3060_c11_13d4]
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c1_f675]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c7_dbe5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3060_c7_1592]
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l3060_c41_6fa2]
signal pop_uxn_opcodes_h_l3060_c41_6fa2_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l3060_c41_6fa2_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3060_c41_6fa2_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l3060_c41_6fa2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3061_c11_11e6]
signal BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c1_7094]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c7_7fef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3061_c7_dbe5]
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l3061_c41_5cc5]
signal pop2_uxn_opcodes_h_l3061_c41_5cc5_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l3061_c41_5cc5_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3061_c41_5cc5_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l3061_c41_5cc5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3062_c11_92b9]
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c1_0020]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c7_3aad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3062_c7_7fef]
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l3062_c41_ab84]
signal nip_uxn_opcodes_h_l3062_c41_ab84_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l3062_c41_ab84_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3062_c41_ab84_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3062_c41_ab84_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l3062_c41_ab84_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3063_c11_eff3]
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c1_5d2f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c7_a6e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3063_c7_3aad]
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l3063_c41_0eb4]
signal nip2_uxn_opcodes_h_l3063_c41_0eb4_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l3063_c41_0eb4_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3063_c41_0eb4_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3063_c41_0eb4_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l3063_c41_0eb4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3064_c11_4de2]
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c1_da32]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c7_f3b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3064_c7_a6e8]
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l3064_c41_558c]
signal swp_uxn_opcodes_h_l3064_c41_558c_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l3064_c41_558c_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3064_c41_558c_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3064_c41_558c_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l3064_c41_558c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3065_c11_43cd]
signal BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c1_849d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c7_0dc6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3065_c7_f3b7]
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l3065_c41_841a]
signal swp2_uxn_opcodes_h_l3065_c41_841a_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l3065_c41_841a_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3065_c41_841a_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3065_c41_841a_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l3065_c41_841a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3066_c11_2575]
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c1_9f02]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c7_cdd0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3066_c7_0dc6]
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l3066_c41_5be6]
signal rot_uxn_opcodes_h_l3066_c41_5be6_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l3066_c41_5be6_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3066_c41_5be6_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3066_c41_5be6_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l3066_c41_5be6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3067_c11_93f0]
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c1_d0ad]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c7_3e4e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3067_c7_cdd0]
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l3067_c41_2ef8]
signal rot2_uxn_opcodes_h_l3067_c41_2ef8_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l3067_c41_2ef8_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3067_c41_2ef8_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3067_c41_2ef8_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l3067_c41_2ef8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3068_c11_5b03]
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c1_9931]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c7_37c6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3068_c7_3e4e]
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l3068_c41_2924]
signal dup_uxn_opcodes_h_l3068_c41_2924_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l3068_c41_2924_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3068_c41_2924_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3068_c41_2924_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l3068_c41_2924_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3069_c11_5356]
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c1_657f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c7_c4e7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3069_c7_37c6]
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l3069_c41_30ff]
signal dup2_uxn_opcodes_h_l3069_c41_30ff_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l3069_c41_30ff_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3069_c41_30ff_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3069_c41_30ff_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l3069_c41_30ff_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3070_c11_7f14]
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c1_7c97]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c7_e00b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3070_c7_c4e7]
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l3070_c41_47c7]
signal ovr_uxn_opcodes_h_l3070_c41_47c7_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l3070_c41_47c7_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3070_c41_47c7_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3070_c41_47c7_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l3070_c41_47c7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3071_c11_3e07]
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c1_e64c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c7_7f70]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3071_c7_e00b]
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l3071_c41_1a57]
signal ovr2_uxn_opcodes_h_l3071_c41_1a57_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l3071_c41_1a57_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3071_c41_1a57_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3071_c41_1a57_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l3071_c41_1a57_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3072_c11_e89b]
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c1_bd9b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c7_c813]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3072_c7_7f70]
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l3072_c41_9c9f]
signal equ_uxn_opcodes_h_l3072_c41_9c9f_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l3072_c41_9c9f_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3072_c41_9c9f_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3072_c41_9c9f_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l3072_c41_9c9f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3073_c11_deae]
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c1_02c8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c7_d2e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3073_c7_c813]
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l3073_c41_33cd]
signal equ2_uxn_opcodes_h_l3073_c41_33cd_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l3073_c41_33cd_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3073_c41_33cd_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3073_c41_33cd_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l3073_c41_33cd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3074_c11_0a1b]
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c1_a0a7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c7_3ad5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3074_c7_d2e8]
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l3074_c41_0bb7]
signal neq_uxn_opcodes_h_l3074_c41_0bb7_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l3074_c41_0bb7_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3074_c41_0bb7_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3074_c41_0bb7_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l3074_c41_0bb7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3075_c11_d3f6]
signal BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c1_839e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c7_4ad8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3075_c7_3ad5]
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l3075_c41_c5ab]
signal neq2_uxn_opcodes_h_l3075_c41_c5ab_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l3075_c41_c5ab_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3075_c41_c5ab_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3075_c41_c5ab_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l3075_c41_c5ab_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3076_c11_44dd]
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c1_7b88]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c7_0d48]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3076_c7_4ad8]
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l3076_c41_2dbf]
signal gth_uxn_opcodes_h_l3076_c41_2dbf_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l3076_c41_2dbf_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3076_c41_2dbf_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3076_c41_2dbf_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l3076_c41_2dbf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3077_c11_6bfc]
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c1_f991]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c7_9a18]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3077_c7_0d48]
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l3077_c41_241c]
signal gth2_uxn_opcodes_h_l3077_c41_241c_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l3077_c41_241c_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3077_c41_241c_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3077_c41_241c_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l3077_c41_241c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3078_c11_cbf8]
signal BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c1_1471]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c7_c62c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3078_c7_9a18]
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l3078_c41_b6d8]
signal lth_uxn_opcodes_h_l3078_c41_b6d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l3078_c41_b6d8_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3078_c41_b6d8_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3078_c41_b6d8_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l3078_c41_b6d8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3079_c11_525b]
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c1_50b7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c7_83f7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3079_c7_c62c]
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l3079_c41_02fd]
signal lth2_uxn_opcodes_h_l3079_c41_02fd_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l3079_c41_02fd_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3079_c41_02fd_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3079_c41_02fd_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l3079_c41_02fd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3080_c11_effe]
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c1_1cde]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c7_2c50]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3080_c7_83f7]
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l3080_c41_e2f4]
signal jmp_uxn_opcodes_h_l3080_c41_e2f4_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l3080_c41_e2f4_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3080_c41_e2f4_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3080_c41_e2f4_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l3080_c41_e2f4_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l3080_c41_e2f4_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3081_c11_465e]
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c1_391a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c7_840f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3081_c7_2c50]
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l3081_c41_2137]
signal jmp2_uxn_opcodes_h_l3081_c41_2137_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l3081_c41_2137_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3081_c41_2137_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3081_c41_2137_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l3081_c41_2137_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3082_c11_fbc1]
signal BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c1_b3fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c7_f004]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3082_c7_840f]
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l3082_c41_0418]
signal jcn_uxn_opcodes_h_l3082_c41_0418_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l3082_c41_0418_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3082_c41_0418_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3082_c41_0418_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l3082_c41_0418_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l3082_c41_0418_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3083_c11_d24d]
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c1_33ef]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c7_11a8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3083_c7_f004]
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l3083_c41_0ec7]
signal jcn2_uxn_opcodes_h_l3083_c41_0ec7_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l3083_c41_0ec7_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3083_c41_0ec7_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3083_c41_0ec7_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l3083_c41_0ec7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3084_c11_23a7]
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c1_607e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c7_c003]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3084_c7_11a8]
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l3084_c41_d8d7]
signal jsr_uxn_opcodes_h_l3084_c41_d8d7_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l3084_c41_d8d7_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3084_c41_d8d7_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3084_c41_d8d7_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l3084_c41_d8d7_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l3084_c41_d8d7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3085_c11_89e4]
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c1_7c28]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c7_581b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3085_c7_c003]
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l3085_c41_3bcb]
signal jsr2_uxn_opcodes_h_l3085_c41_3bcb_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l3085_c41_3bcb_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3085_c41_3bcb_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3085_c41_3bcb_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l3085_c41_3bcb_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l3085_c41_3bcb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3086_c11_656e]
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c1_ba66]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c7_9c71]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3086_c7_581b]
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l3086_c41_219a]
signal sth_uxn_opcodes_h_l3086_c41_219a_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l3086_c41_219a_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3086_c41_219a_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3086_c41_219a_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l3086_c41_219a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3087_c11_bfdb]
signal BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c1_d72f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c7_b90c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3087_c7_9c71]
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l3087_c41_de17]
signal sth2_uxn_opcodes_h_l3087_c41_de17_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l3087_c41_de17_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3087_c41_de17_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3087_c41_de17_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l3087_c41_de17_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3088_c11_25fe]
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c1_8864]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c7_dcef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3088_c7_b90c]
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l3088_c41_e869]
signal ldz_uxn_opcodes_h_l3088_c41_e869_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l3088_c41_e869_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3088_c41_e869_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3088_c41_e869_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3088_c41_e869_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l3088_c41_e869_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3089_c11_0883]
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c1_366d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c7_a89b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3089_c7_dcef]
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l3089_c41_67c0]
signal ldz2_uxn_opcodes_h_l3089_c41_67c0_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l3089_c41_67c0_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3089_c41_67c0_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3089_c41_67c0_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3089_c41_67c0_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l3089_c41_67c0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3090_c11_0b0a]
signal BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c1_b59e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c7_70b1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3090_c7_a89b]
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l3090_c41_44a3]
signal stz_uxn_opcodes_h_l3090_c41_44a3_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l3090_c41_44a3_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3090_c41_44a3_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3090_c41_44a3_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l3090_c41_44a3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3091_c11_991e]
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c1_b6e1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c7_f813]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3091_c7_70b1]
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l3091_c41_13cd]
signal stz2_uxn_opcodes_h_l3091_c41_13cd_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l3091_c41_13cd_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3091_c41_13cd_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3091_c41_13cd_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l3091_c41_13cd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3092_c11_752b]
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c1_56f0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c7_d458]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3092_c7_f813]
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l3092_c41_e3f1]
signal ldr_uxn_opcodes_h_l3092_c41_e3f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l3092_c41_e3f1_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3092_c41_e3f1_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3092_c41_e3f1_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l3092_c41_e3f1_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3092_c41_e3f1_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l3092_c41_e3f1_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3093_c11_8b48]
signal BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c1_893b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c7_bd23]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3093_c7_d458]
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l3093_c41_04d3]
signal ldr2_uxn_opcodes_h_l3093_c41_04d3_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l3093_c41_04d3_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3093_c41_04d3_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3093_c41_04d3_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l3093_c41_04d3_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3093_c41_04d3_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l3093_c41_04d3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3094_c11_1bd7]
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c1_36eb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c7_a18e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3094_c7_bd23]
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l3094_c41_de08]
signal str1_uxn_opcodes_h_l3094_c41_de08_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l3094_c41_de08_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3094_c41_de08_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3094_c41_de08_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l3094_c41_de08_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l3094_c41_de08_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_e9da]
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c1_8e5c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c7_5eab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3095_c7_a18e]
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l3095_c41_27e8]
signal str2_uxn_opcodes_h_l3095_c41_27e8_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l3095_c41_27e8_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3095_c41_27e8_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3095_c41_27e8_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l3095_c41_27e8_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l3095_c41_27e8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3096_c11_0438]
signal BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c1_3396]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c7_f428]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3096_c7_5eab]
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l3096_c41_7212]
signal lda_uxn_opcodes_h_l3096_c41_7212_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l3096_c41_7212_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3096_c41_7212_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3096_c41_7212_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3096_c41_7212_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l3096_c41_7212_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3097_c11_4f82]
signal BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c1_cbb6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c7_9114]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3097_c7_f428]
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l3097_c41_91a8]
signal lda2_uxn_opcodes_h_l3097_c41_91a8_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l3097_c41_91a8_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3097_c41_91a8_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3097_c41_91a8_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3097_c41_91a8_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l3097_c41_91a8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3098_c11_fa62]
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c1_f0d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c7_032d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3098_c7_9114]
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l3098_c41_1e9d]
signal sta_uxn_opcodes_h_l3098_c41_1e9d_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l3098_c41_1e9d_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3098_c41_1e9d_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3098_c41_1e9d_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l3098_c41_1e9d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_9f9b]
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c1_6742]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c7_5545]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3099_c7_032d]
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l3099_c41_9428]
signal sta2_uxn_opcodes_h_l3099_c41_9428_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l3099_c41_9428_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3099_c41_9428_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3099_c41_9428_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l3099_c41_9428_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3100_c11_0ff3]
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c1_2604]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c7_4e09]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3100_c7_5545]
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l3100_c41_1971]
signal dei_uxn_opcodes_h_l3100_c41_1971_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l3100_c41_1971_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3100_c41_1971_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3100_c41_1971_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3100_c41_1971_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l3100_c41_1971_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3101_c11_03c3]
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c1_7514]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c7_f017]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3101_c7_4e09]
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l3101_c41_4458]
signal dei2_uxn_opcodes_h_l3101_c41_4458_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l3101_c41_4458_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3101_c41_4458_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3101_c41_4458_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3101_c41_4458_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l3101_c41_4458_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3102_c11_a50e]
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c1_395d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c7_f95f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3102_c7_f017]
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l3102_c41_9326]
signal deo_uxn_opcodes_h_l3102_c41_9326_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l3102_c41_9326_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3102_c41_9326_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3102_c41_9326_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3102_c41_9326_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l3102_c41_9326_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_9b67]
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c1_9024]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c7_3839]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3103_c7_f95f]
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l3103_c41_07d8]
signal deo2_uxn_opcodes_h_l3103_c41_07d8_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l3103_c41_07d8_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3103_c41_07d8_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3103_c41_07d8_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3103_c41_07d8_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l3103_c41_07d8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3104_c11_854a]
signal BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c1_a435]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c7_ff5d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3104_c7_3839]
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l3104_c41_f4a5]
signal add_uxn_opcodes_h_l3104_c41_f4a5_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l3104_c41_f4a5_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3104_c41_f4a5_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3104_c41_f4a5_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l3104_c41_f4a5_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3105_c11_fb6e]
signal BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c1_6550]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c7_6081]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3105_c7_ff5d]
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l3105_c41_ed53]
signal add2_uxn_opcodes_h_l3105_c41_ed53_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l3105_c41_ed53_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3105_c41_ed53_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3105_c41_ed53_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l3105_c41_ed53_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3106_c11_76ed]
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c1_68a4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c7_9906]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3106_c7_6081]
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l3106_c41_05d6]
signal sub_uxn_opcodes_h_l3106_c41_05d6_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l3106_c41_05d6_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3106_c41_05d6_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3106_c41_05d6_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l3106_c41_05d6_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3107_c11_f747]
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c1_0356]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c7_a59e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3107_c7_9906]
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l3107_c41_587b]
signal sub2_uxn_opcodes_h_l3107_c41_587b_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l3107_c41_587b_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3107_c41_587b_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3107_c41_587b_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l3107_c41_587b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3108_c11_08df]
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c1_3031]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c7_cbbc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3108_c7_a59e]
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l3108_c41_f57d]
signal mul_uxn_opcodes_h_l3108_c41_f57d_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l3108_c41_f57d_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3108_c41_f57d_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3108_c41_f57d_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l3108_c41_f57d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3109_c11_f976]
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c1_cffc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c7_cb1f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3109_c7_cbbc]
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l3109_c41_f23e]
signal mul2_uxn_opcodes_h_l3109_c41_f23e_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l3109_c41_f23e_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3109_c41_f23e_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3109_c41_f23e_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l3109_c41_f23e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3110_c11_31c2]
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c1_7ed0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c7_c842]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3110_c7_cb1f]
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l3110_c41_ff0f]
signal div_uxn_opcodes_h_l3110_c41_ff0f_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l3110_c41_ff0f_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3110_c41_ff0f_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3110_c41_ff0f_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l3110_c41_ff0f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3111_c11_0d7a]
signal BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c1_dc39]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c7_c611]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3111_c7_c842]
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l3111_c41_402b]
signal div2_uxn_opcodes_h_l3111_c41_402b_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l3111_c41_402b_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3111_c41_402b_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3111_c41_402b_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l3111_c41_402b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3112_c11_e1a3]
signal BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c1_a39c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c7_1b6a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3112_c7_c611]
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l3112_c41_e361]
signal and_uxn_opcodes_h_l3112_c41_e361_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l3112_c41_e361_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3112_c41_e361_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3112_c41_e361_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l3112_c41_e361_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3113_c11_cc9b]
signal BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c1_81b6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c7_edd3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3113_c7_1b6a]
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l3113_c41_fc34]
signal and2_uxn_opcodes_h_l3113_c41_fc34_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l3113_c41_fc34_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3113_c41_fc34_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3113_c41_fc34_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l3113_c41_fc34_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3114_c11_17f9]
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c1_a9ea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c7_a483]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3114_c7_edd3]
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l3114_c41_41a7]
signal ora_uxn_opcodes_h_l3114_c41_41a7_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l3114_c41_41a7_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3114_c41_41a7_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3114_c41_41a7_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l3114_c41_41a7_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3115_c11_2959]
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c1_29f7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c7_5cd1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3115_c7_a483]
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l3115_c41_b611]
signal ora2_uxn_opcodes_h_l3115_c41_b611_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l3115_c41_b611_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3115_c41_b611_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3115_c41_b611_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l3115_c41_b611_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3116_c11_1a52]
signal BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c1_1bd2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c7_289a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3116_c7_5cd1]
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l3116_c41_0d60]
signal eor_uxn_opcodes_h_l3116_c41_0d60_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l3116_c41_0d60_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3116_c41_0d60_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3116_c41_0d60_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l3116_c41_0d60_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3117_c11_3d9e]
signal BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c1_afca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c7_a136]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3117_c7_289a]
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l3117_c41_4356]
signal eor2_uxn_opcodes_h_l3117_c41_4356_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l3117_c41_4356_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3117_c41_4356_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3117_c41_4356_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l3117_c41_4356_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3118_c11_bdaf]
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c1_86d3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c7_29b1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3118_c7_a136]
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l3118_c41_f38c]
signal sft_uxn_opcodes_h_l3118_c41_f38c_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l3118_c41_f38c_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3118_c41_f38c_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3118_c41_f38c_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l3118_c41_f38c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l3119_c11_8aef]
signal BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c1_a0ce]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3120_c1_4d49]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l3119_c7_29b1]
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l3119_c41_ad2f]
signal sft2_uxn_opcodes_h_l3119_c41_ad2f_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l3119_c41_ad2f_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3119_c41_ad2f_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3119_c41_ad2f_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l3119_c41_ad2f_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l3120_c9_2a8b[uxn_opcodes_h_l3120_c9_2a8b]
signal printf_uxn_opcodes_h_l3120_c9_2a8b_uxn_opcodes_h_l3120_c9_2a8b_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l3120_c9_2a8b_uxn_opcodes_h_l3120_c9_2a8b_arg0 : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3122_c18_a79f]
signal BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3122_c18_e044]
signal BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3122_c18_d5dc]
signal MUX_uxn_opcodes_h_l3122_c18_d5dc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3122_c18_d5dc_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3122_c18_d5dc_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3122_c18_d5dc_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l3123_c2_347c]
signal BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_return_output : unsigned(0 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3125_c2_9a53]
signal sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3125_c2_9a53]
signal sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l3126_c3_0638]
signal sp1_MUX_uxn_opcodes_h_l3126_c3_0638_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3126_c3_0638_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3126_c3_0638_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l3126_c3_0638_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l3126_c3_0638]
signal sp0_MUX_uxn_opcodes_h_l3126_c3_0638_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3126_c3_0638_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3126_c3_0638_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l3126_c3_0638_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3127_c4_c275]
signal BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3129_c4_4395]
signal BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l3133_c30_9ac4]
signal MUX_uxn_opcodes_h_l3133_c30_9ac4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3133_c30_9ac4_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3133_c30_9ac4_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l3133_c30_9ac4_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l3133_c19_0ced]
signal BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l3134_c20_5956]
signal MUX_uxn_opcodes_h_l3134_c20_5956_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3134_c20_5956_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l3134_c20_5956_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l3134_c20_5956_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l3134_c2_d7be]
signal BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_return_output : unsigned(12 downto 0);

-- stack_ram_update[uxn_opcodes_h_l3136_c21_67d1]
signal stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_stack_address : unsigned(11 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_return_output : unsigned(7 downto 0);

-- device_ram_update[uxn_opcodes_h_l3142_c26_3775]
signal device_ram_update_uxn_opcodes_h_l3142_c26_3775_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3142_c26_3775_device_address : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3142_c26_3775_value : unsigned(7 downto 0);
signal device_ram_update_uxn_opcodes_h_l3142_c26_3775_write_enable : unsigned(0 downto 0);
signal device_ram_update_uxn_opcodes_h_l3142_c26_3775_return_output : unsigned(7 downto 0);

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
-- BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3
BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_left,
BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_right,
BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a
BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_left,
BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_right,
BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9
BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_left,
BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_right,
BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_return_output);

-- CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0
CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0_x,
CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0_return_output);

-- MUX_uxn_opcodes_h_l3045_c10_6d30
MUX_uxn_opcodes_h_l3045_c10_6d30 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3045_c10_6d30_cond,
MUX_uxn_opcodes_h_l3045_c10_6d30_iftrue,
MUX_uxn_opcodes_h_l3045_c10_6d30_iffalse,
MUX_uxn_opcodes_h_l3045_c10_6d30_return_output);

-- printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae
printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae : entity work.printf_uxn_opcodes_h_l3048_c2_acae_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg0,
printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg1,
printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb
BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_left,
BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_right,
BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3050_c2_296b
opc_result_MUX_uxn_opcodes_h_l3050_c2_296b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_cond,
opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232
BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232 : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_left,
BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_right,
BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2
opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_cond,
opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_iftrue,
opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_iffalse,
opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output);

-- jci_uxn_opcodes_h_l3051_c41_7c05
jci_uxn_opcodes_h_l3051_c41_7c05 : entity work.jci_0CLK_9ff5fd8d port map (
clk,
jci_uxn_opcodes_h_l3051_c41_7c05_CLOCK_ENABLE,
jci_uxn_opcodes_h_l3051_c41_7c05_phase,
jci_uxn_opcodes_h_l3051_c41_7c05_pc,
jci_uxn_opcodes_h_l3051_c41_7c05_previous_stack_read,
jci_uxn_opcodes_h_l3051_c41_7c05_previous_ram_read,
jci_uxn_opcodes_h_l3051_c41_7c05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad
BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_left,
BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_right,
BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3052_c7_4389
opc_result_MUX_uxn_opcodes_h_l3052_c7_4389 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_cond,
opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_iftrue,
opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_iffalse,
opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_return_output);

-- jmi_uxn_opcodes_h_l3052_c41_4d8a
jmi_uxn_opcodes_h_l3052_c41_4d8a : entity work.jmi_0CLK_e573058b port map (
clk,
jmi_uxn_opcodes_h_l3052_c41_4d8a_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l3052_c41_4d8a_phase,
jmi_uxn_opcodes_h_l3052_c41_4d8a_pc,
jmi_uxn_opcodes_h_l3052_c41_4d8a_previous_ram_read,
jmi_uxn_opcodes_h_l3052_c41_4d8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf
BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_left,
BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_right,
BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3053_c7_f676
opc_result_MUX_uxn_opcodes_h_l3053_c7_f676 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_cond,
opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_iftrue,
opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_iffalse,
opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_return_output);

-- jsi_uxn_opcodes_h_l3053_c41_39ec
jsi_uxn_opcodes_h_l3053_c41_39ec : entity work.jsi_0CLK_06911bbe port map (
clk,
jsi_uxn_opcodes_h_l3053_c41_39ec_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l3053_c41_39ec_phase,
jsi_uxn_opcodes_h_l3053_c41_39ec_pc,
jsi_uxn_opcodes_h_l3053_c41_39ec_previous_ram_read,
jsi_uxn_opcodes_h_l3053_c41_39ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_left,
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_right,
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59
opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_cond,
opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_iftrue,
opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_iffalse,
opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output);

-- lit_uxn_opcodes_h_l3054_c41_088e
lit_uxn_opcodes_h_l3054_c41_088e : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l3054_c41_088e_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3054_c41_088e_phase,
lit_uxn_opcodes_h_l3054_c41_088e_pc,
lit_uxn_opcodes_h_l3054_c41_088e_previous_ram_read,
lit_uxn_opcodes_h_l3054_c41_088e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef
BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_left,
BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_right,
BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5
opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_cond,
opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output);

-- lit2_uxn_opcodes_h_l3055_c41_25f7
lit2_uxn_opcodes_h_l3055_c41_25f7 : entity work.lit2_0CLK_7c2e709f port map (
clk,
lit2_uxn_opcodes_h_l3055_c41_25f7_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3055_c41_25f7_phase,
lit2_uxn_opcodes_h_l3055_c41_25f7_pc,
lit2_uxn_opcodes_h_l3055_c41_25f7_previous_ram_read,
lit2_uxn_opcodes_h_l3055_c41_25f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2
BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_left,
BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_right,
BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e
opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_cond,
opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output);

-- lit_uxn_opcodes_h_l3056_c41_e625
lit_uxn_opcodes_h_l3056_c41_e625 : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l3056_c41_e625_CLOCK_ENABLE,
lit_uxn_opcodes_h_l3056_c41_e625_phase,
lit_uxn_opcodes_h_l3056_c41_e625_pc,
lit_uxn_opcodes_h_l3056_c41_e625_previous_ram_read,
lit_uxn_opcodes_h_l3056_c41_e625_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_left,
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_right,
BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3057_c7_6900
opc_result_MUX_uxn_opcodes_h_l3057_c7_6900 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_cond,
opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_iftrue,
opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_iffalse,
opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_return_output);

-- lit2_uxn_opcodes_h_l3057_c41_1477
lit2_uxn_opcodes_h_l3057_c41_1477 : entity work.lit2_0CLK_7c2e709f port map (
clk,
lit2_uxn_opcodes_h_l3057_c41_1477_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l3057_c41_1477_phase,
lit2_uxn_opcodes_h_l3057_c41_1477_pc,
lit2_uxn_opcodes_h_l3057_c41_1477_previous_ram_read,
lit2_uxn_opcodes_h_l3057_c41_1477_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4 : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_left,
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_right,
BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3058_c7_3864
opc_result_MUX_uxn_opcodes_h_l3058_c7_3864 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_cond,
opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_iftrue,
opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_iffalse,
opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_return_output);

-- inc_uxn_opcodes_h_l3058_c41_f56c
inc_uxn_opcodes_h_l3058_c41_f56c : entity work.inc_0CLK_b7103d16 port map (
clk,
inc_uxn_opcodes_h_l3058_c41_f56c_CLOCK_ENABLE,
inc_uxn_opcodes_h_l3058_c41_f56c_phase,
inc_uxn_opcodes_h_l3058_c41_f56c_ins,
inc_uxn_opcodes_h_l3058_c41_f56c_previous_stack_read,
inc_uxn_opcodes_h_l3058_c41_f56c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_left,
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_right,
BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3059_c7_640d
opc_result_MUX_uxn_opcodes_h_l3059_c7_640d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_cond,
opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_return_output);

-- inc2_uxn_opcodes_h_l3059_c41_b410
inc2_uxn_opcodes_h_l3059_c41_b410 : entity work.inc2_0CLK_861257cf port map (
clk,
inc2_uxn_opcodes_h_l3059_c41_b410_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l3059_c41_b410_phase,
inc2_uxn_opcodes_h_l3059_c41_b410_ins,
inc2_uxn_opcodes_h_l3059_c41_b410_previous_stack_read,
inc2_uxn_opcodes_h_l3059_c41_b410_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_left,
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_right,
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3060_c7_1592
opc_result_MUX_uxn_opcodes_h_l3060_c7_1592 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_cond,
opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_iftrue,
opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_iffalse,
opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_return_output);

-- pop_uxn_opcodes_h_l3060_c41_6fa2
pop_uxn_opcodes_h_l3060_c41_6fa2 : entity work.pop_0CLK_bd0fc640 port map (
clk,
pop_uxn_opcodes_h_l3060_c41_6fa2_CLOCK_ENABLE,
pop_uxn_opcodes_h_l3060_c41_6fa2_phase,
pop_uxn_opcodes_h_l3060_c41_6fa2_ins,
pop_uxn_opcodes_h_l3060_c41_6fa2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_left,
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_right,
BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5
opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_cond,
opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output);

-- pop2_uxn_opcodes_h_l3061_c41_5cc5
pop2_uxn_opcodes_h_l3061_c41_5cc5 : entity work.pop2_0CLK_bd0fc640 port map (
clk,
pop2_uxn_opcodes_h_l3061_c41_5cc5_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l3061_c41_5cc5_phase,
pop2_uxn_opcodes_h_l3061_c41_5cc5_ins,
pop2_uxn_opcodes_h_l3061_c41_5cc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_left,
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_right,
BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef
opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_cond,
opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_iftrue,
opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_iffalse,
opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output);

-- nip_uxn_opcodes_h_l3062_c41_ab84
nip_uxn_opcodes_h_l3062_c41_ab84 : entity work.nip_0CLK_a9f1e08f port map (
clk,
nip_uxn_opcodes_h_l3062_c41_ab84_CLOCK_ENABLE,
nip_uxn_opcodes_h_l3062_c41_ab84_phase,
nip_uxn_opcodes_h_l3062_c41_ab84_ins,
nip_uxn_opcodes_h_l3062_c41_ab84_previous_stack_read,
nip_uxn_opcodes_h_l3062_c41_ab84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_left,
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_right,
BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad
opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_cond,
opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_iftrue,
opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_iffalse,
opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output);

-- nip2_uxn_opcodes_h_l3063_c41_0eb4
nip2_uxn_opcodes_h_l3063_c41_0eb4 : entity work.nip2_0CLK_15c648e1 port map (
clk,
nip2_uxn_opcodes_h_l3063_c41_0eb4_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l3063_c41_0eb4_phase,
nip2_uxn_opcodes_h_l3063_c41_0eb4_ins,
nip2_uxn_opcodes_h_l3063_c41_0eb4_previous_stack_read,
nip2_uxn_opcodes_h_l3063_c41_0eb4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_left,
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_right,
BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8
opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_cond,
opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output);

-- swp_uxn_opcodes_h_l3064_c41_558c
swp_uxn_opcodes_h_l3064_c41_558c : entity work.swp_0CLK_bf6dd460 port map (
clk,
swp_uxn_opcodes_h_l3064_c41_558c_CLOCK_ENABLE,
swp_uxn_opcodes_h_l3064_c41_558c_phase,
swp_uxn_opcodes_h_l3064_c41_558c_ins,
swp_uxn_opcodes_h_l3064_c41_558c_previous_stack_read,
swp_uxn_opcodes_h_l3064_c41_558c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_left,
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_right,
BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7
opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_cond,
opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output);

-- swp2_uxn_opcodes_h_l3065_c41_841a
swp2_uxn_opcodes_h_l3065_c41_841a : entity work.swp2_0CLK_27acc40e port map (
clk,
swp2_uxn_opcodes_h_l3065_c41_841a_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l3065_c41_841a_phase,
swp2_uxn_opcodes_h_l3065_c41_841a_ins,
swp2_uxn_opcodes_h_l3065_c41_841a_previous_stack_read,
swp2_uxn_opcodes_h_l3065_c41_841a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_left,
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_right,
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6
opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_cond,
opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_iftrue,
opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_iffalse,
opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output);

-- rot_uxn_opcodes_h_l3066_c41_5be6
rot_uxn_opcodes_h_l3066_c41_5be6 : entity work.rot_0CLK_97b3b4bb port map (
clk,
rot_uxn_opcodes_h_l3066_c41_5be6_CLOCK_ENABLE,
rot_uxn_opcodes_h_l3066_c41_5be6_phase,
rot_uxn_opcodes_h_l3066_c41_5be6_ins,
rot_uxn_opcodes_h_l3066_c41_5be6_previous_stack_read,
rot_uxn_opcodes_h_l3066_c41_5be6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_left,
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_right,
BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0
opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_cond,
opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_iftrue,
opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_iffalse,
opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output);

-- rot2_uxn_opcodes_h_l3067_c41_2ef8
rot2_uxn_opcodes_h_l3067_c41_2ef8 : entity work.rot2_0CLK_fc44b089 port map (
clk,
rot2_uxn_opcodes_h_l3067_c41_2ef8_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l3067_c41_2ef8_phase,
rot2_uxn_opcodes_h_l3067_c41_2ef8_ins,
rot2_uxn_opcodes_h_l3067_c41_2ef8_previous_stack_read,
rot2_uxn_opcodes_h_l3067_c41_2ef8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_left,
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_right,
BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e
opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_cond,
opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output);

-- dup_uxn_opcodes_h_l3068_c41_2924
dup_uxn_opcodes_h_l3068_c41_2924 : entity work.dup_0CLK_6be78140 port map (
clk,
dup_uxn_opcodes_h_l3068_c41_2924_CLOCK_ENABLE,
dup_uxn_opcodes_h_l3068_c41_2924_phase,
dup_uxn_opcodes_h_l3068_c41_2924_ins,
dup_uxn_opcodes_h_l3068_c41_2924_previous_stack_read,
dup_uxn_opcodes_h_l3068_c41_2924_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_left,
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_right,
BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6
opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_cond,
opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_iftrue,
opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_iffalse,
opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output);

-- dup2_uxn_opcodes_h_l3069_c41_30ff
dup2_uxn_opcodes_h_l3069_c41_30ff : entity work.dup2_0CLK_be266937 port map (
clk,
dup2_uxn_opcodes_h_l3069_c41_30ff_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l3069_c41_30ff_phase,
dup2_uxn_opcodes_h_l3069_c41_30ff_ins,
dup2_uxn_opcodes_h_l3069_c41_30ff_previous_stack_read,
dup2_uxn_opcodes_h_l3069_c41_30ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_left,
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_right,
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7
opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_cond,
opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output);

-- ovr_uxn_opcodes_h_l3070_c41_47c7
ovr_uxn_opcodes_h_l3070_c41_47c7 : entity work.ovr_0CLK_a1f536f9 port map (
clk,
ovr_uxn_opcodes_h_l3070_c41_47c7_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l3070_c41_47c7_phase,
ovr_uxn_opcodes_h_l3070_c41_47c7_ins,
ovr_uxn_opcodes_h_l3070_c41_47c7_previous_stack_read,
ovr_uxn_opcodes_h_l3070_c41_47c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_left,
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_right,
BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b
opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_cond,
opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output);

-- ovr2_uxn_opcodes_h_l3071_c41_1a57
ovr2_uxn_opcodes_h_l3071_c41_1a57 : entity work.ovr2_0CLK_a10f7d9d port map (
clk,
ovr2_uxn_opcodes_h_l3071_c41_1a57_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l3071_c41_1a57_phase,
ovr2_uxn_opcodes_h_l3071_c41_1a57_ins,
ovr2_uxn_opcodes_h_l3071_c41_1a57_previous_stack_read,
ovr2_uxn_opcodes_h_l3071_c41_1a57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_left,
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_right,
BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70
opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_cond,
opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_iftrue,
opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_iffalse,
opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output);

-- equ_uxn_opcodes_h_l3072_c41_9c9f
equ_uxn_opcodes_h_l3072_c41_9c9f : entity work.equ_0CLK_6d7675a8 port map (
clk,
equ_uxn_opcodes_h_l3072_c41_9c9f_CLOCK_ENABLE,
equ_uxn_opcodes_h_l3072_c41_9c9f_phase,
equ_uxn_opcodes_h_l3072_c41_9c9f_ins,
equ_uxn_opcodes_h_l3072_c41_9c9f_previous_stack_read,
equ_uxn_opcodes_h_l3072_c41_9c9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_left,
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_right,
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3073_c7_c813
opc_result_MUX_uxn_opcodes_h_l3073_c7_c813 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_cond,
opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_iftrue,
opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_iffalse,
opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_return_output);

-- equ2_uxn_opcodes_h_l3073_c41_33cd
equ2_uxn_opcodes_h_l3073_c41_33cd : entity work.equ2_0CLK_c96e1a89 port map (
clk,
equ2_uxn_opcodes_h_l3073_c41_33cd_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l3073_c41_33cd_phase,
equ2_uxn_opcodes_h_l3073_c41_33cd_ins,
equ2_uxn_opcodes_h_l3073_c41_33cd_previous_stack_read,
equ2_uxn_opcodes_h_l3073_c41_33cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_left,
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_right,
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8
opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_cond,
opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output);

-- neq_uxn_opcodes_h_l3074_c41_0bb7
neq_uxn_opcodes_h_l3074_c41_0bb7 : entity work.neq_0CLK_6d7675a8 port map (
clk,
neq_uxn_opcodes_h_l3074_c41_0bb7_CLOCK_ENABLE,
neq_uxn_opcodes_h_l3074_c41_0bb7_phase,
neq_uxn_opcodes_h_l3074_c41_0bb7_ins,
neq_uxn_opcodes_h_l3074_c41_0bb7_previous_stack_read,
neq_uxn_opcodes_h_l3074_c41_0bb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_left,
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_right,
BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5
opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_cond,
opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_iftrue,
opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_iffalse,
opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output);

-- neq2_uxn_opcodes_h_l3075_c41_c5ab
neq2_uxn_opcodes_h_l3075_c41_c5ab : entity work.neq2_0CLK_c96e1a89 port map (
clk,
neq2_uxn_opcodes_h_l3075_c41_c5ab_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l3075_c41_c5ab_phase,
neq2_uxn_opcodes_h_l3075_c41_c5ab_ins,
neq2_uxn_opcodes_h_l3075_c41_c5ab_previous_stack_read,
neq2_uxn_opcodes_h_l3075_c41_c5ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_left,
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_right,
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8
opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_cond,
opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output);

-- gth_uxn_opcodes_h_l3076_c41_2dbf
gth_uxn_opcodes_h_l3076_c41_2dbf : entity work.gth_0CLK_6d7675a8 port map (
clk,
gth_uxn_opcodes_h_l3076_c41_2dbf_CLOCK_ENABLE,
gth_uxn_opcodes_h_l3076_c41_2dbf_phase,
gth_uxn_opcodes_h_l3076_c41_2dbf_ins,
gth_uxn_opcodes_h_l3076_c41_2dbf_previous_stack_read,
gth_uxn_opcodes_h_l3076_c41_2dbf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_left,
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_right,
BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48
opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_cond,
opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_iftrue,
opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_iffalse,
opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output);

-- gth2_uxn_opcodes_h_l3077_c41_241c
gth2_uxn_opcodes_h_l3077_c41_241c : entity work.gth2_0CLK_c96e1a89 port map (
clk,
gth2_uxn_opcodes_h_l3077_c41_241c_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l3077_c41_241c_phase,
gth2_uxn_opcodes_h_l3077_c41_241c_ins,
gth2_uxn_opcodes_h_l3077_c41_241c_previous_stack_read,
gth2_uxn_opcodes_h_l3077_c41_241c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_left,
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_right,
BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18
opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_cond,
opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_iftrue,
opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_iffalse,
opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output);

-- lth_uxn_opcodes_h_l3078_c41_b6d8
lth_uxn_opcodes_h_l3078_c41_b6d8 : entity work.lth_0CLK_6d7675a8 port map (
clk,
lth_uxn_opcodes_h_l3078_c41_b6d8_CLOCK_ENABLE,
lth_uxn_opcodes_h_l3078_c41_b6d8_phase,
lth_uxn_opcodes_h_l3078_c41_b6d8_ins,
lth_uxn_opcodes_h_l3078_c41_b6d8_previous_stack_read,
lth_uxn_opcodes_h_l3078_c41_b6d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_left,
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_right,
BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c
opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_cond,
opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output);

-- lth2_uxn_opcodes_h_l3079_c41_02fd
lth2_uxn_opcodes_h_l3079_c41_02fd : entity work.lth2_0CLK_c96e1a89 port map (
clk,
lth2_uxn_opcodes_h_l3079_c41_02fd_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l3079_c41_02fd_phase,
lth2_uxn_opcodes_h_l3079_c41_02fd_ins,
lth2_uxn_opcodes_h_l3079_c41_02fd_previous_stack_read,
lth2_uxn_opcodes_h_l3079_c41_02fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_left,
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_right,
BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7
opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_cond,
opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_iftrue,
opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_iffalse,
opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output);

-- jmp_uxn_opcodes_h_l3080_c41_e2f4
jmp_uxn_opcodes_h_l3080_c41_e2f4 : entity work.jmp_0CLK_b7103d16 port map (
clk,
jmp_uxn_opcodes_h_l3080_c41_e2f4_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l3080_c41_e2f4_phase,
jmp_uxn_opcodes_h_l3080_c41_e2f4_ins,
jmp_uxn_opcodes_h_l3080_c41_e2f4_pc,
jmp_uxn_opcodes_h_l3080_c41_e2f4_previous_stack_read,
jmp_uxn_opcodes_h_l3080_c41_e2f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_left,
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_right,
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50
opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_cond,
opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_iftrue,
opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_iffalse,
opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output);

-- jmp2_uxn_opcodes_h_l3081_c41_2137
jmp2_uxn_opcodes_h_l3081_c41_2137 : entity work.jmp2_0CLK_be70b838 port map (
clk,
jmp2_uxn_opcodes_h_l3081_c41_2137_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l3081_c41_2137_phase,
jmp2_uxn_opcodes_h_l3081_c41_2137_ins,
jmp2_uxn_opcodes_h_l3081_c41_2137_previous_stack_read,
jmp2_uxn_opcodes_h_l3081_c41_2137_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_left,
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_right,
BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3082_c7_840f
opc_result_MUX_uxn_opcodes_h_l3082_c7_840f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_cond,
opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_return_output);

-- jcn_uxn_opcodes_h_l3082_c41_0418
jcn_uxn_opcodes_h_l3082_c41_0418 : entity work.jcn_0CLK_b288bfb7 port map (
clk,
jcn_uxn_opcodes_h_l3082_c41_0418_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l3082_c41_0418_phase,
jcn_uxn_opcodes_h_l3082_c41_0418_ins,
jcn_uxn_opcodes_h_l3082_c41_0418_pc,
jcn_uxn_opcodes_h_l3082_c41_0418_previous_stack_read,
jcn_uxn_opcodes_h_l3082_c41_0418_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_left,
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_right,
BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3083_c7_f004
opc_result_MUX_uxn_opcodes_h_l3083_c7_f004 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_cond,
opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_iftrue,
opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_iffalse,
opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_return_output);

-- jcn2_uxn_opcodes_h_l3083_c41_0ec7
jcn2_uxn_opcodes_h_l3083_c41_0ec7 : entity work.jcn2_0CLK_f91b0bf2 port map (
clk,
jcn2_uxn_opcodes_h_l3083_c41_0ec7_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l3083_c41_0ec7_phase,
jcn2_uxn_opcodes_h_l3083_c41_0ec7_ins,
jcn2_uxn_opcodes_h_l3083_c41_0ec7_previous_stack_read,
jcn2_uxn_opcodes_h_l3083_c41_0ec7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_left,
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_right,
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8
opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_cond,
opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_iftrue,
opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_iffalse,
opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output);

-- jsr_uxn_opcodes_h_l3084_c41_d8d7
jsr_uxn_opcodes_h_l3084_c41_d8d7 : entity work.jsr_0CLK_4f993427 port map (
clk,
jsr_uxn_opcodes_h_l3084_c41_d8d7_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l3084_c41_d8d7_phase,
jsr_uxn_opcodes_h_l3084_c41_d8d7_ins,
jsr_uxn_opcodes_h_l3084_c41_d8d7_pc,
jsr_uxn_opcodes_h_l3084_c41_d8d7_previous_stack_read,
jsr_uxn_opcodes_h_l3084_c41_d8d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_left,
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_right,
BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3085_c7_c003
opc_result_MUX_uxn_opcodes_h_l3085_c7_c003 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_cond,
opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_iftrue,
opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_iffalse,
opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_return_output);

-- jsr2_uxn_opcodes_h_l3085_c41_3bcb
jsr2_uxn_opcodes_h_l3085_c41_3bcb : entity work.jsr2_0CLK_6e0dc44d port map (
clk,
jsr2_uxn_opcodes_h_l3085_c41_3bcb_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l3085_c41_3bcb_phase,
jsr2_uxn_opcodes_h_l3085_c41_3bcb_ins,
jsr2_uxn_opcodes_h_l3085_c41_3bcb_pc,
jsr2_uxn_opcodes_h_l3085_c41_3bcb_previous_stack_read,
jsr2_uxn_opcodes_h_l3085_c41_3bcb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_left,
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_right,
BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3086_c7_581b
opc_result_MUX_uxn_opcodes_h_l3086_c7_581b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_cond,
opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_return_output);

-- sth_uxn_opcodes_h_l3086_c41_219a
sth_uxn_opcodes_h_l3086_c41_219a : entity work.sth_0CLK_85d5529e port map (
clk,
sth_uxn_opcodes_h_l3086_c41_219a_CLOCK_ENABLE,
sth_uxn_opcodes_h_l3086_c41_219a_phase,
sth_uxn_opcodes_h_l3086_c41_219a_ins,
sth_uxn_opcodes_h_l3086_c41_219a_previous_stack_read,
sth_uxn_opcodes_h_l3086_c41_219a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_left,
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_right,
BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71
opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_cond,
opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_iftrue,
opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_iffalse,
opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output);

-- sth2_uxn_opcodes_h_l3087_c41_de17
sth2_uxn_opcodes_h_l3087_c41_de17 : entity work.sth2_0CLK_f91b0bf2 port map (
clk,
sth2_uxn_opcodes_h_l3087_c41_de17_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l3087_c41_de17_phase,
sth2_uxn_opcodes_h_l3087_c41_de17_ins,
sth2_uxn_opcodes_h_l3087_c41_de17_previous_stack_read,
sth2_uxn_opcodes_h_l3087_c41_de17_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_left,
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_right,
BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c
opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_cond,
opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_iftrue,
opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_iffalse,
opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output);

-- ldz_uxn_opcodes_h_l3088_c41_e869
ldz_uxn_opcodes_h_l3088_c41_e869 : entity work.ldz_0CLK_46731a7b port map (
clk,
ldz_uxn_opcodes_h_l3088_c41_e869_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l3088_c41_e869_phase,
ldz_uxn_opcodes_h_l3088_c41_e869_ins,
ldz_uxn_opcodes_h_l3088_c41_e869_previous_stack_read,
ldz_uxn_opcodes_h_l3088_c41_e869_previous_ram_read,
ldz_uxn_opcodes_h_l3088_c41_e869_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_left,
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_right,
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef
opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_cond,
opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_iftrue,
opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_iffalse,
opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output);

-- ldz2_uxn_opcodes_h_l3089_c41_67c0
ldz2_uxn_opcodes_h_l3089_c41_67c0 : entity work.ldz2_0CLK_1417ec42 port map (
clk,
ldz2_uxn_opcodes_h_l3089_c41_67c0_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l3089_c41_67c0_phase,
ldz2_uxn_opcodes_h_l3089_c41_67c0_ins,
ldz2_uxn_opcodes_h_l3089_c41_67c0_previous_stack_read,
ldz2_uxn_opcodes_h_l3089_c41_67c0_previous_ram_read,
ldz2_uxn_opcodes_h_l3089_c41_67c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_left,
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_right,
BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b
opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_cond,
opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_iftrue,
opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_iffalse,
opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output);

-- stz_uxn_opcodes_h_l3090_c41_44a3
stz_uxn_opcodes_h_l3090_c41_44a3 : entity work.stz_0CLK_75b4bee3 port map (
clk,
stz_uxn_opcodes_h_l3090_c41_44a3_CLOCK_ENABLE,
stz_uxn_opcodes_h_l3090_c41_44a3_phase,
stz_uxn_opcodes_h_l3090_c41_44a3_ins,
stz_uxn_opcodes_h_l3090_c41_44a3_previous_stack_read,
stz_uxn_opcodes_h_l3090_c41_44a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_left,
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_right,
BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1
opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_cond,
opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output);

-- stz2_uxn_opcodes_h_l3091_c41_13cd
stz2_uxn_opcodes_h_l3091_c41_13cd : entity work.stz2_0CLK_f2c34df9 port map (
clk,
stz2_uxn_opcodes_h_l3091_c41_13cd_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l3091_c41_13cd_phase,
stz2_uxn_opcodes_h_l3091_c41_13cd_ins,
stz2_uxn_opcodes_h_l3091_c41_13cd_previous_stack_read,
stz2_uxn_opcodes_h_l3091_c41_13cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_left,
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_right,
BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3092_c7_f813
opc_result_MUX_uxn_opcodes_h_l3092_c7_f813 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_cond,
opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_iftrue,
opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_iffalse,
opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_return_output);

-- ldr_uxn_opcodes_h_l3092_c41_e3f1
ldr_uxn_opcodes_h_l3092_c41_e3f1 : entity work.ldr_0CLK_a6885b22 port map (
clk,
ldr_uxn_opcodes_h_l3092_c41_e3f1_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l3092_c41_e3f1_phase,
ldr_uxn_opcodes_h_l3092_c41_e3f1_ins,
ldr_uxn_opcodes_h_l3092_c41_e3f1_pc,
ldr_uxn_opcodes_h_l3092_c41_e3f1_previous_stack_read,
ldr_uxn_opcodes_h_l3092_c41_e3f1_previous_ram_read,
ldr_uxn_opcodes_h_l3092_c41_e3f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_left,
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_right,
BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3093_c7_d458
opc_result_MUX_uxn_opcodes_h_l3093_c7_d458 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_cond,
opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_iftrue,
opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_iffalse,
opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_return_output);

-- ldr2_uxn_opcodes_h_l3093_c41_04d3
ldr2_uxn_opcodes_h_l3093_c41_04d3 : entity work.ldr2_0CLK_1417ec42 port map (
clk,
ldr2_uxn_opcodes_h_l3093_c41_04d3_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l3093_c41_04d3_phase,
ldr2_uxn_opcodes_h_l3093_c41_04d3_ins,
ldr2_uxn_opcodes_h_l3093_c41_04d3_pc,
ldr2_uxn_opcodes_h_l3093_c41_04d3_previous_stack_read,
ldr2_uxn_opcodes_h_l3093_c41_04d3_previous_ram_read,
ldr2_uxn_opcodes_h_l3093_c41_04d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_left,
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_right,
BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23
opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_cond,
opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_iftrue,
opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_iffalse,
opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output);

-- str1_uxn_opcodes_h_l3094_c41_de08
str1_uxn_opcodes_h_l3094_c41_de08 : entity work.str1_0CLK_90cbec6a port map (
clk,
str1_uxn_opcodes_h_l3094_c41_de08_CLOCK_ENABLE,
str1_uxn_opcodes_h_l3094_c41_de08_phase,
str1_uxn_opcodes_h_l3094_c41_de08_ins,
str1_uxn_opcodes_h_l3094_c41_de08_pc,
str1_uxn_opcodes_h_l3094_c41_de08_previous_stack_read,
str1_uxn_opcodes_h_l3094_c41_de08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_left,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_right,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e
opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_cond,
opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output);

-- str2_uxn_opcodes_h_l3095_c41_27e8
str2_uxn_opcodes_h_l3095_c41_27e8 : entity work.str2_0CLK_f2c34df9 port map (
clk,
str2_uxn_opcodes_h_l3095_c41_27e8_CLOCK_ENABLE,
str2_uxn_opcodes_h_l3095_c41_27e8_phase,
str2_uxn_opcodes_h_l3095_c41_27e8_ins,
str2_uxn_opcodes_h_l3095_c41_27e8_pc,
str2_uxn_opcodes_h_l3095_c41_27e8_previous_stack_read,
str2_uxn_opcodes_h_l3095_c41_27e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_left,
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_right,
BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab
opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_cond,
opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_iftrue,
opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_iffalse,
opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output);

-- lda_uxn_opcodes_h_l3096_c41_7212
lda_uxn_opcodes_h_l3096_c41_7212 : entity work.lda_0CLK_05e131b1 port map (
clk,
lda_uxn_opcodes_h_l3096_c41_7212_CLOCK_ENABLE,
lda_uxn_opcodes_h_l3096_c41_7212_phase,
lda_uxn_opcodes_h_l3096_c41_7212_ins,
lda_uxn_opcodes_h_l3096_c41_7212_previous_stack_read,
lda_uxn_opcodes_h_l3096_c41_7212_previous_ram_read,
lda_uxn_opcodes_h_l3096_c41_7212_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_left,
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_right,
BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3097_c7_f428
opc_result_MUX_uxn_opcodes_h_l3097_c7_f428 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_cond,
opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_iftrue,
opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_iffalse,
opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_return_output);

-- lda2_uxn_opcodes_h_l3097_c41_91a8
lda2_uxn_opcodes_h_l3097_c41_91a8 : entity work.lda2_0CLK_c8be2b47 port map (
clk,
lda2_uxn_opcodes_h_l3097_c41_91a8_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l3097_c41_91a8_phase,
lda2_uxn_opcodes_h_l3097_c41_91a8_ins,
lda2_uxn_opcodes_h_l3097_c41_91a8_previous_stack_read,
lda2_uxn_opcodes_h_l3097_c41_91a8_previous_ram_read,
lda2_uxn_opcodes_h_l3097_c41_91a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_left,
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_right,
BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3098_c7_9114
opc_result_MUX_uxn_opcodes_h_l3098_c7_9114 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_cond,
opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_iftrue,
opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_iffalse,
opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_return_output);

-- sta_uxn_opcodes_h_l3098_c41_1e9d
sta_uxn_opcodes_h_l3098_c41_1e9d : entity work.sta_0CLK_89f6ba96 port map (
clk,
sta_uxn_opcodes_h_l3098_c41_1e9d_CLOCK_ENABLE,
sta_uxn_opcodes_h_l3098_c41_1e9d_phase,
sta_uxn_opcodes_h_l3098_c41_1e9d_ins,
sta_uxn_opcodes_h_l3098_c41_1e9d_previous_stack_read,
sta_uxn_opcodes_h_l3098_c41_1e9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_left,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_right,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3099_c7_032d
opc_result_MUX_uxn_opcodes_h_l3099_c7_032d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_cond,
opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_return_output);

-- sta2_uxn_opcodes_h_l3099_c41_9428
sta2_uxn_opcodes_h_l3099_c41_9428 : entity work.sta2_0CLK_44f2ccf6 port map (
clk,
sta2_uxn_opcodes_h_l3099_c41_9428_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l3099_c41_9428_phase,
sta2_uxn_opcodes_h_l3099_c41_9428_ins,
sta2_uxn_opcodes_h_l3099_c41_9428_previous_stack_read,
sta2_uxn_opcodes_h_l3099_c41_9428_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_left,
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_right,
BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3100_c7_5545
opc_result_MUX_uxn_opcodes_h_l3100_c7_5545 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_cond,
opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_iftrue,
opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_iffalse,
opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_return_output);

-- dei_uxn_opcodes_h_l3100_c41_1971
dei_uxn_opcodes_h_l3100_c41_1971 : entity work.dei_0CLK_540d7a59 port map (
clk,
dei_uxn_opcodes_h_l3100_c41_1971_CLOCK_ENABLE,
dei_uxn_opcodes_h_l3100_c41_1971_phase,
dei_uxn_opcodes_h_l3100_c41_1971_ins,
dei_uxn_opcodes_h_l3100_c41_1971_previous_stack_read,
dei_uxn_opcodes_h_l3100_c41_1971_previous_device_ram_read,
dei_uxn_opcodes_h_l3100_c41_1971_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_left,
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_right,
BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09
opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_cond,
opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_iftrue,
opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_iffalse,
opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output);

-- dei2_uxn_opcodes_h_l3101_c41_4458
dei2_uxn_opcodes_h_l3101_c41_4458 : entity work.dei2_0CLK_5ef9c585 port map (
clk,
dei2_uxn_opcodes_h_l3101_c41_4458_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l3101_c41_4458_phase,
dei2_uxn_opcodes_h_l3101_c41_4458_ins,
dei2_uxn_opcodes_h_l3101_c41_4458_previous_stack_read,
dei2_uxn_opcodes_h_l3101_c41_4458_previous_device_ram_read,
dei2_uxn_opcodes_h_l3101_c41_4458_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_left,
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_right,
BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3102_c7_f017
opc_result_MUX_uxn_opcodes_h_l3102_c7_f017 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_cond,
opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_iftrue,
opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_iffalse,
opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_return_output);

-- deo_uxn_opcodes_h_l3102_c41_9326
deo_uxn_opcodes_h_l3102_c41_9326 : entity work.deo_0CLK_e53cbd5e port map (
clk,
deo_uxn_opcodes_h_l3102_c41_9326_CLOCK_ENABLE,
deo_uxn_opcodes_h_l3102_c41_9326_phase,
deo_uxn_opcodes_h_l3102_c41_9326_ins,
deo_uxn_opcodes_h_l3102_c41_9326_previous_stack_read,
deo_uxn_opcodes_h_l3102_c41_9326_previous_device_ram_read,
deo_uxn_opcodes_h_l3102_c41_9326_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_left,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_right,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f
opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_cond,
opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output);

-- deo2_uxn_opcodes_h_l3103_c41_07d8
deo2_uxn_opcodes_h_l3103_c41_07d8 : entity work.deo2_0CLK_c38f245c port map (
clk,
deo2_uxn_opcodes_h_l3103_c41_07d8_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l3103_c41_07d8_phase,
deo2_uxn_opcodes_h_l3103_c41_07d8_ins,
deo2_uxn_opcodes_h_l3103_c41_07d8_previous_stack_read,
deo2_uxn_opcodes_h_l3103_c41_07d8_previous_device_ram_read,
deo2_uxn_opcodes_h_l3103_c41_07d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_left,
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_right,
BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3104_c7_3839
opc_result_MUX_uxn_opcodes_h_l3104_c7_3839 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_cond,
opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_iftrue,
opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_iffalse,
opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_return_output);

-- add_uxn_opcodes_h_l3104_c41_f4a5
add_uxn_opcodes_h_l3104_c41_f4a5 : entity work.add_0CLK_f62d646e port map (
clk,
add_uxn_opcodes_h_l3104_c41_f4a5_CLOCK_ENABLE,
add_uxn_opcodes_h_l3104_c41_f4a5_phase,
add_uxn_opcodes_h_l3104_c41_f4a5_ins,
add_uxn_opcodes_h_l3104_c41_f4a5_previous_stack_read,
add_uxn_opcodes_h_l3104_c41_f4a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_left,
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_right,
BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d
opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_cond,
opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_iftrue,
opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_iffalse,
opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output);

-- add2_uxn_opcodes_h_l3105_c41_ed53
add2_uxn_opcodes_h_l3105_c41_ed53 : entity work.add2_0CLK_a7b4806f port map (
clk,
add2_uxn_opcodes_h_l3105_c41_ed53_CLOCK_ENABLE,
add2_uxn_opcodes_h_l3105_c41_ed53_phase,
add2_uxn_opcodes_h_l3105_c41_ed53_ins,
add2_uxn_opcodes_h_l3105_c41_ed53_previous_stack_read,
add2_uxn_opcodes_h_l3105_c41_ed53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_left,
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_right,
BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3106_c7_6081
opc_result_MUX_uxn_opcodes_h_l3106_c7_6081 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_cond,
opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_iftrue,
opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_iffalse,
opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_return_output);

-- sub_uxn_opcodes_h_l3106_c41_05d6
sub_uxn_opcodes_h_l3106_c41_05d6 : entity work.sub_0CLK_f62d646e port map (
clk,
sub_uxn_opcodes_h_l3106_c41_05d6_CLOCK_ENABLE,
sub_uxn_opcodes_h_l3106_c41_05d6_phase,
sub_uxn_opcodes_h_l3106_c41_05d6_ins,
sub_uxn_opcodes_h_l3106_c41_05d6_previous_stack_read,
sub_uxn_opcodes_h_l3106_c41_05d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_left,
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_right,
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3107_c7_9906
opc_result_MUX_uxn_opcodes_h_l3107_c7_9906 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_cond,
opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_iftrue,
opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_iffalse,
opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_return_output);

-- sub2_uxn_opcodes_h_l3107_c41_587b
sub2_uxn_opcodes_h_l3107_c41_587b : entity work.sub2_0CLK_a7b4806f port map (
clk,
sub2_uxn_opcodes_h_l3107_c41_587b_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l3107_c41_587b_phase,
sub2_uxn_opcodes_h_l3107_c41_587b_ins,
sub2_uxn_opcodes_h_l3107_c41_587b_previous_stack_read,
sub2_uxn_opcodes_h_l3107_c41_587b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_left,
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_right,
BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e
opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_cond,
opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_iftrue,
opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_iffalse,
opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output);

-- mul_uxn_opcodes_h_l3108_c41_f57d
mul_uxn_opcodes_h_l3108_c41_f57d : entity work.mul_0CLK_f62d646e port map (
clk,
mul_uxn_opcodes_h_l3108_c41_f57d_CLOCK_ENABLE,
mul_uxn_opcodes_h_l3108_c41_f57d_phase,
mul_uxn_opcodes_h_l3108_c41_f57d_ins,
mul_uxn_opcodes_h_l3108_c41_f57d_previous_stack_read,
mul_uxn_opcodes_h_l3108_c41_f57d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_left,
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_right,
BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc
opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_cond,
opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_iftrue,
opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_iffalse,
opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output);

-- mul2_uxn_opcodes_h_l3109_c41_f23e
mul2_uxn_opcodes_h_l3109_c41_f23e : entity work.mul2_0CLK_a7b4806f port map (
clk,
mul2_uxn_opcodes_h_l3109_c41_f23e_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l3109_c41_f23e_phase,
mul2_uxn_opcodes_h_l3109_c41_f23e_ins,
mul2_uxn_opcodes_h_l3109_c41_f23e_previous_stack_read,
mul2_uxn_opcodes_h_l3109_c41_f23e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_left,
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_right,
BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f
opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_cond,
opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_iftrue,
opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_iffalse,
opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output);

-- div_uxn_opcodes_h_l3110_c41_ff0f
div_uxn_opcodes_h_l3110_c41_ff0f : entity work.div_0CLK_af9273cc port map (
clk,
div_uxn_opcodes_h_l3110_c41_ff0f_CLOCK_ENABLE,
div_uxn_opcodes_h_l3110_c41_ff0f_phase,
div_uxn_opcodes_h_l3110_c41_ff0f_ins,
div_uxn_opcodes_h_l3110_c41_ff0f_previous_stack_read,
div_uxn_opcodes_h_l3110_c41_ff0f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_left,
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_right,
BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3111_c7_c842
opc_result_MUX_uxn_opcodes_h_l3111_c7_c842 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_cond,
opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_iftrue,
opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_iffalse,
opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_return_output);

-- div2_uxn_opcodes_h_l3111_c41_402b
div2_uxn_opcodes_h_l3111_c41_402b : entity work.div2_0CLK_db5cbd9a port map (
clk,
div2_uxn_opcodes_h_l3111_c41_402b_CLOCK_ENABLE,
div2_uxn_opcodes_h_l3111_c41_402b_phase,
div2_uxn_opcodes_h_l3111_c41_402b_ins,
div2_uxn_opcodes_h_l3111_c41_402b_previous_stack_read,
div2_uxn_opcodes_h_l3111_c41_402b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_left,
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_right,
BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3112_c7_c611
opc_result_MUX_uxn_opcodes_h_l3112_c7_c611 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_cond,
opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_iftrue,
opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_iffalse,
opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_return_output);

-- and_uxn_opcodes_h_l3112_c41_e361
and_uxn_opcodes_h_l3112_c41_e361 : entity work.and_0CLK_f62d646e port map (
clk,
and_uxn_opcodes_h_l3112_c41_e361_CLOCK_ENABLE,
and_uxn_opcodes_h_l3112_c41_e361_phase,
and_uxn_opcodes_h_l3112_c41_e361_ins,
and_uxn_opcodes_h_l3112_c41_e361_previous_stack_read,
and_uxn_opcodes_h_l3112_c41_e361_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_left,
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_right,
BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a
opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_cond,
opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output);

-- and2_uxn_opcodes_h_l3113_c41_fc34
and2_uxn_opcodes_h_l3113_c41_fc34 : entity work.and2_0CLK_a7b4806f port map (
clk,
and2_uxn_opcodes_h_l3113_c41_fc34_CLOCK_ENABLE,
and2_uxn_opcodes_h_l3113_c41_fc34_phase,
and2_uxn_opcodes_h_l3113_c41_fc34_ins,
and2_uxn_opcodes_h_l3113_c41_fc34_previous_stack_read,
and2_uxn_opcodes_h_l3113_c41_fc34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_left,
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_right,
BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3
opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_cond,
opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_iftrue,
opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_iffalse,
opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output);

-- ora_uxn_opcodes_h_l3114_c41_41a7
ora_uxn_opcodes_h_l3114_c41_41a7 : entity work.ora_0CLK_f62d646e port map (
clk,
ora_uxn_opcodes_h_l3114_c41_41a7_CLOCK_ENABLE,
ora_uxn_opcodes_h_l3114_c41_41a7_phase,
ora_uxn_opcodes_h_l3114_c41_41a7_ins,
ora_uxn_opcodes_h_l3114_c41_41a7_previous_stack_read,
ora_uxn_opcodes_h_l3114_c41_41a7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_left,
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_right,
BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3115_c7_a483
opc_result_MUX_uxn_opcodes_h_l3115_c7_a483 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_cond,
opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_iftrue,
opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_iffalse,
opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_return_output);

-- ora2_uxn_opcodes_h_l3115_c41_b611
ora2_uxn_opcodes_h_l3115_c41_b611 : entity work.ora2_0CLK_a7b4806f port map (
clk,
ora2_uxn_opcodes_h_l3115_c41_b611_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l3115_c41_b611_phase,
ora2_uxn_opcodes_h_l3115_c41_b611_ins,
ora2_uxn_opcodes_h_l3115_c41_b611_previous_stack_read,
ora2_uxn_opcodes_h_l3115_c41_b611_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_left,
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_right,
BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1
opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_cond,
opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output);

-- eor_uxn_opcodes_h_l3116_c41_0d60
eor_uxn_opcodes_h_l3116_c41_0d60 : entity work.eor_0CLK_f62d646e port map (
clk,
eor_uxn_opcodes_h_l3116_c41_0d60_CLOCK_ENABLE,
eor_uxn_opcodes_h_l3116_c41_0d60_phase,
eor_uxn_opcodes_h_l3116_c41_0d60_ins,
eor_uxn_opcodes_h_l3116_c41_0d60_previous_stack_read,
eor_uxn_opcodes_h_l3116_c41_0d60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_left,
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_right,
BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3117_c7_289a
opc_result_MUX_uxn_opcodes_h_l3117_c7_289a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_cond,
opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_iftrue,
opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_iffalse,
opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_return_output);

-- eor2_uxn_opcodes_h_l3117_c41_4356
eor2_uxn_opcodes_h_l3117_c41_4356 : entity work.eor2_0CLK_a7b4806f port map (
clk,
eor2_uxn_opcodes_h_l3117_c41_4356_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l3117_c41_4356_phase,
eor2_uxn_opcodes_h_l3117_c41_4356_ins,
eor2_uxn_opcodes_h_l3117_c41_4356_previous_stack_read,
eor2_uxn_opcodes_h_l3117_c41_4356_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_left,
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_right,
BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3118_c7_a136
opc_result_MUX_uxn_opcodes_h_l3118_c7_a136 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_cond,
opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_iftrue,
opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_iffalse,
opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_return_output);

-- sft_uxn_opcodes_h_l3118_c41_f38c
sft_uxn_opcodes_h_l3118_c41_f38c : entity work.sft_0CLK_7bf7ae34 port map (
clk,
sft_uxn_opcodes_h_l3118_c41_f38c_CLOCK_ENABLE,
sft_uxn_opcodes_h_l3118_c41_f38c_phase,
sft_uxn_opcodes_h_l3118_c41_f38c_ins,
sft_uxn_opcodes_h_l3118_c41_f38c_previous_stack_read,
sft_uxn_opcodes_h_l3118_c41_f38c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_left,
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_right,
BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_return_output);

-- opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1
opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_cond,
opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_iftrue,
opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_iffalse,
opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output);

-- sft2_uxn_opcodes_h_l3119_c41_ad2f
sft2_uxn_opcodes_h_l3119_c41_ad2f : entity work.sft2_0CLK_4392568d port map (
clk,
sft2_uxn_opcodes_h_l3119_c41_ad2f_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l3119_c41_ad2f_phase,
sft2_uxn_opcodes_h_l3119_c41_ad2f_ins,
sft2_uxn_opcodes_h_l3119_c41_ad2f_previous_stack_read,
sft2_uxn_opcodes_h_l3119_c41_ad2f_return_output);

-- printf_uxn_opcodes_h_l3120_c9_2a8b_uxn_opcodes_h_l3120_c9_2a8b
printf_uxn_opcodes_h_l3120_c9_2a8b_uxn_opcodes_h_l3120_c9_2a8b : entity work.printf_uxn_opcodes_h_l3120_c9_2a8b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3120_c9_2a8b_uxn_opcodes_h_l3120_c9_2a8b_CLOCK_ENABLE,
printf_uxn_opcodes_h_l3120_c9_2a8b_uxn_opcodes_h_l3120_c9_2a8b_arg0);

-- BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f
BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_left,
BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_right,
BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044
BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_left,
BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_right,
BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_return_output);

-- MUX_uxn_opcodes_h_l3122_c18_d5dc
MUX_uxn_opcodes_h_l3122_c18_d5dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3122_c18_d5dc_cond,
MUX_uxn_opcodes_h_l3122_c18_d5dc_iftrue,
MUX_uxn_opcodes_h_l3122_c18_d5dc_iffalse,
MUX_uxn_opcodes_h_l3122_c18_d5dc_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c
BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_left,
BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_right,
BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_return_output);

-- sp1_MUX_uxn_opcodes_h_l3125_c2_9a53
sp1_MUX_uxn_opcodes_h_l3125_c2_9a53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_cond,
sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_iftrue,
sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_iffalse,
sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output);

-- sp0_MUX_uxn_opcodes_h_l3125_c2_9a53
sp0_MUX_uxn_opcodes_h_l3125_c2_9a53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_cond,
sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_iftrue,
sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_iffalse,
sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output);

-- sp1_MUX_uxn_opcodes_h_l3126_c3_0638
sp1_MUX_uxn_opcodes_h_l3126_c3_0638 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l3126_c3_0638_cond,
sp1_MUX_uxn_opcodes_h_l3126_c3_0638_iftrue,
sp1_MUX_uxn_opcodes_h_l3126_c3_0638_iffalse,
sp1_MUX_uxn_opcodes_h_l3126_c3_0638_return_output);

-- sp0_MUX_uxn_opcodes_h_l3126_c3_0638
sp0_MUX_uxn_opcodes_h_l3126_c3_0638 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l3126_c3_0638_cond,
sp0_MUX_uxn_opcodes_h_l3126_c3_0638_iftrue,
sp0_MUX_uxn_opcodes_h_l3126_c3_0638_iffalse,
sp0_MUX_uxn_opcodes_h_l3126_c3_0638_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275
BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_left,
BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_right,
BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395
BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_left,
BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_right,
BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_return_output);

-- MUX_uxn_opcodes_h_l3133_c30_9ac4
MUX_uxn_opcodes_h_l3133_c30_9ac4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3133_c30_9ac4_cond,
MUX_uxn_opcodes_h_l3133_c30_9ac4_iftrue,
MUX_uxn_opcodes_h_l3133_c30_9ac4_iffalse,
MUX_uxn_opcodes_h_l3133_c30_9ac4_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced
BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_left,
BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_right,
BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_return_output);

-- MUX_uxn_opcodes_h_l3134_c20_5956
MUX_uxn_opcodes_h_l3134_c20_5956 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3134_c20_5956_cond,
MUX_uxn_opcodes_h_l3134_c20_5956_iftrue,
MUX_uxn_opcodes_h_l3134_c20_5956_iffalse,
MUX_uxn_opcodes_h_l3134_c20_5956_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be
BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be : entity work.BIN_OP_PLUS_uint12_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_left,
BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_right,
BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_return_output);

-- stack_ram_update_uxn_opcodes_h_l3136_c21_67d1
stack_ram_update_uxn_opcodes_h_l3136_c21_67d1 : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_stack_address,
stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_value,
stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_write_enable,
stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_return_output);

-- device_ram_update_uxn_opcodes_h_l3142_c26_3775
device_ram_update_uxn_opcodes_h_l3142_c26_3775 : entity work.device_ram_update_0CLK_23f04728 port map (
clk,
device_ram_update_uxn_opcodes_h_l3142_c26_3775_CLOCK_ENABLE,
device_ram_update_uxn_opcodes_h_l3142_c26_3775_device_address,
device_ram_update_uxn_opcodes_h_l3142_c26_3775_value,
device_ram_update_uxn_opcodes_h_l3142_c26_3775_write_enable,
device_ram_update_uxn_opcodes_h_l3142_c26_3775_return_output);



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
 BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_return_output,
 CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0_return_output,
 MUX_uxn_opcodes_h_l3045_c10_6d30_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output,
 opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_return_output,
 opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output,
 jci_uxn_opcodes_h_l3051_c41_7c05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_return_output,
 opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_return_output,
 jmi_uxn_opcodes_h_l3052_c41_4d8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output,
 opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_return_output,
 jsi_uxn_opcodes_h_l3053_c41_39ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output,
 lit_uxn_opcodes_h_l3054_c41_088e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output,
 lit2_uxn_opcodes_h_l3055_c41_25f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_return_output,
 opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output,
 lit_uxn_opcodes_h_l3056_c41_e625_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_return_output,
 opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_return_output,
 lit2_uxn_opcodes_h_l3057_c41_1477_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_return_output,
 inc_uxn_opcodes_h_l3058_c41_f56c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_return_output,
 opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_return_output,
 inc2_uxn_opcodes_h_l3059_c41_b410_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_return_output,
 pop_uxn_opcodes_h_l3060_c41_6fa2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output,
 opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output,
 pop2_uxn_opcodes_h_l3061_c41_5cc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output,
 opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output,
 nip_uxn_opcodes_h_l3062_c41_ab84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output,
 nip2_uxn_opcodes_h_l3063_c41_0eb4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output,
 swp_uxn_opcodes_h_l3064_c41_558c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output,
 opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output,
 swp2_uxn_opcodes_h_l3065_c41_841a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output,
 opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output,
 rot_uxn_opcodes_h_l3066_c41_5be6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output,
 rot2_uxn_opcodes_h_l3067_c41_2ef8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output,
 opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output,
 dup_uxn_opcodes_h_l3068_c41_2924_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output,
 dup2_uxn_opcodes_h_l3069_c41_30ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output,
 ovr_uxn_opcodes_h_l3070_c41_47c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output,
 opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output,
 ovr2_uxn_opcodes_h_l3071_c41_1a57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_return_output,
 opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output,
 equ_uxn_opcodes_h_l3072_c41_9c9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_return_output,
 equ2_uxn_opcodes_h_l3073_c41_33cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output,
 opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output,
 neq_uxn_opcodes_h_l3074_c41_0bb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output,
 neq2_uxn_opcodes_h_l3075_c41_c5ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output,
 opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output,
 gth_uxn_opcodes_h_l3076_c41_2dbf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output,
 opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output,
 gth2_uxn_opcodes_h_l3077_c41_241c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output,
 lth_uxn_opcodes_h_l3078_c41_b6d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output,
 opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output,
 lth2_uxn_opcodes_h_l3079_c41_02fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output,
 opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output,
 jmp_uxn_opcodes_h_l3080_c41_e2f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output,
 jmp2_uxn_opcodes_h_l3081_c41_2137_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_return_output,
 opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_return_output,
 jcn_uxn_opcodes_h_l3082_c41_0418_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output,
 opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_return_output,
 jcn2_uxn_opcodes_h_l3083_c41_0ec7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_return_output,
 opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output,
 jsr_uxn_opcodes_h_l3084_c41_d8d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_return_output,
 jsr2_uxn_opcodes_h_l3085_c41_3bcb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output,
 opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_return_output,
 sth_uxn_opcodes_h_l3086_c41_219a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output,
 opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output,
 sth2_uxn_opcodes_h_l3087_c41_de17_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output,
 opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output,
 ldz_uxn_opcodes_h_l3088_c41_e869_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output,
 opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output,
 ldz2_uxn_opcodes_h_l3089_c41_67c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output,
 stz_uxn_opcodes_h_l3090_c41_44a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_return_output,
 opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output,
 stz2_uxn_opcodes_h_l3091_c41_13cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_return_output,
 opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_return_output,
 ldr_uxn_opcodes_h_l3092_c41_e3f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output,
 opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_return_output,
 ldr2_uxn_opcodes_h_l3093_c41_04d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output,
 str1_uxn_opcodes_h_l3094_c41_de08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output,
 opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output,
 str2_uxn_opcodes_h_l3095_c41_27e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_return_output,
 opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output,
 lda_uxn_opcodes_h_l3096_c41_7212_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_return_output,
 opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_return_output,
 lda2_uxn_opcodes_h_l3097_c41_91a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_return_output,
 sta_uxn_opcodes_h_l3098_c41_1e9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_return_output,
 opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_return_output,
 sta2_uxn_opcodes_h_l3099_c41_9428_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output,
 opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_return_output,
 dei_uxn_opcodes_h_l3100_c41_1971_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_return_output,
 opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output,
 dei2_uxn_opcodes_h_l3101_c41_4458_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_return_output,
 deo_uxn_opcodes_h_l3102_c41_9326_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_return_output,
 opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output,
 deo2_uxn_opcodes_h_l3103_c41_07d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output,
 opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_return_output,
 add_uxn_opcodes_h_l3104_c41_f4a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_return_output,
 opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output,
 add2_uxn_opcodes_h_l3105_c41_ed53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_return_output,
 opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_return_output,
 sub_uxn_opcodes_h_l3106_c41_05d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output,
 opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_return_output,
 sub2_uxn_opcodes_h_l3107_c41_587b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output,
 opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output,
 mul_uxn_opcodes_h_l3108_c41_f57d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output,
 opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output,
 mul2_uxn_opcodes_h_l3109_c41_f23e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_return_output,
 opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output,
 div_uxn_opcodes_h_l3110_c41_ff0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_return_output,
 opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_return_output,
 div2_uxn_opcodes_h_l3111_c41_402b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_return_output,
 and_uxn_opcodes_h_l3112_c41_e361_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output,
 opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output,
 and2_uxn_opcodes_h_l3113_c41_fc34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_return_output,
 opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output,
 ora_uxn_opcodes_h_l3114_c41_41a7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_return_output,
 ora2_uxn_opcodes_h_l3115_c41_b611_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_return_output,
 opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output,
 eor_uxn_opcodes_h_l3116_c41_0d60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_return_output,
 opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_return_output,
 eor2_uxn_opcodes_h_l3117_c41_4356_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output,
 opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_return_output,
 sft_uxn_opcodes_h_l3118_c41_f38c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_return_output,
 opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output,
 sft2_uxn_opcodes_h_l3119_c41_ad2f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_return_output,
 MUX_uxn_opcodes_h_l3122_c18_d5dc_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_return_output,
 sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output,
 sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output,
 sp1_MUX_uxn_opcodes_h_l3126_c3_0638_return_output,
 sp0_MUX_uxn_opcodes_h_l3126_c3_0638_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_return_output,
 MUX_uxn_opcodes_h_l3133_c30_9ac4_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_return_output,
 MUX_uxn_opcodes_h_l3134_c20_5956_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_return_output,
 stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_return_output,
 device_ram_update_uxn_opcodes_h_l3142_c26_3775_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l3045_c2_09fa : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3045_c10_6d30_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3045_c10_6d30_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3045_c10_6d30_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3045_c30_93a7_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3045_c57_f177_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3045_c10_6d30_return_output : unsigned(11 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3050_c2_296b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3051_c41_7c05_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3051_c41_7c05_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3051_c41_7c05_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3051_c41_7c05_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3051_c41_7c05_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l3051_c41_7c05_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3054_c41_088e_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3054_c41_088e_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3054_c41_088e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3054_c41_088e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3054_c41_088e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3056_c41_e625_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3056_c41_e625_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3056_c41_e625_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3056_c41_e625_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l3056_c41_e625_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3057_c41_1477_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3057_c41_1477_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3057_c41_1477_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3057_c41_1477_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l3057_c41_1477_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3058_c41_f56c_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3058_c41_f56c_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3058_c41_f56c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3058_c41_f56c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l3058_c41_f56c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3059_c41_b410_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3059_c41_b410_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3059_c41_b410_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3059_c41_b410_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l3059_c41_b410_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3060_c41_6fa2_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3060_c41_6fa2_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3060_c41_6fa2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l3060_c41_6fa2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3061_c41_5cc5_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3061_c41_5cc5_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3061_c41_5cc5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l3061_c41_5cc5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3062_c41_ab84_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3062_c41_ab84_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3062_c41_ab84_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3062_c41_ab84_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l3062_c41_ab84_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3064_c41_558c_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3064_c41_558c_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3064_c41_558c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3064_c41_558c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l3064_c41_558c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3065_c41_841a_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3065_c41_841a_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3065_c41_841a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3065_c41_841a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l3065_c41_841a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3066_c41_5be6_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3066_c41_5be6_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3066_c41_5be6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3066_c41_5be6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l3066_c41_5be6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3068_c41_2924_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3068_c41_2924_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3068_c41_2924_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3068_c41_2924_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l3068_c41_2924_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3077_c41_241c_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3077_c41_241c_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3077_c41_241c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3077_c41_241c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l3077_c41_241c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3082_c41_0418_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3082_c41_0418_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3082_c41_0418_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3082_c41_0418_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3082_c41_0418_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l3082_c41_0418_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3086_c41_219a_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3086_c41_219a_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3086_c41_219a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3086_c41_219a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l3086_c41_219a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3087_c41_de17_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3087_c41_de17_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3087_c41_de17_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3087_c41_de17_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l3087_c41_de17_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3088_c41_e869_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3088_c41_e869_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3088_c41_e869_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3088_c41_e869_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3088_c41_e869_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l3088_c41_e869_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3090_c41_44a3_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3090_c41_44a3_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3090_c41_44a3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3090_c41_44a3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l3090_c41_44a3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3094_c41_de08_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3094_c41_de08_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3094_c41_de08_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3094_c41_de08_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3094_c41_de08_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l3094_c41_de08_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3095_c41_27e8_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3095_c41_27e8_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3095_c41_27e8_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3095_c41_27e8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3095_c41_27e8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l3095_c41_27e8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3096_c41_7212_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3096_c41_7212_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3096_c41_7212_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3096_c41_7212_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3096_c41_7212_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l3096_c41_7212_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3099_c41_9428_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3099_c41_9428_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3099_c41_9428_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3099_c41_9428_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l3099_c41_9428_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3100_c41_1971_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3100_c41_1971_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3100_c41_1971_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3100_c41_1971_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3100_c41_1971_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l3100_c41_1971_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3101_c41_4458_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3101_c41_4458_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3101_c41_4458_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3101_c41_4458_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3101_c41_4458_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l3101_c41_4458_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3102_c41_9326_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3102_c41_9326_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3102_c41_9326_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3102_c41_9326_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3102_c41_9326_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l3102_c41_9326_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3104_c41_f4a5_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3104_c41_f4a5_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3104_c41_f4a5_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l3104_c41_f4a5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l3104_c41_f4a5_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3105_c41_ed53_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3105_c41_ed53_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3105_c41_ed53_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3105_c41_ed53_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l3105_c41_ed53_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3106_c41_05d6_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3106_c41_05d6_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3106_c41_05d6_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3106_c41_05d6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l3106_c41_05d6_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3107_c41_587b_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3107_c41_587b_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3107_c41_587b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3107_c41_587b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l3107_c41_587b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3108_c41_f57d_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3108_c41_f57d_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3108_c41_f57d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3108_c41_f57d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l3108_c41_f57d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3110_c41_ff0f_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3110_c41_ff0f_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3110_c41_ff0f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l3110_c41_ff0f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l3110_c41_ff0f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3111_c41_402b_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3111_c41_402b_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3111_c41_402b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3111_c41_402b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l3111_c41_402b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3112_c41_e361_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3112_c41_e361_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3112_c41_e361_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l3112_c41_e361_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l3112_c41_e361_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3113_c41_fc34_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3113_c41_fc34_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3113_c41_fc34_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3113_c41_fc34_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l3113_c41_fc34_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3114_c41_41a7_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3114_c41_41a7_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3114_c41_41a7_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3114_c41_41a7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l3114_c41_41a7_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3115_c41_b611_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3115_c41_b611_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3115_c41_b611_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3115_c41_b611_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l3115_c41_b611_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3116_c41_0d60_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3116_c41_0d60_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3116_c41_0d60_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3116_c41_0d60_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l3116_c41_0d60_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3117_c41_4356_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3117_c41_4356_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3117_c41_4356_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3117_c41_4356_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l3117_c41_4356_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3118_c41_f38c_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3118_c41_f38c_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3118_c41_f38c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3118_c41_f38c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l3118_c41_f38c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l3120_c9_2a8b_uxn_opcodes_h_l3120_c9_2a8b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3120_c9_2a8b_uxn_opcodes_h_l3120_c9_2a8b_arg0 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3122_c18_d5dc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3122_c18_d5dc_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3122_c18_d5dc_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3122_c18_d5dc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3123_c17_01e7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3125_c6_db69_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0638_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0638_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0638_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l3127_c4_15b9 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0638_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0638_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0638_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0638_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l3129_c4_83f3 : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0638_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3133_c30_9ac4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3133_c30_9ac4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3133_c30_9ac4_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3133_c30_9ac4_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3133_c19_3f9d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_left : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3133_c70_2f54_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3133_c59_2ad7_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_return_output : unsigned(11 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l3134_c2_0b87 : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_left : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3134_c20_5956_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3134_c20_5956_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3134_c20_5956_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3134_c20_5956_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_return_output : unsigned(12 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_stack_address : unsigned(11 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3139_c3_4e6e_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_return_output : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_device_address : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_value : unsigned(7 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3143_c3_b7a0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3145_c3_ae0b_return_output : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3148_c34_3a80_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l3149_c30_f27b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3150_c33_8805_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3151_c34_1249_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3152_c37_95f2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3153_c33_2a19_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3155_c32_5983_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3127_l3129_DUPLICATE_7cd5_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3127_l3129_DUPLICATE_6813_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3154_l3144_l3138_DUPLICATE_ee25_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_2565_uxn_opcodes_h_l3031_l3157_DUPLICATE_d2f6_return_output : eval_opcode_result_t;
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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_right := to_unsigned(512, 10);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_right := to_unsigned(43, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_right := to_unsigned(12, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_right := to_unsigned(54, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_right := to_unsigned(9, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_right := to_unsigned(64, 7);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_right := to_unsigned(24, 5);
     VAR_MUX_uxn_opcodes_h_l3122_c18_d5dc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_right := to_unsigned(46, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_right := to_unsigned(26, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_right := to_unsigned(25, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3134_c20_5956_iftrue := to_unsigned(256, 9);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_right := to_unsigned(3072, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_right := to_unsigned(62, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_right := to_unsigned(40, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_right := to_unsigned(2048, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_right := to_unsigned(59, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_right := to_unsigned(22, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_right := to_unsigned(44, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_right := to_unsigned(29, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_right := to_unsigned(2560, 12);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_right := to_unsigned(37, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_right := to_unsigned(56, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3122_c18_d5dc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_right := to_unsigned(55, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_right := to_unsigned(1536, 11);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_right := to_unsigned(45, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_right := to_unsigned(14, 4);
     VAR_MUX_uxn_opcodes_h_l3134_c20_5956_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_right := to_unsigned(48, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_right := to_unsigned(23, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_right := to_unsigned(49, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_right := to_unsigned(63, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_right := to_unsigned(35, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_right := to_unsigned(41, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_right := to_unsigned(61, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_right := to_unsigned(17, 5);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_right := to_unsigned(36, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_right := to_unsigned(3584, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_right := to_unsigned(38, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_right := to_unsigned(1024, 11);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_right := to_unsigned(51, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_right := to_unsigned(20, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_right := to_unsigned(50, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_right := to_unsigned(15, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_right := to_unsigned(60, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_right := to_unsigned(30, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_right := to_unsigned(21, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_right := to_unsigned(53, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_right := to_unsigned(13, 4);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_iffalse := VAR_CLOCK_ENABLE;
     VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_dei2_uxn_opcodes_h_l3101_c41_4458_previous_device_ram_read := device_ram_read_value;
     VAR_dei_uxn_opcodes_h_l3100_c41_1971_previous_device_ram_read := device_ram_read_value;
     VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_previous_device_ram_read := device_ram_read_value;
     VAR_deo_uxn_opcodes_h_l3102_c41_9326_previous_device_ram_read := device_ram_read_value;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l3105_c41_ed53_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l3104_c41_f4a5_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l3113_c41_fc34_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l3112_c41_e361_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l3101_c41_4458_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l3100_c41_1971_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l3102_c41_9326_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l3111_c41_402b_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l3110_c41_ff0f_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l3068_c41_2924_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l3117_c41_4356_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l3116_c41_0d60_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l3077_c41_241c_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l3059_c41_b410_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l3058_c41_f56c_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l3082_c41_0418_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l3096_c41_7212_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l3088_c41_e869_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l3108_c41_f57d_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l3062_c41_ab84_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l3115_c41_b611_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l3114_c41_41a7_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l3061_c41_5cc5_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l3060_c41_6fa2_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l3066_c41_5be6_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l3118_c41_f38c_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l3099_c41_9428_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l3087_c41_de17_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l3086_c41_219a_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l3094_c41_de08_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l3095_c41_27e8_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l3090_c41_44a3_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l3107_c41_587b_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l3106_c41_05d6_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l3065_c41_841a_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l3064_c41_558c_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l3051_c41_7c05_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l3082_c41_0418_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l3057_c41_1477_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3054_c41_088e_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l3056_c41_e625_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l3094_c41_de08_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l3095_c41_27e8_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l3105_c41_ed53_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l3104_c41_f4a5_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l3113_c41_fc34_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l3112_c41_e361_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l3101_c41_4458_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l3100_c41_1971_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l3102_c41_9326_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l3111_c41_402b_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l3110_c41_ff0f_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l3068_c41_2924_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l3117_c41_4356_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l3116_c41_0d60_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l3077_c41_241c_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l3059_c41_b410_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l3058_c41_f56c_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3051_c41_7c05_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l3082_c41_0418_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l3096_c41_7212_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l3088_c41_e869_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l3057_c41_1477_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3054_c41_088e_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l3056_c41_e625_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l3108_c41_f57d_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l3062_c41_ab84_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l3115_c41_b611_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l3114_c41_41a7_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l3061_c41_5cc5_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l3060_c41_6fa2_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l3066_c41_5be6_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l3118_c41_f38c_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l3099_c41_9428_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l3087_c41_de17_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l3086_c41_219a_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l3094_c41_de08_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l3095_c41_27e8_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l3090_c41_44a3_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l3107_c41_587b_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l3106_c41_05d6_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l3065_c41_841a_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l3064_c41_558c_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l3051_c41_7c05_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l3096_c41_7212_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l3088_c41_e869_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l3057_c41_1477_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3054_c41_088e_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l3056_c41_e625_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0638_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0638_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l3105_c41_ed53_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l3104_c41_f4a5_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l3113_c41_fc34_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l3112_c41_e361_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l3101_c41_4458_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l3100_c41_1971_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l3102_c41_9326_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l3111_c41_402b_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l3110_c41_ff0f_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l3068_c41_2924_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l3117_c41_4356_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l3116_c41_0d60_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l3077_c41_241c_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l3059_c41_b410_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l3058_c41_f56c_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l3051_c41_7c05_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l3082_c41_0418_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l3096_c41_7212_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l3088_c41_e869_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l3108_c41_f57d_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l3062_c41_ab84_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l3115_c41_b611_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l3114_c41_41a7_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l3066_c41_5be6_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l3118_c41_f38c_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l3099_c41_9428_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l3087_c41_de17_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l3086_c41_219a_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l3094_c41_de08_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l3095_c41_27e8_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l3090_c41_44a3_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l3107_c41_587b_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l3106_c41_05d6_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l3065_c41_841a_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l3064_c41_558c_previous_stack_read := stack_read_value;
     -- BIN_OP_AND[uxn_opcodes_h_l3045_c41_e3f9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_left;
     BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_return_output := BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3122_c18_a79f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_left;
     BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_return_output := BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3045_c57_f177] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3045_c57_f177_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l3050_c2_296b] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3050_c2_296b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- BIN_OP_AND[uxn_opcodes_h_l3045_c10_1ea3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_left;
     BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_return_output := BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c10_1ea3_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3122_c18_a79f_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3045_c57_f177_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l3050_c2_296b_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l3045_c10_8f3a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_left;
     BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_return_output := BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3122_c18_e044] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_left;
     BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_return_output := BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3045_c30_93a7] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3045_c30_93a7_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l3045_c41_e3f9_return_output);

     -- CONST_SL_4[uxn_opcodes_h_l3045_c57_34b0] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0_x <= VAR_CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0_return_output := CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3045_c10_6d30_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3045_c10_8f3a_return_output;
     VAR_MUX_uxn_opcodes_h_l3122_c18_d5dc_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3122_c18_e044_return_output;
     VAR_MUX_uxn_opcodes_h_l3045_c10_6d30_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3045_c30_93a7_return_output;
     VAR_MUX_uxn_opcodes_h_l3045_c10_6d30_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l3045_c57_34b0_return_output;
     -- MUX[uxn_opcodes_h_l3122_c18_d5dc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3122_c18_d5dc_cond <= VAR_MUX_uxn_opcodes_h_l3122_c18_d5dc_cond;
     MUX_uxn_opcodes_h_l3122_c18_d5dc_iftrue <= VAR_MUX_uxn_opcodes_h_l3122_c18_d5dc_iftrue;
     MUX_uxn_opcodes_h_l3122_c18_d5dc_iffalse <= VAR_MUX_uxn_opcodes_h_l3122_c18_d5dc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3122_c18_d5dc_return_output := MUX_uxn_opcodes_h_l3122_c18_d5dc_return_output;

     -- MUX[uxn_opcodes_h_l3045_c10_6d30] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3045_c10_6d30_cond <= VAR_MUX_uxn_opcodes_h_l3045_c10_6d30_cond;
     MUX_uxn_opcodes_h_l3045_c10_6d30_iftrue <= VAR_MUX_uxn_opcodes_h_l3045_c10_6d30_iftrue;
     MUX_uxn_opcodes_h_l3045_c10_6d30_iffalse <= VAR_MUX_uxn_opcodes_h_l3045_c10_6d30_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3045_c10_6d30_return_output := MUX_uxn_opcodes_h_l3045_c10_6d30_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l3045_c2_09fa := VAR_MUX_uxn_opcodes_h_l3045_c10_6d30_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_left := VAR_MUX_uxn_opcodes_h_l3122_c18_d5dc_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_left := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l3045_c2_09fa;
     VAR_printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg1 := resize(VAR_opc_uxn_opcodes_h_l3045_c2_09fa, 32);
     VAR_printf_uxn_opcodes_h_l3120_c9_2a8b_uxn_opcodes_h_l3120_c9_2a8b_arg0 := resize(VAR_opc_uxn_opcodes_h_l3045_c2_09fa, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l3084_c11_23a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3119_c11_8aef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_left;
     BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_return_output := BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3051_c11_0232] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_left;
     BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_return_output := BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3086_c11_656e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3088_c11_25fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_left;
     BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_return_output := BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3074_c11_0a1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3100_c11_0ff3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3114_c11_17f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3091_c11_991e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3061_c11_11e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3064_c11_4de2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3063_c11_eff3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_e9da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_left;
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_return_output := BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3097_c11_4f82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_left;
     BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_return_output := BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3107_c11_f747] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_left;
     BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_return_output := BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3112_c11_e1a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3079_c11_525b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_return_output;

     -- printf_uxn_opcodes_h_l3048_c2_acae[uxn_opcodes_h_l3048_c2_acae] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg0 <= VAR_printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg0;
     printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg1 <= VAR_printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg1;
     printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg2 <= VAR_printf_uxn_opcodes_h_l3048_c2_acae_uxn_opcodes_h_l3048_c2_acae_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l3096_c11_0438] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_left;
     BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_return_output := BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3087_c11_bfdb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3065_c11_43cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3058_c11_2ff4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3092_c11_752b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3105_c11_fb6e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3080_c11_effe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_left;
     BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_return_output := BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3078_c11_cbf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3101_c11_03c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3052_c11_99ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3069_c11_5356] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_left;
     BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_return_output := BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3102_c11_a50e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3094_c11_1bd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3115_c11_2959] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_left;
     BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_return_output := BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3056_c11_57b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3073_c11_deae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_left;
     BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_return_output := BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3057_c11_2d4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_9b67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_left;
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_return_output := BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3118_c11_bdaf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_left;
     BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_return_output := BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3066_c11_2575] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_left;
     BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_return_output := BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3098_c11_fa62] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_left;
     BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_return_output := BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3062_c11_92b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3053_c11_c5bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3113_c11_cc9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3068_c11_5b03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_left;
     BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_return_output := BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3116_c11_1a52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_left;
     BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_return_output := BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3072_c11_e89b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3109_c11_f976] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_left;
     BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_return_output := BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3117_c11_3d9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3082_c11_fbc1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3093_c11_8b48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_left;
     BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_return_output := BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3077_c11_6bfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3059_c11_2110] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_left;
     BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_return_output := BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3110_c11_31c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3081_c11_465e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3106_c11_76ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3111_c11_0d7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3055_c11_0fef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_left;
     BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_return_output := BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3067_c11_93f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3076_c11_44dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_left;
     BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_return_output := BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3090_c11_0b0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3070_c11_7f14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_left;
     BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_return_output := BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3060_c11_13d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3085_c11_89e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3050_c6_05bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3054_c11_00b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3089_c11_0883] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_left;
     BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_return_output := BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3075_c11_d3f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3071_c11_3e07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_left;
     BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_return_output := BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_9f9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3083_c11_d24d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3108_c11_08df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_left;
     BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_return_output := BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3104_c11_854a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c6_05bb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_0232_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3052_c11_99ad_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3053_c11_c5bf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_00b6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3055_c11_0fef_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3056_c11_57b2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3057_c11_2d4f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3058_c11_2ff4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3059_c11_2110_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_13d4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3061_c11_11e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3062_c11_92b9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3063_c11_eff3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3064_c11_4de2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3065_c11_43cd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_2575_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3067_c11_93f0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c11_5b03_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3069_c11_5356_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_7f14_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3071_c11_3e07_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3072_c11_e89b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_deae_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_0a1b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3075_c11_d3f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_44dd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3077_c11_6bfc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3078_c11_cbf8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3079_c11_525b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3080_c11_effe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_465e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3082_c11_fbc1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3083_c11_d24d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_23a7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3085_c11_89e4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3086_c11_656e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3087_c11_bfdb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3088_c11_25fe_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_0883_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3090_c11_0b0a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3091_c11_991e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3092_c11_752b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3093_c11_8b48_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3094_c11_1bd7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_e9da_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3096_c11_0438_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3097_c11_4f82_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3098_c11_fa62_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_9f9b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3100_c11_0ff3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3101_c11_03c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3102_c11_a50e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_9b67_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3104_c11_854a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3105_c11_fb6e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3106_c11_76ed_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f747_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3108_c11_08df_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3109_c11_f976_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3110_c11_31c2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3111_c11_0d7a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3112_c11_e1a3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3113_c11_cc9b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3114_c11_17f9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3115_c11_2959_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3116_c11_1a52_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3117_c11_3d9e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3118_c11_bdaf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3119_c11_8aef_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3051_c7_c0c2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3052_c7_4389] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3051_c1_c54b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c7_4389_return_output;
     VAR_jci_uxn_opcodes_h_l3051_c41_7c05_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3051_c1_c54b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3053_c7_f676] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3052_c1_57cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_return_output;

     -- jci[uxn_opcodes_h_l3051_c41_7c05] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l3051_c41_7c05_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l3051_c41_7c05_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l3051_c41_7c05_phase <= VAR_jci_uxn_opcodes_h_l3051_c41_7c05_phase;
     jci_uxn_opcodes_h_l3051_c41_7c05_pc <= VAR_jci_uxn_opcodes_h_l3051_c41_7c05_pc;
     jci_uxn_opcodes_h_l3051_c41_7c05_previous_stack_read <= VAR_jci_uxn_opcodes_h_l3051_c41_7c05_previous_stack_read;
     jci_uxn_opcodes_h_l3051_c41_7c05_previous_ram_read <= VAR_jci_uxn_opcodes_h_l3051_c41_7c05_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l3051_c41_7c05_return_output := jci_uxn_opcodes_h_l3051_c41_7c05_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c7_f676_return_output;
     VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3052_c1_57cb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_iftrue := VAR_jci_uxn_opcodes_h_l3051_c41_7c05_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3054_c7_1c59] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output;

     -- jmi[uxn_opcodes_h_l3052_c41_4d8a] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l3052_c41_4d8a_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l3052_c41_4d8a_phase <= VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_phase;
     jmi_uxn_opcodes_h_l3052_c41_4d8a_pc <= VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_pc;
     jmi_uxn_opcodes_h_l3052_c41_4d8a_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_return_output := jmi_uxn_opcodes_h_l3052_c41_4d8a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3053_c1_e755] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output;
     VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3053_c1_e755_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_iftrue := VAR_jmi_uxn_opcodes_h_l3052_c41_4d8a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3055_c7_46d5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output;

     -- jsi[uxn_opcodes_h_l3053_c41_39ec] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l3053_c41_39ec_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l3053_c41_39ec_phase <= VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_phase;
     jsi_uxn_opcodes_h_l3053_c41_39ec_pc <= VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_pc;
     jsi_uxn_opcodes_h_l3053_c41_39ec_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_return_output := jsi_uxn_opcodes_h_l3053_c41_39ec_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3054_c1_414a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output;
     VAR_lit_uxn_opcodes_h_l3054_c41_088e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3054_c1_414a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_iftrue := VAR_jsi_uxn_opcodes_h_l3053_c41_39ec_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3056_c7_6b9e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output;

     -- lit[uxn_opcodes_h_l3054_c41_088e] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3054_c41_088e_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3054_c41_088e_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3054_c41_088e_phase <= VAR_lit_uxn_opcodes_h_l3054_c41_088e_phase;
     lit_uxn_opcodes_h_l3054_c41_088e_pc <= VAR_lit_uxn_opcodes_h_l3054_c41_088e_pc;
     lit_uxn_opcodes_h_l3054_c41_088e_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3054_c41_088e_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3054_c41_088e_return_output := lit_uxn_opcodes_h_l3054_c41_088e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3055_c1_2e91] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output;
     VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3055_c1_2e91_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_iftrue := VAR_lit_uxn_opcodes_h_l3054_c41_088e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c7_6900] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3056_c1_4244] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_return_output;

     -- lit2[uxn_opcodes_h_l3055_c41_25f7] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3055_c41_25f7_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3055_c41_25f7_phase <= VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_phase;
     lit2_uxn_opcodes_h_l3055_c41_25f7_pc <= VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_pc;
     lit2_uxn_opcodes_h_l3055_c41_25f7_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_return_output := lit2_uxn_opcodes_h_l3055_c41_25f7_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c7_6900_return_output;
     VAR_lit_uxn_opcodes_h_l3056_c41_e625_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3056_c1_4244_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_iftrue := VAR_lit2_uxn_opcodes_h_l3055_c41_25f7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3057_c1_cba1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_return_output;

     -- lit[uxn_opcodes_h_l3056_c41_e625] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l3056_c41_e625_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l3056_c41_e625_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l3056_c41_e625_phase <= VAR_lit_uxn_opcodes_h_l3056_c41_e625_phase;
     lit_uxn_opcodes_h_l3056_c41_e625_pc <= VAR_lit_uxn_opcodes_h_l3056_c41_e625_pc;
     lit_uxn_opcodes_h_l3056_c41_e625_previous_ram_read <= VAR_lit_uxn_opcodes_h_l3056_c41_e625_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l3056_c41_e625_return_output := lit_uxn_opcodes_h_l3056_c41_e625_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c7_3864] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c7_3864_return_output;
     VAR_lit2_uxn_opcodes_h_l3057_c41_1477_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3057_c1_cba1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_iftrue := VAR_lit_uxn_opcodes_h_l3056_c41_e625_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c7_640d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3058_c1_d41c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_return_output;

     -- lit2[uxn_opcodes_h_l3057_c41_1477] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l3057_c41_1477_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l3057_c41_1477_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l3057_c41_1477_phase <= VAR_lit2_uxn_opcodes_h_l3057_c41_1477_phase;
     lit2_uxn_opcodes_h_l3057_c41_1477_pc <= VAR_lit2_uxn_opcodes_h_l3057_c41_1477_pc;
     lit2_uxn_opcodes_h_l3057_c41_1477_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l3057_c41_1477_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l3057_c41_1477_return_output := lit2_uxn_opcodes_h_l3057_c41_1477_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c7_640d_return_output;
     VAR_inc_uxn_opcodes_h_l3058_c41_f56c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3058_c1_d41c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_iftrue := VAR_lit2_uxn_opcodes_h_l3057_c41_1477_return_output;
     -- inc[uxn_opcodes_h_l3058_c41_f56c] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l3058_c41_f56c_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l3058_c41_f56c_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l3058_c41_f56c_phase <= VAR_inc_uxn_opcodes_h_l3058_c41_f56c_phase;
     inc_uxn_opcodes_h_l3058_c41_f56c_ins <= VAR_inc_uxn_opcodes_h_l3058_c41_f56c_ins;
     inc_uxn_opcodes_h_l3058_c41_f56c_previous_stack_read <= VAR_inc_uxn_opcodes_h_l3058_c41_f56c_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l3058_c41_f56c_return_output := inc_uxn_opcodes_h_l3058_c41_f56c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3059_c1_a9a1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c7_1592] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c7_1592_return_output;
     VAR_inc2_uxn_opcodes_h_l3059_c41_b410_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3059_c1_a9a1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_iftrue := VAR_inc_uxn_opcodes_h_l3058_c41_f56c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3060_c1_f675] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c7_dbe5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output;

     -- inc2[uxn_opcodes_h_l3059_c41_b410] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l3059_c41_b410_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l3059_c41_b410_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l3059_c41_b410_phase <= VAR_inc2_uxn_opcodes_h_l3059_c41_b410_phase;
     inc2_uxn_opcodes_h_l3059_c41_b410_ins <= VAR_inc2_uxn_opcodes_h_l3059_c41_b410_ins;
     inc2_uxn_opcodes_h_l3059_c41_b410_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l3059_c41_b410_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l3059_c41_b410_return_output := inc2_uxn_opcodes_h_l3059_c41_b410_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output;
     VAR_pop_uxn_opcodes_h_l3060_c41_6fa2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3060_c1_f675_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_iftrue := VAR_inc2_uxn_opcodes_h_l3059_c41_b410_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3061_c1_7094] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_return_output;

     -- pop[uxn_opcodes_h_l3060_c41_6fa2] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l3060_c41_6fa2_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l3060_c41_6fa2_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l3060_c41_6fa2_phase <= VAR_pop_uxn_opcodes_h_l3060_c41_6fa2_phase;
     pop_uxn_opcodes_h_l3060_c41_6fa2_ins <= VAR_pop_uxn_opcodes_h_l3060_c41_6fa2_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l3060_c41_6fa2_return_output := pop_uxn_opcodes_h_l3060_c41_6fa2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c7_7fef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output;
     VAR_pop2_uxn_opcodes_h_l3061_c41_5cc5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3061_c1_7094_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_iftrue := VAR_pop_uxn_opcodes_h_l3060_c41_6fa2_return_output;
     -- pop2[uxn_opcodes_h_l3061_c41_5cc5] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l3061_c41_5cc5_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l3061_c41_5cc5_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l3061_c41_5cc5_phase <= VAR_pop2_uxn_opcodes_h_l3061_c41_5cc5_phase;
     pop2_uxn_opcodes_h_l3061_c41_5cc5_ins <= VAR_pop2_uxn_opcodes_h_l3061_c41_5cc5_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l3061_c41_5cc5_return_output := pop2_uxn_opcodes_h_l3061_c41_5cc5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c7_3aad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3062_c1_0020] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output;
     VAR_nip_uxn_opcodes_h_l3062_c41_ab84_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3062_c1_0020_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_iftrue := VAR_pop2_uxn_opcodes_h_l3061_c41_5cc5_return_output;
     -- nip[uxn_opcodes_h_l3062_c41_ab84] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l3062_c41_ab84_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l3062_c41_ab84_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l3062_c41_ab84_phase <= VAR_nip_uxn_opcodes_h_l3062_c41_ab84_phase;
     nip_uxn_opcodes_h_l3062_c41_ab84_ins <= VAR_nip_uxn_opcodes_h_l3062_c41_ab84_ins;
     nip_uxn_opcodes_h_l3062_c41_ab84_previous_stack_read <= VAR_nip_uxn_opcodes_h_l3062_c41_ab84_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l3062_c41_ab84_return_output := nip_uxn_opcodes_h_l3062_c41_ab84_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c7_a6e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3063_c1_5d2f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output;
     VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3063_c1_5d2f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_iftrue := VAR_nip_uxn_opcodes_h_l3062_c41_ab84_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c7_f3b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output;

     -- nip2[uxn_opcodes_h_l3063_c41_0eb4] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l3063_c41_0eb4_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l3063_c41_0eb4_phase <= VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_phase;
     nip2_uxn_opcodes_h_l3063_c41_0eb4_ins <= VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_ins;
     nip2_uxn_opcodes_h_l3063_c41_0eb4_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_return_output := nip2_uxn_opcodes_h_l3063_c41_0eb4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3064_c1_da32] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output;
     VAR_swp_uxn_opcodes_h_l3064_c41_558c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3064_c1_da32_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_iftrue := VAR_nip2_uxn_opcodes_h_l3063_c41_0eb4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c7_0dc6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3065_c1_849d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_return_output;

     -- swp[uxn_opcodes_h_l3064_c41_558c] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l3064_c41_558c_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l3064_c41_558c_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l3064_c41_558c_phase <= VAR_swp_uxn_opcodes_h_l3064_c41_558c_phase;
     swp_uxn_opcodes_h_l3064_c41_558c_ins <= VAR_swp_uxn_opcodes_h_l3064_c41_558c_ins;
     swp_uxn_opcodes_h_l3064_c41_558c_previous_stack_read <= VAR_swp_uxn_opcodes_h_l3064_c41_558c_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l3064_c41_558c_return_output := swp_uxn_opcodes_h_l3064_c41_558c_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output;
     VAR_swp2_uxn_opcodes_h_l3065_c41_841a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3065_c1_849d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_iftrue := VAR_swp_uxn_opcodes_h_l3064_c41_558c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c7_cdd0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output;

     -- swp2[uxn_opcodes_h_l3065_c41_841a] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l3065_c41_841a_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l3065_c41_841a_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l3065_c41_841a_phase <= VAR_swp2_uxn_opcodes_h_l3065_c41_841a_phase;
     swp2_uxn_opcodes_h_l3065_c41_841a_ins <= VAR_swp2_uxn_opcodes_h_l3065_c41_841a_ins;
     swp2_uxn_opcodes_h_l3065_c41_841a_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l3065_c41_841a_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l3065_c41_841a_return_output := swp2_uxn_opcodes_h_l3065_c41_841a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3066_c1_9f02] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output;
     VAR_rot_uxn_opcodes_h_l3066_c41_5be6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3066_c1_9f02_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_iftrue := VAR_swp2_uxn_opcodes_h_l3065_c41_841a_return_output;
     -- rot[uxn_opcodes_h_l3066_c41_5be6] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l3066_c41_5be6_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l3066_c41_5be6_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l3066_c41_5be6_phase <= VAR_rot_uxn_opcodes_h_l3066_c41_5be6_phase;
     rot_uxn_opcodes_h_l3066_c41_5be6_ins <= VAR_rot_uxn_opcodes_h_l3066_c41_5be6_ins;
     rot_uxn_opcodes_h_l3066_c41_5be6_previous_stack_read <= VAR_rot_uxn_opcodes_h_l3066_c41_5be6_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l3066_c41_5be6_return_output := rot_uxn_opcodes_h_l3066_c41_5be6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3067_c1_d0ad] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c7_3e4e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output;
     VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3067_c1_d0ad_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_iftrue := VAR_rot_uxn_opcodes_h_l3066_c41_5be6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c1_9931] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_return_output;

     -- rot2[uxn_opcodes_h_l3067_c41_2ef8] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l3067_c41_2ef8_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l3067_c41_2ef8_phase <= VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_phase;
     rot2_uxn_opcodes_h_l3067_c41_2ef8_ins <= VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_ins;
     rot2_uxn_opcodes_h_l3067_c41_2ef8_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_return_output := rot2_uxn_opcodes_h_l3067_c41_2ef8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c7_37c6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output;
     VAR_dup_uxn_opcodes_h_l3068_c41_2924_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_9931_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_iftrue := VAR_rot2_uxn_opcodes_h_l3067_c41_2ef8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c7_c4e7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output;

     -- dup[uxn_opcodes_h_l3068_c41_2924] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l3068_c41_2924_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l3068_c41_2924_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l3068_c41_2924_phase <= VAR_dup_uxn_opcodes_h_l3068_c41_2924_phase;
     dup_uxn_opcodes_h_l3068_c41_2924_ins <= VAR_dup_uxn_opcodes_h_l3068_c41_2924_ins;
     dup_uxn_opcodes_h_l3068_c41_2924_previous_stack_read <= VAR_dup_uxn_opcodes_h_l3068_c41_2924_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l3068_c41_2924_return_output := dup_uxn_opcodes_h_l3068_c41_2924_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3069_c1_657f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output;
     VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3069_c1_657f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_iftrue := VAR_dup_uxn_opcodes_h_l3068_c41_2924_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c7_e00b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output;

     -- dup2[uxn_opcodes_h_l3069_c41_30ff] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l3069_c41_30ff_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l3069_c41_30ff_phase <= VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_phase;
     dup2_uxn_opcodes_h_l3069_c41_30ff_ins <= VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_ins;
     dup2_uxn_opcodes_h_l3069_c41_30ff_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_return_output := dup2_uxn_opcodes_h_l3069_c41_30ff_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3070_c1_7c97] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output;
     VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3070_c1_7c97_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_iftrue := VAR_dup2_uxn_opcodes_h_l3069_c41_30ff_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3071_c1_e64c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c7_7f70] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output;

     -- ovr[uxn_opcodes_h_l3070_c41_47c7] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l3070_c41_47c7_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l3070_c41_47c7_phase <= VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_phase;
     ovr_uxn_opcodes_h_l3070_c41_47c7_ins <= VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_ins;
     ovr_uxn_opcodes_h_l3070_c41_47c7_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_return_output := ovr_uxn_opcodes_h_l3070_c41_47c7_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output;
     VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3071_c1_e64c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_iftrue := VAR_ovr_uxn_opcodes_h_l3070_c41_47c7_return_output;
     -- ovr2[uxn_opcodes_h_l3071_c41_1a57] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l3071_c41_1a57_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l3071_c41_1a57_phase <= VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_phase;
     ovr2_uxn_opcodes_h_l3071_c41_1a57_ins <= VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_ins;
     ovr2_uxn_opcodes_h_l3071_c41_1a57_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_return_output := ovr2_uxn_opcodes_h_l3071_c41_1a57_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3072_c1_bd9b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c7_c813] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c7_c813_return_output;
     VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3072_c1_bd9b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_iftrue := VAR_ovr2_uxn_opcodes_h_l3071_c41_1a57_return_output;
     -- equ[uxn_opcodes_h_l3072_c41_9c9f] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l3072_c41_9c9f_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l3072_c41_9c9f_phase <= VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_phase;
     equ_uxn_opcodes_h_l3072_c41_9c9f_ins <= VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_ins;
     equ_uxn_opcodes_h_l3072_c41_9c9f_previous_stack_read <= VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_return_output := equ_uxn_opcodes_h_l3072_c41_9c9f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3073_c1_02c8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c7_d2e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output;
     VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3073_c1_02c8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_iftrue := VAR_equ_uxn_opcodes_h_l3072_c41_9c9f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c7_3ad5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output;

     -- equ2[uxn_opcodes_h_l3073_c41_33cd] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l3073_c41_33cd_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l3073_c41_33cd_phase <= VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_phase;
     equ2_uxn_opcodes_h_l3073_c41_33cd_ins <= VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_ins;
     equ2_uxn_opcodes_h_l3073_c41_33cd_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_return_output := equ2_uxn_opcodes_h_l3073_c41_33cd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3074_c1_a0a7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output;
     VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3074_c1_a0a7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_iftrue := VAR_equ2_uxn_opcodes_h_l3073_c41_33cd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3075_c1_839e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c7_4ad8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output;

     -- neq[uxn_opcodes_h_l3074_c41_0bb7] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l3074_c41_0bb7_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l3074_c41_0bb7_phase <= VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_phase;
     neq_uxn_opcodes_h_l3074_c41_0bb7_ins <= VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_ins;
     neq_uxn_opcodes_h_l3074_c41_0bb7_previous_stack_read <= VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_return_output := neq_uxn_opcodes_h_l3074_c41_0bb7_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output;
     VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3075_c1_839e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_iftrue := VAR_neq_uxn_opcodes_h_l3074_c41_0bb7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3076_c1_7b88] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_return_output;

     -- neq2[uxn_opcodes_h_l3075_c41_c5ab] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l3075_c41_c5ab_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l3075_c41_c5ab_phase <= VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_phase;
     neq2_uxn_opcodes_h_l3075_c41_c5ab_ins <= VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_ins;
     neq2_uxn_opcodes_h_l3075_c41_c5ab_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_return_output := neq2_uxn_opcodes_h_l3075_c41_c5ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c7_0d48] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output;
     VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3076_c1_7b88_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_iftrue := VAR_neq2_uxn_opcodes_h_l3075_c41_c5ab_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c7_9a18] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3077_c1_f991] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_return_output;

     -- gth[uxn_opcodes_h_l3076_c41_2dbf] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l3076_c41_2dbf_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l3076_c41_2dbf_phase <= VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_phase;
     gth_uxn_opcodes_h_l3076_c41_2dbf_ins <= VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_ins;
     gth_uxn_opcodes_h_l3076_c41_2dbf_previous_stack_read <= VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_return_output := gth_uxn_opcodes_h_l3076_c41_2dbf_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output;
     VAR_gth2_uxn_opcodes_h_l3077_c41_241c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3077_c1_f991_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_iftrue := VAR_gth_uxn_opcodes_h_l3076_c41_2dbf_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3078_c1_1471] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c7_c62c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output;

     -- gth2[uxn_opcodes_h_l3077_c41_241c] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l3077_c41_241c_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l3077_c41_241c_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l3077_c41_241c_phase <= VAR_gth2_uxn_opcodes_h_l3077_c41_241c_phase;
     gth2_uxn_opcodes_h_l3077_c41_241c_ins <= VAR_gth2_uxn_opcodes_h_l3077_c41_241c_ins;
     gth2_uxn_opcodes_h_l3077_c41_241c_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l3077_c41_241c_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l3077_c41_241c_return_output := gth2_uxn_opcodes_h_l3077_c41_241c_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output;
     VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3078_c1_1471_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_iftrue := VAR_gth2_uxn_opcodes_h_l3077_c41_241c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c7_83f7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output;

     -- lth[uxn_opcodes_h_l3078_c41_b6d8] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l3078_c41_b6d8_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l3078_c41_b6d8_phase <= VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_phase;
     lth_uxn_opcodes_h_l3078_c41_b6d8_ins <= VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_ins;
     lth_uxn_opcodes_h_l3078_c41_b6d8_previous_stack_read <= VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_return_output := lth_uxn_opcodes_h_l3078_c41_b6d8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3079_c1_50b7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output;
     VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3079_c1_50b7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_iftrue := VAR_lth_uxn_opcodes_h_l3078_c41_b6d8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3080_c1_1cde] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_return_output;

     -- lth2[uxn_opcodes_h_l3079_c41_02fd] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l3079_c41_02fd_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l3079_c41_02fd_phase <= VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_phase;
     lth2_uxn_opcodes_h_l3079_c41_02fd_ins <= VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_ins;
     lth2_uxn_opcodes_h_l3079_c41_02fd_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_return_output := lth2_uxn_opcodes_h_l3079_c41_02fd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c7_2c50] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output;
     VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3080_c1_1cde_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_iftrue := VAR_lth2_uxn_opcodes_h_l3079_c41_02fd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c7_840f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_return_output;

     -- jmp[uxn_opcodes_h_l3080_c41_e2f4] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l3080_c41_e2f4_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l3080_c41_e2f4_phase <= VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_phase;
     jmp_uxn_opcodes_h_l3080_c41_e2f4_ins <= VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_ins;
     jmp_uxn_opcodes_h_l3080_c41_e2f4_pc <= VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_pc;
     jmp_uxn_opcodes_h_l3080_c41_e2f4_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_return_output := jmp_uxn_opcodes_h_l3080_c41_e2f4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3081_c1_391a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c7_840f_return_output;
     VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3081_c1_391a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_iftrue := VAR_jmp_uxn_opcodes_h_l3080_c41_e2f4_return_output;
     -- jmp2[uxn_opcodes_h_l3081_c41_2137] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l3081_c41_2137_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l3081_c41_2137_phase <= VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_phase;
     jmp2_uxn_opcodes_h_l3081_c41_2137_ins <= VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_ins;
     jmp2_uxn_opcodes_h_l3081_c41_2137_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_return_output := jmp2_uxn_opcodes_h_l3081_c41_2137_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3082_c1_b3fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c7_f004] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c7_f004_return_output;
     VAR_jcn_uxn_opcodes_h_l3082_c41_0418_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3082_c1_b3fc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_iftrue := VAR_jmp2_uxn_opcodes_h_l3081_c41_2137_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3083_c1_33ef] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c7_11a8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output;

     -- jcn[uxn_opcodes_h_l3082_c41_0418] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l3082_c41_0418_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l3082_c41_0418_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l3082_c41_0418_phase <= VAR_jcn_uxn_opcodes_h_l3082_c41_0418_phase;
     jcn_uxn_opcodes_h_l3082_c41_0418_ins <= VAR_jcn_uxn_opcodes_h_l3082_c41_0418_ins;
     jcn_uxn_opcodes_h_l3082_c41_0418_pc <= VAR_jcn_uxn_opcodes_h_l3082_c41_0418_pc;
     jcn_uxn_opcodes_h_l3082_c41_0418_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l3082_c41_0418_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l3082_c41_0418_return_output := jcn_uxn_opcodes_h_l3082_c41_0418_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output;
     VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3083_c1_33ef_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_iftrue := VAR_jcn_uxn_opcodes_h_l3082_c41_0418_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3084_c1_607e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_return_output;

     -- jcn2[uxn_opcodes_h_l3083_c41_0ec7] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l3083_c41_0ec7_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l3083_c41_0ec7_phase <= VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_phase;
     jcn2_uxn_opcodes_h_l3083_c41_0ec7_ins <= VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_ins;
     jcn2_uxn_opcodes_h_l3083_c41_0ec7_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_return_output := jcn2_uxn_opcodes_h_l3083_c41_0ec7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c7_c003] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c7_c003_return_output;
     VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3084_c1_607e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_iftrue := VAR_jcn2_uxn_opcodes_h_l3083_c41_0ec7_return_output;
     -- jsr[uxn_opcodes_h_l3084_c41_d8d7] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l3084_c41_d8d7_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l3084_c41_d8d7_phase <= VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_phase;
     jsr_uxn_opcodes_h_l3084_c41_d8d7_ins <= VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_ins;
     jsr_uxn_opcodes_h_l3084_c41_d8d7_pc <= VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_pc;
     jsr_uxn_opcodes_h_l3084_c41_d8d7_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_return_output := jsr_uxn_opcodes_h_l3084_c41_d8d7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3085_c1_7c28] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c7_581b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c7_581b_return_output;
     VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3085_c1_7c28_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_iftrue := VAR_jsr_uxn_opcodes_h_l3084_c41_d8d7_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c7_9c71] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3086_c1_ba66] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_return_output;

     -- jsr2[uxn_opcodes_h_l3085_c41_3bcb] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l3085_c41_3bcb_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l3085_c41_3bcb_phase <= VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_phase;
     jsr2_uxn_opcodes_h_l3085_c41_3bcb_ins <= VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_ins;
     jsr2_uxn_opcodes_h_l3085_c41_3bcb_pc <= VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_pc;
     jsr2_uxn_opcodes_h_l3085_c41_3bcb_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_return_output := jsr2_uxn_opcodes_h_l3085_c41_3bcb_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output;
     VAR_sth_uxn_opcodes_h_l3086_c41_219a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3086_c1_ba66_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_iftrue := VAR_jsr2_uxn_opcodes_h_l3085_c41_3bcb_return_output;
     -- sth[uxn_opcodes_h_l3086_c41_219a] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l3086_c41_219a_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l3086_c41_219a_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l3086_c41_219a_phase <= VAR_sth_uxn_opcodes_h_l3086_c41_219a_phase;
     sth_uxn_opcodes_h_l3086_c41_219a_ins <= VAR_sth_uxn_opcodes_h_l3086_c41_219a_ins;
     sth_uxn_opcodes_h_l3086_c41_219a_previous_stack_read <= VAR_sth_uxn_opcodes_h_l3086_c41_219a_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l3086_c41_219a_return_output := sth_uxn_opcodes_h_l3086_c41_219a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3087_c1_d72f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c7_b90c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output;
     VAR_sth2_uxn_opcodes_h_l3087_c41_de17_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3087_c1_d72f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_iftrue := VAR_sth_uxn_opcodes_h_l3086_c41_219a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3088_c1_8864] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c7_dcef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output;

     -- sth2[uxn_opcodes_h_l3087_c41_de17] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l3087_c41_de17_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l3087_c41_de17_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l3087_c41_de17_phase <= VAR_sth2_uxn_opcodes_h_l3087_c41_de17_phase;
     sth2_uxn_opcodes_h_l3087_c41_de17_ins <= VAR_sth2_uxn_opcodes_h_l3087_c41_de17_ins;
     sth2_uxn_opcodes_h_l3087_c41_de17_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l3087_c41_de17_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l3087_c41_de17_return_output := sth2_uxn_opcodes_h_l3087_c41_de17_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output;
     VAR_ldz_uxn_opcodes_h_l3088_c41_e869_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3088_c1_8864_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_iftrue := VAR_sth2_uxn_opcodes_h_l3087_c41_de17_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c7_a89b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output;

     -- ldz[uxn_opcodes_h_l3088_c41_e869] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l3088_c41_e869_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l3088_c41_e869_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l3088_c41_e869_phase <= VAR_ldz_uxn_opcodes_h_l3088_c41_e869_phase;
     ldz_uxn_opcodes_h_l3088_c41_e869_ins <= VAR_ldz_uxn_opcodes_h_l3088_c41_e869_ins;
     ldz_uxn_opcodes_h_l3088_c41_e869_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l3088_c41_e869_previous_stack_read;
     ldz_uxn_opcodes_h_l3088_c41_e869_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l3088_c41_e869_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l3088_c41_e869_return_output := ldz_uxn_opcodes_h_l3088_c41_e869_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3089_c1_366d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output;
     VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3089_c1_366d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_iftrue := VAR_ldz_uxn_opcodes_h_l3088_c41_e869_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3090_c1_b59e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c7_70b1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output;

     -- ldz2[uxn_opcodes_h_l3089_c41_67c0] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l3089_c41_67c0_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l3089_c41_67c0_phase <= VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_phase;
     ldz2_uxn_opcodes_h_l3089_c41_67c0_ins <= VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_ins;
     ldz2_uxn_opcodes_h_l3089_c41_67c0_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_previous_stack_read;
     ldz2_uxn_opcodes_h_l3089_c41_67c0_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_return_output := ldz2_uxn_opcodes_h_l3089_c41_67c0_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output;
     VAR_stz_uxn_opcodes_h_l3090_c41_44a3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3090_c1_b59e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_iftrue := VAR_ldz2_uxn_opcodes_h_l3089_c41_67c0_return_output;
     -- stz[uxn_opcodes_h_l3090_c41_44a3] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l3090_c41_44a3_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l3090_c41_44a3_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l3090_c41_44a3_phase <= VAR_stz_uxn_opcodes_h_l3090_c41_44a3_phase;
     stz_uxn_opcodes_h_l3090_c41_44a3_ins <= VAR_stz_uxn_opcodes_h_l3090_c41_44a3_ins;
     stz_uxn_opcodes_h_l3090_c41_44a3_previous_stack_read <= VAR_stz_uxn_opcodes_h_l3090_c41_44a3_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l3090_c41_44a3_return_output := stz_uxn_opcodes_h_l3090_c41_44a3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c7_f813] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3091_c1_b6e1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c7_f813_return_output;
     VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3091_c1_b6e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_iftrue := VAR_stz_uxn_opcodes_h_l3090_c41_44a3_return_output;
     -- stz2[uxn_opcodes_h_l3091_c41_13cd] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l3091_c41_13cd_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l3091_c41_13cd_phase <= VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_phase;
     stz2_uxn_opcodes_h_l3091_c41_13cd_ins <= VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_ins;
     stz2_uxn_opcodes_h_l3091_c41_13cd_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_return_output := stz2_uxn_opcodes_h_l3091_c41_13cd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c7_d458] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3092_c1_56f0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c7_d458_return_output;
     VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3092_c1_56f0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_iftrue := VAR_stz2_uxn_opcodes_h_l3091_c41_13cd_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c7_bd23] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output;

     -- ldr[uxn_opcodes_h_l3092_c41_e3f1] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l3092_c41_e3f1_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l3092_c41_e3f1_phase <= VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_phase;
     ldr_uxn_opcodes_h_l3092_c41_e3f1_ins <= VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_ins;
     ldr_uxn_opcodes_h_l3092_c41_e3f1_pc <= VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_pc;
     ldr_uxn_opcodes_h_l3092_c41_e3f1_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_previous_stack_read;
     ldr_uxn_opcodes_h_l3092_c41_e3f1_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_return_output := ldr_uxn_opcodes_h_l3092_c41_e3f1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3093_c1_893b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output;
     VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3093_c1_893b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_iftrue := VAR_ldr_uxn_opcodes_h_l3092_c41_e3f1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c7_a18e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output;

     -- ldr2[uxn_opcodes_h_l3093_c41_04d3] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l3093_c41_04d3_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l3093_c41_04d3_phase <= VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_phase;
     ldr2_uxn_opcodes_h_l3093_c41_04d3_ins <= VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_ins;
     ldr2_uxn_opcodes_h_l3093_c41_04d3_pc <= VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_pc;
     ldr2_uxn_opcodes_h_l3093_c41_04d3_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_previous_stack_read;
     ldr2_uxn_opcodes_h_l3093_c41_04d3_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_return_output := ldr2_uxn_opcodes_h_l3093_c41_04d3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3094_c1_36eb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output;
     VAR_str1_uxn_opcodes_h_l3094_c41_de08_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3094_c1_36eb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_iftrue := VAR_ldr2_uxn_opcodes_h_l3093_c41_04d3_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3095_c1_8e5c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_return_output;

     -- str1[uxn_opcodes_h_l3094_c41_de08] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l3094_c41_de08_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l3094_c41_de08_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l3094_c41_de08_phase <= VAR_str1_uxn_opcodes_h_l3094_c41_de08_phase;
     str1_uxn_opcodes_h_l3094_c41_de08_ins <= VAR_str1_uxn_opcodes_h_l3094_c41_de08_ins;
     str1_uxn_opcodes_h_l3094_c41_de08_pc <= VAR_str1_uxn_opcodes_h_l3094_c41_de08_pc;
     str1_uxn_opcodes_h_l3094_c41_de08_previous_stack_read <= VAR_str1_uxn_opcodes_h_l3094_c41_de08_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l3094_c41_de08_return_output := str1_uxn_opcodes_h_l3094_c41_de08_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c7_5eab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output;
     VAR_str2_uxn_opcodes_h_l3095_c41_27e8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3095_c1_8e5c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_iftrue := VAR_str1_uxn_opcodes_h_l3094_c41_de08_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3096_c1_3396] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_return_output;

     -- str2[uxn_opcodes_h_l3095_c41_27e8] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l3095_c41_27e8_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l3095_c41_27e8_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l3095_c41_27e8_phase <= VAR_str2_uxn_opcodes_h_l3095_c41_27e8_phase;
     str2_uxn_opcodes_h_l3095_c41_27e8_ins <= VAR_str2_uxn_opcodes_h_l3095_c41_27e8_ins;
     str2_uxn_opcodes_h_l3095_c41_27e8_pc <= VAR_str2_uxn_opcodes_h_l3095_c41_27e8_pc;
     str2_uxn_opcodes_h_l3095_c41_27e8_previous_stack_read <= VAR_str2_uxn_opcodes_h_l3095_c41_27e8_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l3095_c41_27e8_return_output := str2_uxn_opcodes_h_l3095_c41_27e8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c7_f428] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c7_f428_return_output;
     VAR_lda_uxn_opcodes_h_l3096_c41_7212_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3096_c1_3396_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_iftrue := VAR_str2_uxn_opcodes_h_l3095_c41_27e8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c7_9114] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3097_c1_cbb6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_return_output;

     -- lda[uxn_opcodes_h_l3096_c41_7212] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l3096_c41_7212_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l3096_c41_7212_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l3096_c41_7212_phase <= VAR_lda_uxn_opcodes_h_l3096_c41_7212_phase;
     lda_uxn_opcodes_h_l3096_c41_7212_ins <= VAR_lda_uxn_opcodes_h_l3096_c41_7212_ins;
     lda_uxn_opcodes_h_l3096_c41_7212_previous_stack_read <= VAR_lda_uxn_opcodes_h_l3096_c41_7212_previous_stack_read;
     lda_uxn_opcodes_h_l3096_c41_7212_previous_ram_read <= VAR_lda_uxn_opcodes_h_l3096_c41_7212_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l3096_c41_7212_return_output := lda_uxn_opcodes_h_l3096_c41_7212_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c7_9114_return_output;
     VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3097_c1_cbb6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_iftrue := VAR_lda_uxn_opcodes_h_l3096_c41_7212_return_output;
     -- lda2[uxn_opcodes_h_l3097_c41_91a8] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l3097_c41_91a8_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l3097_c41_91a8_phase <= VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_phase;
     lda2_uxn_opcodes_h_l3097_c41_91a8_ins <= VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_ins;
     lda2_uxn_opcodes_h_l3097_c41_91a8_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_previous_stack_read;
     lda2_uxn_opcodes_h_l3097_c41_91a8_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_return_output := lda2_uxn_opcodes_h_l3097_c41_91a8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c7_032d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3098_c1_f0d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c7_032d_return_output;
     VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3098_c1_f0d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_iftrue := VAR_lda2_uxn_opcodes_h_l3097_c41_91a8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c7_5545] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_return_output;

     -- sta[uxn_opcodes_h_l3098_c41_1e9d] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l3098_c41_1e9d_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l3098_c41_1e9d_phase <= VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_phase;
     sta_uxn_opcodes_h_l3098_c41_1e9d_ins <= VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_ins;
     sta_uxn_opcodes_h_l3098_c41_1e9d_previous_stack_read <= VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_return_output := sta_uxn_opcodes_h_l3098_c41_1e9d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3099_c1_6742] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c7_5545_return_output;
     VAR_sta2_uxn_opcodes_h_l3099_c41_9428_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3099_c1_6742_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_iftrue := VAR_sta_uxn_opcodes_h_l3098_c41_1e9d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c7_4e09] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3100_c1_2604] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_return_output;

     -- sta2[uxn_opcodes_h_l3099_c41_9428] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l3099_c41_9428_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l3099_c41_9428_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l3099_c41_9428_phase <= VAR_sta2_uxn_opcodes_h_l3099_c41_9428_phase;
     sta2_uxn_opcodes_h_l3099_c41_9428_ins <= VAR_sta2_uxn_opcodes_h_l3099_c41_9428_ins;
     sta2_uxn_opcodes_h_l3099_c41_9428_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l3099_c41_9428_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l3099_c41_9428_return_output := sta2_uxn_opcodes_h_l3099_c41_9428_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output;
     VAR_dei_uxn_opcodes_h_l3100_c41_1971_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3100_c1_2604_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_iftrue := VAR_sta2_uxn_opcodes_h_l3099_c41_9428_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3101_c1_7514] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c7_f017] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_return_output;

     -- dei[uxn_opcodes_h_l3100_c41_1971] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l3100_c41_1971_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l3100_c41_1971_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l3100_c41_1971_phase <= VAR_dei_uxn_opcodes_h_l3100_c41_1971_phase;
     dei_uxn_opcodes_h_l3100_c41_1971_ins <= VAR_dei_uxn_opcodes_h_l3100_c41_1971_ins;
     dei_uxn_opcodes_h_l3100_c41_1971_previous_stack_read <= VAR_dei_uxn_opcodes_h_l3100_c41_1971_previous_stack_read;
     dei_uxn_opcodes_h_l3100_c41_1971_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l3100_c41_1971_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l3100_c41_1971_return_output := dei_uxn_opcodes_h_l3100_c41_1971_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c7_f017_return_output;
     VAR_dei2_uxn_opcodes_h_l3101_c41_4458_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3101_c1_7514_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_iftrue := VAR_dei_uxn_opcodes_h_l3100_c41_1971_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c7_f95f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3102_c1_395d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_return_output;

     -- dei2[uxn_opcodes_h_l3101_c41_4458] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l3101_c41_4458_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l3101_c41_4458_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l3101_c41_4458_phase <= VAR_dei2_uxn_opcodes_h_l3101_c41_4458_phase;
     dei2_uxn_opcodes_h_l3101_c41_4458_ins <= VAR_dei2_uxn_opcodes_h_l3101_c41_4458_ins;
     dei2_uxn_opcodes_h_l3101_c41_4458_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l3101_c41_4458_previous_stack_read;
     dei2_uxn_opcodes_h_l3101_c41_4458_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l3101_c41_4458_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l3101_c41_4458_return_output := dei2_uxn_opcodes_h_l3101_c41_4458_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output;
     VAR_deo_uxn_opcodes_h_l3102_c41_9326_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3102_c1_395d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_iftrue := VAR_dei2_uxn_opcodes_h_l3101_c41_4458_return_output;
     -- deo[uxn_opcodes_h_l3102_c41_9326] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l3102_c41_9326_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l3102_c41_9326_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l3102_c41_9326_phase <= VAR_deo_uxn_opcodes_h_l3102_c41_9326_phase;
     deo_uxn_opcodes_h_l3102_c41_9326_ins <= VAR_deo_uxn_opcodes_h_l3102_c41_9326_ins;
     deo_uxn_opcodes_h_l3102_c41_9326_previous_stack_read <= VAR_deo_uxn_opcodes_h_l3102_c41_9326_previous_stack_read;
     deo_uxn_opcodes_h_l3102_c41_9326_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l3102_c41_9326_previous_device_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l3102_c41_9326_return_output := deo_uxn_opcodes_h_l3102_c41_9326_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3103_c1_9024] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c7_3839] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c7_3839_return_output;
     VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3103_c1_9024_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_iftrue := VAR_deo_uxn_opcodes_h_l3102_c41_9326_return_output;
     -- deo2[uxn_opcodes_h_l3103_c41_07d8] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l3103_c41_07d8_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l3103_c41_07d8_phase <= VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_phase;
     deo2_uxn_opcodes_h_l3103_c41_07d8_ins <= VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_ins;
     deo2_uxn_opcodes_h_l3103_c41_07d8_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_previous_stack_read;
     deo2_uxn_opcodes_h_l3103_c41_07d8_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_previous_device_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_return_output := deo2_uxn_opcodes_h_l3103_c41_07d8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c7_ff5d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3104_c1_a435] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output;
     VAR_add_uxn_opcodes_h_l3104_c41_f4a5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3104_c1_a435_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_iftrue := VAR_deo2_uxn_opcodes_h_l3103_c41_07d8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3105_c1_6550] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c7_6081] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_return_output;

     -- add[uxn_opcodes_h_l3104_c41_f4a5] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l3104_c41_f4a5_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l3104_c41_f4a5_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l3104_c41_f4a5_phase <= VAR_add_uxn_opcodes_h_l3104_c41_f4a5_phase;
     add_uxn_opcodes_h_l3104_c41_f4a5_ins <= VAR_add_uxn_opcodes_h_l3104_c41_f4a5_ins;
     add_uxn_opcodes_h_l3104_c41_f4a5_previous_stack_read <= VAR_add_uxn_opcodes_h_l3104_c41_f4a5_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l3104_c41_f4a5_return_output := add_uxn_opcodes_h_l3104_c41_f4a5_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c7_6081_return_output;
     VAR_add2_uxn_opcodes_h_l3105_c41_ed53_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3105_c1_6550_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_iftrue := VAR_add_uxn_opcodes_h_l3104_c41_f4a5_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3106_c1_68a4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_return_output;

     -- add2[uxn_opcodes_h_l3105_c41_ed53] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l3105_c41_ed53_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l3105_c41_ed53_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l3105_c41_ed53_phase <= VAR_add2_uxn_opcodes_h_l3105_c41_ed53_phase;
     add2_uxn_opcodes_h_l3105_c41_ed53_ins <= VAR_add2_uxn_opcodes_h_l3105_c41_ed53_ins;
     add2_uxn_opcodes_h_l3105_c41_ed53_previous_stack_read <= VAR_add2_uxn_opcodes_h_l3105_c41_ed53_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l3105_c41_ed53_return_output := add2_uxn_opcodes_h_l3105_c41_ed53_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c7_9906] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c7_9906_return_output;
     VAR_sub_uxn_opcodes_h_l3106_c41_05d6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3106_c1_68a4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_iftrue := VAR_add2_uxn_opcodes_h_l3105_c41_ed53_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c7_a59e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3107_c1_0356] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_return_output;

     -- sub[uxn_opcodes_h_l3106_c41_05d6] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l3106_c41_05d6_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l3106_c41_05d6_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l3106_c41_05d6_phase <= VAR_sub_uxn_opcodes_h_l3106_c41_05d6_phase;
     sub_uxn_opcodes_h_l3106_c41_05d6_ins <= VAR_sub_uxn_opcodes_h_l3106_c41_05d6_ins;
     sub_uxn_opcodes_h_l3106_c41_05d6_previous_stack_read <= VAR_sub_uxn_opcodes_h_l3106_c41_05d6_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l3106_c41_05d6_return_output := sub_uxn_opcodes_h_l3106_c41_05d6_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output;
     VAR_sub2_uxn_opcodes_h_l3107_c41_587b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3107_c1_0356_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_iftrue := VAR_sub_uxn_opcodes_h_l3106_c41_05d6_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3108_c1_3031] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_return_output;

     -- sub2[uxn_opcodes_h_l3107_c41_587b] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l3107_c41_587b_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l3107_c41_587b_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l3107_c41_587b_phase <= VAR_sub2_uxn_opcodes_h_l3107_c41_587b_phase;
     sub2_uxn_opcodes_h_l3107_c41_587b_ins <= VAR_sub2_uxn_opcodes_h_l3107_c41_587b_ins;
     sub2_uxn_opcodes_h_l3107_c41_587b_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l3107_c41_587b_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l3107_c41_587b_return_output := sub2_uxn_opcodes_h_l3107_c41_587b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c7_cbbc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output;
     VAR_mul_uxn_opcodes_h_l3108_c41_f57d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3108_c1_3031_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_iftrue := VAR_sub2_uxn_opcodes_h_l3107_c41_587b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c7_cb1f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3109_c1_cffc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_return_output;

     -- mul[uxn_opcodes_h_l3108_c41_f57d] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l3108_c41_f57d_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l3108_c41_f57d_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l3108_c41_f57d_phase <= VAR_mul_uxn_opcodes_h_l3108_c41_f57d_phase;
     mul_uxn_opcodes_h_l3108_c41_f57d_ins <= VAR_mul_uxn_opcodes_h_l3108_c41_f57d_ins;
     mul_uxn_opcodes_h_l3108_c41_f57d_previous_stack_read <= VAR_mul_uxn_opcodes_h_l3108_c41_f57d_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l3108_c41_f57d_return_output := mul_uxn_opcodes_h_l3108_c41_f57d_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output;
     VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3109_c1_cffc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_iftrue := VAR_mul_uxn_opcodes_h_l3108_c41_f57d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c7_c842] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_return_output;

     -- mul2[uxn_opcodes_h_l3109_c41_f23e] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l3109_c41_f23e_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l3109_c41_f23e_phase <= VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_phase;
     mul2_uxn_opcodes_h_l3109_c41_f23e_ins <= VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_ins;
     mul2_uxn_opcodes_h_l3109_c41_f23e_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_return_output := mul2_uxn_opcodes_h_l3109_c41_f23e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3110_c1_7ed0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c7_c842_return_output;
     VAR_div_uxn_opcodes_h_l3110_c41_ff0f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3110_c1_7ed0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_iftrue := VAR_mul2_uxn_opcodes_h_l3109_c41_f23e_return_output;
     -- div[uxn_opcodes_h_l3110_c41_ff0f] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l3110_c41_ff0f_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l3110_c41_ff0f_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l3110_c41_ff0f_phase <= VAR_div_uxn_opcodes_h_l3110_c41_ff0f_phase;
     div_uxn_opcodes_h_l3110_c41_ff0f_ins <= VAR_div_uxn_opcodes_h_l3110_c41_ff0f_ins;
     div_uxn_opcodes_h_l3110_c41_ff0f_previous_stack_read <= VAR_div_uxn_opcodes_h_l3110_c41_ff0f_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l3110_c41_ff0f_return_output := div_uxn_opcodes_h_l3110_c41_ff0f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3111_c1_dc39] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c7_c611] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c7_c611_return_output;
     VAR_div2_uxn_opcodes_h_l3111_c41_402b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3111_c1_dc39_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_iftrue := VAR_div_uxn_opcodes_h_l3110_c41_ff0f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c7_1b6a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3112_c1_a39c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_return_output;

     -- div2[uxn_opcodes_h_l3111_c41_402b] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l3111_c41_402b_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l3111_c41_402b_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l3111_c41_402b_phase <= VAR_div2_uxn_opcodes_h_l3111_c41_402b_phase;
     div2_uxn_opcodes_h_l3111_c41_402b_ins <= VAR_div2_uxn_opcodes_h_l3111_c41_402b_ins;
     div2_uxn_opcodes_h_l3111_c41_402b_previous_stack_read <= VAR_div2_uxn_opcodes_h_l3111_c41_402b_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l3111_c41_402b_return_output := div2_uxn_opcodes_h_l3111_c41_402b_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output;
     VAR_and_uxn_opcodes_h_l3112_c41_e361_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3112_c1_a39c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_iftrue := VAR_div2_uxn_opcodes_h_l3111_c41_402b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c7_edd3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3113_c1_81b6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_return_output;

     -- and[uxn_opcodes_h_l3112_c41_e361] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l3112_c41_e361_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l3112_c41_e361_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l3112_c41_e361_phase <= VAR_and_uxn_opcodes_h_l3112_c41_e361_phase;
     and_uxn_opcodes_h_l3112_c41_e361_ins <= VAR_and_uxn_opcodes_h_l3112_c41_e361_ins;
     and_uxn_opcodes_h_l3112_c41_e361_previous_stack_read <= VAR_and_uxn_opcodes_h_l3112_c41_e361_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l3112_c41_e361_return_output := and_uxn_opcodes_h_l3112_c41_e361_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output;
     VAR_and2_uxn_opcodes_h_l3113_c41_fc34_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3113_c1_81b6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_iftrue := VAR_and_uxn_opcodes_h_l3112_c41_e361_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3114_c1_a9ea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_return_output;

     -- and2[uxn_opcodes_h_l3113_c41_fc34] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l3113_c41_fc34_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l3113_c41_fc34_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l3113_c41_fc34_phase <= VAR_and2_uxn_opcodes_h_l3113_c41_fc34_phase;
     and2_uxn_opcodes_h_l3113_c41_fc34_ins <= VAR_and2_uxn_opcodes_h_l3113_c41_fc34_ins;
     and2_uxn_opcodes_h_l3113_c41_fc34_previous_stack_read <= VAR_and2_uxn_opcodes_h_l3113_c41_fc34_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l3113_c41_fc34_return_output := and2_uxn_opcodes_h_l3113_c41_fc34_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c7_a483] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c7_a483_return_output;
     VAR_ora_uxn_opcodes_h_l3114_c41_41a7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3114_c1_a9ea_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_iftrue := VAR_and2_uxn_opcodes_h_l3113_c41_fc34_return_output;
     -- ora[uxn_opcodes_h_l3114_c41_41a7] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l3114_c41_41a7_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l3114_c41_41a7_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l3114_c41_41a7_phase <= VAR_ora_uxn_opcodes_h_l3114_c41_41a7_phase;
     ora_uxn_opcodes_h_l3114_c41_41a7_ins <= VAR_ora_uxn_opcodes_h_l3114_c41_41a7_ins;
     ora_uxn_opcodes_h_l3114_c41_41a7_previous_stack_read <= VAR_ora_uxn_opcodes_h_l3114_c41_41a7_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l3114_c41_41a7_return_output := ora_uxn_opcodes_h_l3114_c41_41a7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3115_c1_29f7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c7_5cd1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output;
     VAR_ora2_uxn_opcodes_h_l3115_c41_b611_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3115_c1_29f7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_iftrue := VAR_ora_uxn_opcodes_h_l3114_c41_41a7_return_output;
     -- ora2[uxn_opcodes_h_l3115_c41_b611] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l3115_c41_b611_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l3115_c41_b611_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l3115_c41_b611_phase <= VAR_ora2_uxn_opcodes_h_l3115_c41_b611_phase;
     ora2_uxn_opcodes_h_l3115_c41_b611_ins <= VAR_ora2_uxn_opcodes_h_l3115_c41_b611_ins;
     ora2_uxn_opcodes_h_l3115_c41_b611_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l3115_c41_b611_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l3115_c41_b611_return_output := ora2_uxn_opcodes_h_l3115_c41_b611_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3116_c1_1bd2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c7_289a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c7_289a_return_output;
     VAR_eor_uxn_opcodes_h_l3116_c41_0d60_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3116_c1_1bd2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_iftrue := VAR_ora2_uxn_opcodes_h_l3115_c41_b611_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3117_c1_afca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_return_output;

     -- eor[uxn_opcodes_h_l3116_c41_0d60] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l3116_c41_0d60_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l3116_c41_0d60_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l3116_c41_0d60_phase <= VAR_eor_uxn_opcodes_h_l3116_c41_0d60_phase;
     eor_uxn_opcodes_h_l3116_c41_0d60_ins <= VAR_eor_uxn_opcodes_h_l3116_c41_0d60_ins;
     eor_uxn_opcodes_h_l3116_c41_0d60_previous_stack_read <= VAR_eor_uxn_opcodes_h_l3116_c41_0d60_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l3116_c41_0d60_return_output := eor_uxn_opcodes_h_l3116_c41_0d60_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c7_a136] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c7_a136_return_output;
     VAR_eor2_uxn_opcodes_h_l3117_c41_4356_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3117_c1_afca_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_iftrue := VAR_eor_uxn_opcodes_h_l3116_c41_0d60_return_output;
     -- eor2[uxn_opcodes_h_l3117_c41_4356] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l3117_c41_4356_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l3117_c41_4356_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l3117_c41_4356_phase <= VAR_eor2_uxn_opcodes_h_l3117_c41_4356_phase;
     eor2_uxn_opcodes_h_l3117_c41_4356_ins <= VAR_eor2_uxn_opcodes_h_l3117_c41_4356_ins;
     eor2_uxn_opcodes_h_l3117_c41_4356_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l3117_c41_4356_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l3117_c41_4356_return_output := eor2_uxn_opcodes_h_l3117_c41_4356_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3118_c1_86d3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c7_29b1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output;
     VAR_sft_uxn_opcodes_h_l3118_c41_f38c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3118_c1_86d3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_iftrue := VAR_eor2_uxn_opcodes_h_l3117_c41_4356_return_output;
     -- sft[uxn_opcodes_h_l3118_c41_f38c] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l3118_c41_f38c_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l3118_c41_f38c_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l3118_c41_f38c_phase <= VAR_sft_uxn_opcodes_h_l3118_c41_f38c_phase;
     sft_uxn_opcodes_h_l3118_c41_f38c_ins <= VAR_sft_uxn_opcodes_h_l3118_c41_f38c_ins;
     sft_uxn_opcodes_h_l3118_c41_f38c_previous_stack_read <= VAR_sft_uxn_opcodes_h_l3118_c41_f38c_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l3118_c41_f38c_return_output := sft_uxn_opcodes_h_l3118_c41_f38c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3119_c1_a0ce] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3120_c1_4d49] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l3120_c9_2a8b_uxn_opcodes_h_l3120_c9_2a8b_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3120_c1_4d49_return_output;
     VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3119_c1_a0ce_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_iftrue := VAR_sft_uxn_opcodes_h_l3118_c41_f38c_return_output;
     -- printf_uxn_opcodes_h_l3120_c9_2a8b[uxn_opcodes_h_l3120_c9_2a8b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3120_c9_2a8b_uxn_opcodes_h_l3120_c9_2a8b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3120_c9_2a8b_uxn_opcodes_h_l3120_c9_2a8b_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l3120_c9_2a8b_uxn_opcodes_h_l3120_c9_2a8b_arg0 <= VAR_printf_uxn_opcodes_h_l3120_c9_2a8b_uxn_opcodes_h_l3120_c9_2a8b_arg0;
     -- Outputs

     -- sft2[uxn_opcodes_h_l3119_c41_ad2f] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l3119_c41_ad2f_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l3119_c41_ad2f_phase <= VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_phase;
     sft2_uxn_opcodes_h_l3119_c41_ad2f_ins <= VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_ins;
     sft2_uxn_opcodes_h_l3119_c41_ad2f_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_return_output := sft2_uxn_opcodes_h_l3119_c41_ad2f_return_output;

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_iftrue := VAR_sft2_uxn_opcodes_h_l3119_c41_ad2f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3119_c7_29b1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_cond;
     opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output := opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3119_c7_29b1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3118_c7_a136] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_cond;
     opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_return_output := opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3118_c7_a136_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3117_c7_289a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_cond;
     opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_return_output := opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3117_c7_289a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3116_c7_5cd1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_cond;
     opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output := opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3116_c7_5cd1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3115_c7_a483] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_cond;
     opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_return_output := opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3115_c7_a483_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3114_c7_edd3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_cond;
     opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output := opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3114_c7_edd3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3113_c7_1b6a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_cond;
     opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output := opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3113_c7_1b6a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3112_c7_c611] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_cond;
     opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_return_output := opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3112_c7_c611_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3111_c7_c842] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_cond;
     opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_return_output := opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3111_c7_c842_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3110_c7_cb1f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_cond;
     opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output := opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3110_c7_cb1f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3109_c7_cbbc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_cond;
     opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output := opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3109_c7_cbbc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3108_c7_a59e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_cond;
     opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output := opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3108_c7_a59e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3107_c7_9906] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_cond;
     opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_return_output := opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3107_c7_9906_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3106_c7_6081] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_cond;
     opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_return_output := opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3106_c7_6081_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3105_c7_ff5d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_cond;
     opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output := opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3105_c7_ff5d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3104_c7_3839] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_cond;
     opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_return_output := opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3104_c7_3839_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3103_c7_f95f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_cond;
     opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output := opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3103_c7_f95f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3102_c7_f017] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_cond;
     opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_return_output := opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3102_c7_f017_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3101_c7_4e09] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_cond;
     opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output := opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3101_c7_4e09_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3100_c7_5545] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_cond;
     opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_return_output := opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3100_c7_5545_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3099_c7_032d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_cond;
     opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_return_output := opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3099_c7_032d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3098_c7_9114] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_cond;
     opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_return_output := opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3098_c7_9114_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3097_c7_f428] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_cond;
     opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_return_output := opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3097_c7_f428_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3096_c7_5eab] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_cond;
     opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output := opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3096_c7_5eab_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3095_c7_a18e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_cond;
     opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output := opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3095_c7_a18e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3094_c7_bd23] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_cond;
     opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output := opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3094_c7_bd23_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3093_c7_d458] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_cond;
     opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_return_output := opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3093_c7_d458_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3092_c7_f813] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_cond;
     opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_return_output := opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3092_c7_f813_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3091_c7_70b1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_cond;
     opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output := opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3091_c7_70b1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3090_c7_a89b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_cond;
     opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output := opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3090_c7_a89b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3089_c7_dcef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_cond;
     opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output := opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3089_c7_dcef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3088_c7_b90c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_cond;
     opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output := opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3088_c7_b90c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3087_c7_9c71] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_cond;
     opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output := opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3087_c7_9c71_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3086_c7_581b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_cond;
     opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_return_output := opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3086_c7_581b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3085_c7_c003] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_cond;
     opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_return_output := opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3085_c7_c003_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3084_c7_11a8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_cond;
     opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output := opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3084_c7_11a8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3083_c7_f004] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_cond;
     opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_return_output := opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3083_c7_f004_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3082_c7_840f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_cond;
     opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_return_output := opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3082_c7_840f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3081_c7_2c50] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_cond;
     opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output := opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3081_c7_2c50_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3080_c7_83f7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_cond;
     opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output := opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3080_c7_83f7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3079_c7_c62c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_cond;
     opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output := opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3079_c7_c62c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3078_c7_9a18] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_cond;
     opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output := opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3078_c7_9a18_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3077_c7_0d48] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_cond;
     opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output := opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3077_c7_0d48_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3076_c7_4ad8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_cond;
     opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output := opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3076_c7_4ad8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3075_c7_3ad5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_cond;
     opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output := opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3075_c7_3ad5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3074_c7_d2e8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_cond;
     opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output := opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3074_c7_d2e8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3073_c7_c813] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_cond;
     opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_return_output := opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3073_c7_c813_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3072_c7_7f70] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_cond;
     opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output := opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3072_c7_7f70_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3071_c7_e00b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_cond;
     opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output := opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3071_c7_e00b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3070_c7_c4e7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_cond;
     opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output := opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3070_c7_c4e7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3069_c7_37c6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_cond;
     opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output := opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3069_c7_37c6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3068_c7_3e4e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_cond;
     opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output := opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3068_c7_3e4e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3067_c7_cdd0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_cond;
     opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output := opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3067_c7_cdd0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3066_c7_0dc6] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_cond;
     opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output := opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3066_c7_0dc6_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3065_c7_f3b7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_cond;
     opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output := opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3065_c7_f3b7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3064_c7_a6e8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_cond;
     opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output := opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3064_c7_a6e8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3063_c7_3aad] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_cond;
     opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output := opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3063_c7_3aad_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3062_c7_7fef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_cond;
     opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output := opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3062_c7_7fef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3061_c7_dbe5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_cond;
     opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output := opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3061_c7_dbe5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3060_c7_1592] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_cond;
     opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_return_output := opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3060_c7_1592_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3059_c7_640d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_cond;
     opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_return_output := opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3059_c7_640d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3058_c7_3864] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_cond;
     opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_return_output := opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3058_c7_3864_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3057_c7_6900] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_cond;
     opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_return_output := opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3057_c7_6900_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3056_c7_6b9e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_cond;
     opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output := opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3056_c7_6b9e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3055_c7_46d5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_cond;
     opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output := opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3055_c7_46d5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3054_c7_1c59] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_cond;
     opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output := opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3054_c7_1c59_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3053_c7_f676] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_cond;
     opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_return_output := opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3053_c7_f676_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3052_c7_4389] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_cond;
     opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_return_output := opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3052_c7_4389_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3051_c7_c0c2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_cond;
     opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output := opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l3051_c7_c0c2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l3050_c2_296b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_cond;
     opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output := opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l3149_c30_f27b] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l3149_c30_f27b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l3123_c17_01e7] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3123_c17_01e7_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l3150_c33_8805] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3150_c33_8805_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l3151_c34_1249] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3151_c34_1249_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l3155_c32_5983] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3155_c32_5983_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l3152_c37_95f2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3152_c37_95f2_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l3148_c34_3a80] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3148_c34_3a80_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l3145_c3_ae0b] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3145_c3_ae0b_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.is_device_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3127_l3129_DUPLICATE_7cd5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3127_l3129_DUPLICATE_7cd5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3154_l3144_l3138_DUPLICATE_ee25 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3154_l3144_l3138_DUPLICATE_ee25_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.u8_value;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l3153_c33_2a19] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3153_c33_2a19_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l3125_c6_db69] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3125_c6_db69_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l3139_c3_4e6e] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3139_c3_4e6e_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l3133_c70_2f54] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3133_c70_2f54_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l3143_c3_b7a0] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3143_c3_b7a0_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l3050_c2_296b_return_output.device_ram_address;

     -- Submodule level 146
     VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l3145_c3_ae0b_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3125_c6_db69_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3125_c6_db69_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l3123_c17_01e7_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3139_c3_4e6e_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_device_address := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l3143_c3_b7a0_return_output;
     VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3154_l3144_l3138_DUPLICATE_ee25_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3154_l3144_l3138_DUPLICATE_ee25_return_output;
     -- BIN_OP_XOR[uxn_opcodes_h_l3123_c2_347c] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_left;
     BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_return_output := BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_return_output;

     -- device_ram_update[uxn_opcodes_h_l3142_c26_3775] LATENCY=0
     -- Clock enable
     device_ram_update_uxn_opcodes_h_l3142_c26_3775_CLOCK_ENABLE <= VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_CLOCK_ENABLE;
     -- Inputs
     device_ram_update_uxn_opcodes_h_l3142_c26_3775_device_address <= VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_device_address;
     device_ram_update_uxn_opcodes_h_l3142_c26_3775_value <= VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_value;
     device_ram_update_uxn_opcodes_h_l3142_c26_3775_write_enable <= VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_write_enable;
     -- Outputs
     VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_return_output := device_ram_update_uxn_opcodes_h_l3142_c26_3775_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l3133_c59_2ad7] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3133_c59_2ad7_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3133_c70_2f54_return_output);

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_2565_uxn_opcodes_h_l3031_l3157_DUPLICATE_d2f6 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_2565_uxn_opcodes_h_l3031_l3157_DUPLICATE_d2f6_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_2565(
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l3148_c34_3a80_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l3149_c30_f27b_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l3150_c33_8805_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l3151_c34_1249_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l3152_c37_95f2_return_output,
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l3153_c33_2a19_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l3154_l3144_l3138_DUPLICATE_ee25_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3155_c32_5983_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3127_l3129_DUPLICATE_6813 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3127_l3129_DUPLICATE_6813_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3127_l3129_DUPLICATE_7cd5_return_output);

     -- Submodule level 147
     VAR_MUX_uxn_opcodes_h_l3133_c30_9ac4_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_return_output;
     VAR_MUX_uxn_opcodes_h_l3134_c20_5956_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0638_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0638_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l3123_c2_347c_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3127_l3129_DUPLICATE_6813_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l3127_l3129_DUPLICATE_6813_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_right := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3133_c59_2ad7_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_2565_uxn_opcodes_h_l3031_l3157_DUPLICATE_d2f6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_2565_uxn_opcodes_h_l3031_l3157_DUPLICATE_d2f6_return_output;
     REG_VAR_device_ram_read_value := VAR_device_ram_update_uxn_opcodes_h_l3142_c26_3775_return_output;
     -- MUX[uxn_opcodes_h_l3134_c20_5956] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3134_c20_5956_cond <= VAR_MUX_uxn_opcodes_h_l3134_c20_5956_cond;
     MUX_uxn_opcodes_h_l3134_c20_5956_iftrue <= VAR_MUX_uxn_opcodes_h_l3134_c20_5956_iftrue;
     MUX_uxn_opcodes_h_l3134_c20_5956_iffalse <= VAR_MUX_uxn_opcodes_h_l3134_c20_5956_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3134_c20_5956_return_output := MUX_uxn_opcodes_h_l3134_c20_5956_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3129_c4_4395] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l3127_c4_c275] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_return_output;

     -- Submodule level 148
     VAR_sp1_uxn_opcodes_h_l3127_c4_15b9 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3127_c4_c275_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l3129_c4_83f3 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3129_c4_4395_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_right := VAR_MUX_uxn_opcodes_h_l3134_c20_5956_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0638_iffalse := VAR_sp0_uxn_opcodes_h_l3129_c4_83f3;
     VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0638_iftrue := VAR_sp1_uxn_opcodes_h_l3127_c4_15b9;
     -- sp0_MUX[uxn_opcodes_h_l3126_c3_0638] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3126_c3_0638_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0638_cond;
     sp0_MUX_uxn_opcodes_h_l3126_c3_0638_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0638_iftrue;
     sp0_MUX_uxn_opcodes_h_l3126_c3_0638_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0638_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0638_return_output := sp0_MUX_uxn_opcodes_h_l3126_c3_0638_return_output;

     -- sp1_MUX[uxn_opcodes_h_l3126_c3_0638] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3126_c3_0638_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0638_cond;
     sp1_MUX_uxn_opcodes_h_l3126_c3_0638_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0638_iftrue;
     sp1_MUX_uxn_opcodes_h_l3126_c3_0638_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0638_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0638_return_output := sp1_MUX_uxn_opcodes_h_l3126_c3_0638_return_output;

     -- Submodule level 149
     VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l3126_c3_0638_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3126_c3_0638_return_output;
     -- sp1_MUX[uxn_opcodes_h_l3125_c2_9a53] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_cond <= VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_cond;
     sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_iftrue;
     sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output := sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output;

     -- sp0_MUX[uxn_opcodes_h_l3125_c2_9a53] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_cond <= VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_cond;
     sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_iftrue;
     sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output := sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output;

     -- Submodule level 150
     VAR_MUX_uxn_opcodes_h_l3133_c30_9ac4_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output;
     VAR_MUX_uxn_opcodes_h_l3133_c30_9ac4_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l3125_c2_9a53_return_output;
     -- MUX[uxn_opcodes_h_l3133_c30_9ac4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3133_c30_9ac4_cond <= VAR_MUX_uxn_opcodes_h_l3133_c30_9ac4_cond;
     MUX_uxn_opcodes_h_l3133_c30_9ac4_iftrue <= VAR_MUX_uxn_opcodes_h_l3133_c30_9ac4_iftrue;
     MUX_uxn_opcodes_h_l3133_c30_9ac4_iffalse <= VAR_MUX_uxn_opcodes_h_l3133_c30_9ac4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3133_c30_9ac4_return_output := MUX_uxn_opcodes_h_l3133_c30_9ac4_return_output;

     -- Submodule level 151
     -- CAST_TO_uint12_t[uxn_opcodes_h_l3133_c19_3f9d] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3133_c19_3f9d_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l3133_c30_9ac4_return_output);

     -- Submodule level 152
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_left := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l3133_c19_3f9d_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l3133_c19_0ced] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_left;
     BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_return_output := BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_return_output;

     -- Submodule level 153
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l3133_c19_0ced_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l3134_c2_d7be] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_left;
     BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_return_output := BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_return_output;

     -- Submodule level 154
     VAR_stack_address_uxn_opcodes_h_l3134_c2_0b87 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l3134_c2_d7be_return_output, 12);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l3134_c2_0b87;
     VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_stack_address := VAR_stack_address_uxn_opcodes_h_l3134_c2_0b87;
     -- stack_ram_update[uxn_opcodes_h_l3136_c21_67d1] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_stack_address;
     stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_value <= VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_value;
     stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_return_output := stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_return_output;

     -- Submodule level 155
     REG_VAR_stack_read_value := VAR_stack_ram_update_uxn_opcodes_h_l3136_c21_67d1_return_output;
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
