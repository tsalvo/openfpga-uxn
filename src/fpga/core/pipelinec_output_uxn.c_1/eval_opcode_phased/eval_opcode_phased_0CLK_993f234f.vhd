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
-- Submodules: 380
entity eval_opcode_phased_0CLK_993f234f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out eval_opcode_result_t);
end eval_opcode_phased_0CLK_993f234f;
architecture arch of eval_opcode_phased_0CLK_993f234f is
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
signal is_wait : unsigned(0 downto 0) := to_unsigned(0, 1);
signal stack_address : unsigned(11 downto 0) := to_unsigned(0, 12);
signal stack_read_value : unsigned(7 downto 0) := to_unsigned(0, 8);
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
vram_address => to_unsigned(0, 24),
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
vram_address => to_unsigned(0, 24),
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
u8_value => to_unsigned(0, 8),
u16_value => to_unsigned(0, 16),
is_opc_done => to_unsigned(0, 1))
;
signal REG_COMB_sp0 : unsigned(7 downto 0);
signal REG_COMB_sp1 : unsigned(7 downto 0);
signal REG_COMB_opc : unsigned(11 downto 0);
signal REG_COMB_stack_index : unsigned(0 downto 0);
signal REG_COMB_is_wait : unsigned(0 downto 0);
signal REG_COMB_stack_address : unsigned(11 downto 0);
signal REG_COMB_stack_read_value : unsigned(7 downto 0);
signal REG_COMB_opc_result : opcode_result_t;
signal REG_COMB_opc_eval_result : eval_opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_opcodes_h_l2696_c10_0152]
signal BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2696_c10_cd2a]
signal BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2696_c41_a835]
signal BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_return_output : unsigned(7 downto 0);

-- CONST_SL_4[uxn_opcodes_h_l2696_c57_14f2]
signal CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2_x : unsigned(11 downto 0);
signal CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2696_c10_16b5]
signal MUX_uxn_opcodes_h_l2696_c10_16b5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2696_c10_16b5_iftrue : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2696_c10_16b5_iffalse : unsigned(11 downto 0);
signal MUX_uxn_opcodes_h_l2696_c10_16b5_return_output : unsigned(11 downto 0);

-- printf_uxn_opcodes_h_l2698_c2_d875[uxn_opcodes_h_l2698_c2_d875]
signal printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg0 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg1 : unsigned(31 downto 0);
signal printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg2 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2700_c6_f7ee]
signal BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2700_c1_ce6a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2701_c7_5c17]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output : unsigned(0 downto 0);

-- is_wait_MUX[uxn_opcodes_h_l2700_c2_d362]
signal is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_cond : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_iftrue : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_iffalse : unsigned(0 downto 0);
signal is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2700_c2_d362]
signal opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2700_c23_ba69[uxn_opcodes_h_l2700_c23_ba69]
signal printf_uxn_opcodes_h_l2700_c23_ba69_uxn_opcodes_h_l2700_c23_ba69_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_450e]
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_right : unsigned(9 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2701_c1_434c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2702_c7_d538]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2701_c7_5c17]
signal opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output : opcode_result_t;

-- jci[uxn_opcodes_h_l2701_c41_b678]
signal jci_uxn_opcodes_h_l2701_c41_b678_CLOCK_ENABLE : unsigned(0 downto 0);
signal jci_uxn_opcodes_h_l2701_c41_b678_phase : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2701_c41_b678_pc : unsigned(15 downto 0);
signal jci_uxn_opcodes_h_l2701_c41_b678_previous_stack_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2701_c41_b678_previous_ram_read : unsigned(7 downto 0);
signal jci_uxn_opcodes_h_l2701_c41_b678_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2702_c11_3f92]
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2702_c1_0e74]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2703_c7_3648]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2702_c7_d538]
signal opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_return_output : opcode_result_t;

-- jmi[uxn_opcodes_h_l2702_c41_b9cc]
signal jmi_uxn_opcodes_h_l2702_c41_b9cc_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmi_uxn_opcodes_h_l2702_c41_b9cc_phase : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2702_c41_b9cc_pc : unsigned(15 downto 0);
signal jmi_uxn_opcodes_h_l2702_c41_b9cc_previous_ram_read : unsigned(7 downto 0);
signal jmi_uxn_opcodes_h_l2702_c41_b9cc_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2703_c11_0684]
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_right : unsigned(10 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2703_c1_d32f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2704_c7_8860]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2703_c7_3648]
signal opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_return_output : opcode_result_t;

-- jsi[uxn_opcodes_h_l2703_c41_fd08]
signal jsi_uxn_opcodes_h_l2703_c41_fd08_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsi_uxn_opcodes_h_l2703_c41_fd08_phase : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2703_c41_fd08_pc : unsigned(15 downto 0);
signal jsi_uxn_opcodes_h_l2703_c41_fd08_previous_ram_read : unsigned(7 downto 0);
signal jsi_uxn_opcodes_h_l2703_c41_fd08_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2704_c11_65f9]
signal BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2704_c1_65b0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2705_c7_6821]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2704_c7_8860]
signal opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2704_c41_e13e]
signal lit_uxn_opcodes_h_l2704_c41_e13e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2704_c41_e13e_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2704_c41_e13e_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2704_c41_e13e_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2704_c41_e13e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_e4c5]
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2705_c1_99f4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2706_c7_c492]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2705_c7_6821]
signal opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2705_c41_4388]
signal lit2_uxn_opcodes_h_l2705_c41_4388_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2705_c41_4388_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2705_c41_4388_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2705_c41_4388_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2705_c41_4388_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2706_c11_3893]
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2706_c1_a15a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2707_c7_882c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2706_c7_c492]
signal opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_return_output : opcode_result_t;

-- lit[uxn_opcodes_h_l2706_c41_5f6f]
signal lit_uxn_opcodes_h_l2706_c41_5f6f_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit_uxn_opcodes_h_l2706_c41_5f6f_phase : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2706_c41_5f6f_pc : unsigned(15 downto 0);
signal lit_uxn_opcodes_h_l2706_c41_5f6f_previous_ram_read : unsigned(7 downto 0);
signal lit_uxn_opcodes_h_l2706_c41_5f6f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2707_c11_3389]
signal BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2707_c1_e574]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2708_c7_ce98]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2707_c7_882c]
signal opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_return_output : opcode_result_t;

-- lit2[uxn_opcodes_h_l2707_c41_270a]
signal lit2_uxn_opcodes_h_l2707_c41_270a_CLOCK_ENABLE : unsigned(0 downto 0);
signal lit2_uxn_opcodes_h_l2707_c41_270a_phase : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2707_c41_270a_pc : unsigned(15 downto 0);
signal lit2_uxn_opcodes_h_l2707_c41_270a_previous_ram_read : unsigned(7 downto 0);
signal lit2_uxn_opcodes_h_l2707_c41_270a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2708_c11_4a7e]
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2708_c1_70c0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c7_ee05]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2708_c7_ce98]
signal opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output : opcode_result_t;

-- inc[uxn_opcodes_h_l2708_c41_572f]
signal inc_uxn_opcodes_h_l2708_c41_572f_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc_uxn_opcodes_h_l2708_c41_572f_phase : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2708_c41_572f_ins : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2708_c41_572f_previous_stack_read : unsigned(7 downto 0);
signal inc_uxn_opcodes_h_l2708_c41_572f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_00e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c1_cd7f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c7_a395]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2709_c7_ee05]
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output : opcode_result_t;

-- inc2[uxn_opcodes_h_l2709_c41_a57b]
signal inc2_uxn_opcodes_h_l2709_c41_a57b_CLOCK_ENABLE : unsigned(0 downto 0);
signal inc2_uxn_opcodes_h_l2709_c41_a57b_phase : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2709_c41_a57b_ins : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2709_c41_a57b_previous_stack_read : unsigned(7 downto 0);
signal inc2_uxn_opcodes_h_l2709_c41_a57b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_267e]
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c1_f5cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c7_b119]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2710_c7_a395]
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_return_output : opcode_result_t;

-- pop[uxn_opcodes_h_l2710_c41_b071]
signal pop_uxn_opcodes_h_l2710_c41_b071_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop_uxn_opcodes_h_l2710_c41_b071_phase : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2710_c41_b071_ins : unsigned(7 downto 0);
signal pop_uxn_opcodes_h_l2710_c41_b071_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2711_c11_4ec6]
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c1_8440]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c7_47c2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2711_c7_b119]
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_return_output : opcode_result_t;

-- pop2[uxn_opcodes_h_l2711_c41_c35c]
signal pop2_uxn_opcodes_h_l2711_c41_c35c_CLOCK_ENABLE : unsigned(0 downto 0);
signal pop2_uxn_opcodes_h_l2711_c41_c35c_phase : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2711_c41_c35c_ins : unsigned(7 downto 0);
signal pop2_uxn_opcodes_h_l2711_c41_c35c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2712_c11_94c1]
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c1_a45f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c7_69ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2712_c7_47c2]
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output : opcode_result_t;

-- nip[uxn_opcodes_h_l2712_c41_7bf8]
signal nip_uxn_opcodes_h_l2712_c41_7bf8_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip_uxn_opcodes_h_l2712_c41_7bf8_phase : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2712_c41_7bf8_ins : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2712_c41_7bf8_previous_stack_read : unsigned(7 downto 0);
signal nip_uxn_opcodes_h_l2712_c41_7bf8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_f848]
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c1_14a5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c7_081e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2713_c7_69ef]
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output : opcode_result_t;

-- nip2[uxn_opcodes_h_l2713_c41_7e7b]
signal nip2_uxn_opcodes_h_l2713_c41_7e7b_CLOCK_ENABLE : unsigned(0 downto 0);
signal nip2_uxn_opcodes_h_l2713_c41_7e7b_phase : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2713_c41_7e7b_ins : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2713_c41_7e7b_previous_stack_read : unsigned(7 downto 0);
signal nip2_uxn_opcodes_h_l2713_c41_7e7b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_1645]
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c1_8c12]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c7_4b75]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2714_c7_081e]
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_return_output : opcode_result_t;

-- swp[uxn_opcodes_h_l2714_c41_cf94]
signal swp_uxn_opcodes_h_l2714_c41_cf94_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp_uxn_opcodes_h_l2714_c41_cf94_phase : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2714_c41_cf94_ins : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2714_c41_cf94_previous_stack_read : unsigned(7 downto 0);
signal swp_uxn_opcodes_h_l2714_c41_cf94_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2715_c11_f0c6]
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c1_d764]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c7_2dbb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2715_c7_4b75]
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output : opcode_result_t;

-- swp2[uxn_opcodes_h_l2715_c41_81b0]
signal swp2_uxn_opcodes_h_l2715_c41_81b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal swp2_uxn_opcodes_h_l2715_c41_81b0_phase : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2715_c41_81b0_ins : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2715_c41_81b0_previous_stack_read : unsigned(7 downto 0);
signal swp2_uxn_opcodes_h_l2715_c41_81b0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2716_c11_7b5c]
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c1_a513]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c7_d1ca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2716_c7_2dbb]
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output : opcode_result_t;

-- rot[uxn_opcodes_h_l2716_c41_1f20]
signal rot_uxn_opcodes_h_l2716_c41_1f20_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot_uxn_opcodes_h_l2716_c41_1f20_phase : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2716_c41_1f20_ins : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2716_c41_1f20_previous_stack_read : unsigned(7 downto 0);
signal rot_uxn_opcodes_h_l2716_c41_1f20_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_5198]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c1_3e79]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c7_750b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2717_c7_d1ca]
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output : opcode_result_t;

-- rot2[uxn_opcodes_h_l2717_c41_9c3c]
signal rot2_uxn_opcodes_h_l2717_c41_9c3c_CLOCK_ENABLE : unsigned(0 downto 0);
signal rot2_uxn_opcodes_h_l2717_c41_9c3c_phase : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2717_c41_9c3c_ins : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2717_c41_9c3c_previous_stack_read : unsigned(7 downto 0);
signal rot2_uxn_opcodes_h_l2717_c41_9c3c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_e23e]
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c1_b866]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c7_b6a5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2718_c7_750b]
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_return_output : opcode_result_t;

-- dup[uxn_opcodes_h_l2718_c41_c17e]
signal dup_uxn_opcodes_h_l2718_c41_c17e_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup_uxn_opcodes_h_l2718_c41_c17e_phase : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2718_c41_c17e_ins : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2718_c41_c17e_previous_stack_read : unsigned(7 downto 0);
signal dup_uxn_opcodes_h_l2718_c41_c17e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2719_c11_7449]
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c1_a5e1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c7_cf11]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2719_c7_b6a5]
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output : opcode_result_t;

-- dup2[uxn_opcodes_h_l2719_c41_0679]
signal dup2_uxn_opcodes_h_l2719_c41_0679_CLOCK_ENABLE : unsigned(0 downto 0);
signal dup2_uxn_opcodes_h_l2719_c41_0679_phase : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2719_c41_0679_ins : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2719_c41_0679_previous_stack_read : unsigned(7 downto 0);
signal dup2_uxn_opcodes_h_l2719_c41_0679_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2720_c11_65d7]
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c1_6966]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c7_25f4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2720_c7_cf11]
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output : opcode_result_t;

-- ovr[uxn_opcodes_h_l2720_c41_04a0]
signal ovr_uxn_opcodes_h_l2720_c41_04a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr_uxn_opcodes_h_l2720_c41_04a0_phase : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2720_c41_04a0_ins : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2720_c41_04a0_previous_stack_read : unsigned(7 downto 0);
signal ovr_uxn_opcodes_h_l2720_c41_04a0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2721_c11_ad30]
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c1_7482]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c7_51db]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2721_c7_25f4]
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output : opcode_result_t;

-- ovr2[uxn_opcodes_h_l2721_c41_3590]
signal ovr2_uxn_opcodes_h_l2721_c41_3590_CLOCK_ENABLE : unsigned(0 downto 0);
signal ovr2_uxn_opcodes_h_l2721_c41_3590_phase : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2721_c41_3590_ins : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2721_c41_3590_previous_stack_read : unsigned(7 downto 0);
signal ovr2_uxn_opcodes_h_l2721_c41_3590_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_c17f]
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c1_b44b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c7_462e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2722_c7_51db]
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_return_output : opcode_result_t;

-- equ[uxn_opcodes_h_l2722_c41_c13c]
signal equ_uxn_opcodes_h_l2722_c41_c13c_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ_uxn_opcodes_h_l2722_c41_c13c_phase : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2722_c41_c13c_ins : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2722_c41_c13c_previous_stack_read : unsigned(7 downto 0);
signal equ_uxn_opcodes_h_l2722_c41_c13c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_0e1f]
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c1_4573]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c7_5a41]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2723_c7_462e]
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_return_output : opcode_result_t;

-- equ2[uxn_opcodes_h_l2723_c41_7338]
signal equ2_uxn_opcodes_h_l2723_c41_7338_CLOCK_ENABLE : unsigned(0 downto 0);
signal equ2_uxn_opcodes_h_l2723_c41_7338_phase : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2723_c41_7338_ins : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2723_c41_7338_previous_stack_read : unsigned(7 downto 0);
signal equ2_uxn_opcodes_h_l2723_c41_7338_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_3e5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c1_122c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c7_3d5f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2724_c7_5a41]
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output : opcode_result_t;

-- neq[uxn_opcodes_h_l2724_c41_2133]
signal neq_uxn_opcodes_h_l2724_c41_2133_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq_uxn_opcodes_h_l2724_c41_2133_phase : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2724_c41_2133_ins : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2724_c41_2133_previous_stack_read : unsigned(7 downto 0);
signal neq_uxn_opcodes_h_l2724_c41_2133_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_1aba]
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c1_d337]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c7_f734]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2725_c7_3d5f]
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output : opcode_result_t;

-- neq2[uxn_opcodes_h_l2725_c41_9230]
signal neq2_uxn_opcodes_h_l2725_c41_9230_CLOCK_ENABLE : unsigned(0 downto 0);
signal neq2_uxn_opcodes_h_l2725_c41_9230_phase : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2725_c41_9230_ins : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2725_c41_9230_previous_stack_read : unsigned(7 downto 0);
signal neq2_uxn_opcodes_h_l2725_c41_9230_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_1548]
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c1_bac8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c7_fe68]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2726_c7_f734]
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_return_output : opcode_result_t;

-- gth[uxn_opcodes_h_l2726_c41_a7a0]
signal gth_uxn_opcodes_h_l2726_c41_a7a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth_uxn_opcodes_h_l2726_c41_a7a0_phase : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2726_c41_a7a0_ins : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2726_c41_a7a0_previous_stack_read : unsigned(7 downto 0);
signal gth_uxn_opcodes_h_l2726_c41_a7a0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_c15a]
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c1_f89c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c7_ac0b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2727_c7_fe68]
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output : opcode_result_t;

-- gth2[uxn_opcodes_h_l2727_c41_48b0]
signal gth2_uxn_opcodes_h_l2727_c41_48b0_CLOCK_ENABLE : unsigned(0 downto 0);
signal gth2_uxn_opcodes_h_l2727_c41_48b0_phase : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2727_c41_48b0_ins : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2727_c41_48b0_previous_stack_read : unsigned(7 downto 0);
signal gth2_uxn_opcodes_h_l2727_c41_48b0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_16d4]
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c1_98fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c7_e883]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2728_c7_ac0b]
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output : opcode_result_t;

-- lth[uxn_opcodes_h_l2728_c41_577e]
signal lth_uxn_opcodes_h_l2728_c41_577e_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth_uxn_opcodes_h_l2728_c41_577e_phase : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2728_c41_577e_ins : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2728_c41_577e_previous_stack_read : unsigned(7 downto 0);
signal lth_uxn_opcodes_h_l2728_c41_577e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2729_c11_8cda]
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c1_c7e5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c7_0b76]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2729_c7_e883]
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_return_output : opcode_result_t;

-- lth2[uxn_opcodes_h_l2729_c41_f078]
signal lth2_uxn_opcodes_h_l2729_c41_f078_CLOCK_ENABLE : unsigned(0 downto 0);
signal lth2_uxn_opcodes_h_l2729_c41_f078_phase : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2729_c41_f078_ins : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2729_c41_f078_previous_stack_read : unsigned(7 downto 0);
signal lth2_uxn_opcodes_h_l2729_c41_f078_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_1c2b]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c1_3e88]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c7_efc3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2730_c7_0b76]
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output : opcode_result_t;

-- jmp[uxn_opcodes_h_l2730_c41_a2ac]
signal jmp_uxn_opcodes_h_l2730_c41_a2ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp_uxn_opcodes_h_l2730_c41_a2ac_phase : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2730_c41_a2ac_ins : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2730_c41_a2ac_pc : unsigned(15 downto 0);
signal jmp_uxn_opcodes_h_l2730_c41_a2ac_previous_stack_read : unsigned(7 downto 0);
signal jmp_uxn_opcodes_h_l2730_c41_a2ac_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_0610]
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c1_dab5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c7_9416]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2731_c7_efc3]
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output : opcode_result_t;

-- jmp2[uxn_opcodes_h_l2731_c41_5859]
signal jmp2_uxn_opcodes_h_l2731_c41_5859_CLOCK_ENABLE : unsigned(0 downto 0);
signal jmp2_uxn_opcodes_h_l2731_c41_5859_phase : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2731_c41_5859_ins : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2731_c41_5859_previous_stack_read : unsigned(7 downto 0);
signal jmp2_uxn_opcodes_h_l2731_c41_5859_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_0d4b]
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c1_f6a0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c7_07ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2732_c7_9416]
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_return_output : opcode_result_t;

-- jcn[uxn_opcodes_h_l2732_c41_d896]
signal jcn_uxn_opcodes_h_l2732_c41_d896_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn_uxn_opcodes_h_l2732_c41_d896_phase : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2732_c41_d896_ins : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2732_c41_d896_pc : unsigned(15 downto 0);
signal jcn_uxn_opcodes_h_l2732_c41_d896_previous_stack_read : unsigned(7 downto 0);
signal jcn_uxn_opcodes_h_l2732_c41_d896_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2733_c11_becd]
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c1_f077]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c7_c7e4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2733_c7_07ec]
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output : opcode_result_t;

-- jcn2[uxn_opcodes_h_l2733_c41_a3e0]
signal jcn2_uxn_opcodes_h_l2733_c41_a3e0_CLOCK_ENABLE : unsigned(0 downto 0);
signal jcn2_uxn_opcodes_h_l2733_c41_a3e0_phase : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2733_c41_a3e0_ins : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2733_c41_a3e0_previous_stack_read : unsigned(7 downto 0);
signal jcn2_uxn_opcodes_h_l2733_c41_a3e0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_f7e8]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c1_b811]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c7_2d28]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2734_c7_c7e4]
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output : opcode_result_t;

-- jsr[uxn_opcodes_h_l2734_c41_65a0]
signal jsr_uxn_opcodes_h_l2734_c41_65a0_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr_uxn_opcodes_h_l2734_c41_65a0_phase : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2734_c41_65a0_ins : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2734_c41_65a0_pc : unsigned(15 downto 0);
signal jsr_uxn_opcodes_h_l2734_c41_65a0_previous_stack_read : unsigned(7 downto 0);
signal jsr_uxn_opcodes_h_l2734_c41_65a0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_776b]
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c1_81ac]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c7_fd1b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2735_c7_2d28]
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output : opcode_result_t;

-- jsr2[uxn_opcodes_h_l2735_c41_2859]
signal jsr2_uxn_opcodes_h_l2735_c41_2859_CLOCK_ENABLE : unsigned(0 downto 0);
signal jsr2_uxn_opcodes_h_l2735_c41_2859_phase : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2735_c41_2859_ins : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2735_c41_2859_pc : unsigned(15 downto 0);
signal jsr2_uxn_opcodes_h_l2735_c41_2859_previous_stack_read : unsigned(7 downto 0);
signal jsr2_uxn_opcodes_h_l2735_c41_2859_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_1753]
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c1_4087]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c7_c7d4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2736_c7_fd1b]
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output : opcode_result_t;

-- sth[uxn_opcodes_h_l2736_c41_fde0]
signal sth_uxn_opcodes_h_l2736_c41_fde0_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth_uxn_opcodes_h_l2736_c41_fde0_phase : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2736_c41_fde0_ins : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2736_c41_fde0_previous_stack_read : unsigned(7 downto 0);
signal sth_uxn_opcodes_h_l2736_c41_fde0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2737_c11_7ea0]
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c1_7c96]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c7_6ed5]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2737_c7_c7d4]
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output : opcode_result_t;

-- sth2[uxn_opcodes_h_l2737_c41_432c]
signal sth2_uxn_opcodes_h_l2737_c41_432c_CLOCK_ENABLE : unsigned(0 downto 0);
signal sth2_uxn_opcodes_h_l2737_c41_432c_phase : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2737_c41_432c_ins : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2737_c41_432c_previous_stack_read : unsigned(7 downto 0);
signal sth2_uxn_opcodes_h_l2737_c41_432c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_0be4]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c1_1d6e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c7_7bf4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2738_c7_6ed5]
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output : opcode_result_t;

-- ldz[uxn_opcodes_h_l2738_c41_2192]
signal ldz_uxn_opcodes_h_l2738_c41_2192_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz_uxn_opcodes_h_l2738_c41_2192_phase : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2738_c41_2192_ins : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2738_c41_2192_previous_stack_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2738_c41_2192_previous_ram_read : unsigned(7 downto 0);
signal ldz_uxn_opcodes_h_l2738_c41_2192_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_1536]
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c1_0334]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c7_8b6c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2739_c7_7bf4]
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output : opcode_result_t;

-- ldz2[uxn_opcodes_h_l2739_c41_de57]
signal ldz2_uxn_opcodes_h_l2739_c41_de57_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldz2_uxn_opcodes_h_l2739_c41_de57_phase : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2739_c41_de57_ins : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2739_c41_de57_previous_stack_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2739_c41_de57_previous_ram_read : unsigned(7 downto 0);
signal ldz2_uxn_opcodes_h_l2739_c41_de57_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2740_c11_cf8b]
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c1_781e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c7_dabb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2740_c7_8b6c]
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output : opcode_result_t;

-- stz[uxn_opcodes_h_l2740_c41_7810]
signal stz_uxn_opcodes_h_l2740_c41_7810_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz_uxn_opcodes_h_l2740_c41_7810_phase : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2740_c41_7810_ins : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2740_c41_7810_previous_stack_read : unsigned(7 downto 0);
signal stz_uxn_opcodes_h_l2740_c41_7810_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_71b5]
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c1_5b23]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c7_6ebc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2741_c7_dabb]
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output : opcode_result_t;

-- stz2[uxn_opcodes_h_l2741_c41_cbc2]
signal stz2_uxn_opcodes_h_l2741_c41_cbc2_CLOCK_ENABLE : unsigned(0 downto 0);
signal stz2_uxn_opcodes_h_l2741_c41_cbc2_phase : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2741_c41_cbc2_ins : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2741_c41_cbc2_previous_stack_read : unsigned(7 downto 0);
signal stz2_uxn_opcodes_h_l2741_c41_cbc2_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_9158]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c1_b691]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c7_63d8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2742_c7_6ebc]
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output : opcode_result_t;

-- ldr[uxn_opcodes_h_l2742_c41_f07b]
signal ldr_uxn_opcodes_h_l2742_c41_f07b_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr_uxn_opcodes_h_l2742_c41_f07b_phase : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2742_c41_f07b_ins : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2742_c41_f07b_pc : unsigned(15 downto 0);
signal ldr_uxn_opcodes_h_l2742_c41_f07b_previous_stack_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2742_c41_f07b_previous_ram_read : unsigned(7 downto 0);
signal ldr_uxn_opcodes_h_l2742_c41_f07b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_ba9f]
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c1_54e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c7_4b17]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2743_c7_63d8]
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output : opcode_result_t;

-- ldr2[uxn_opcodes_h_l2743_c41_0c58]
signal ldr2_uxn_opcodes_h_l2743_c41_0c58_CLOCK_ENABLE : unsigned(0 downto 0);
signal ldr2_uxn_opcodes_h_l2743_c41_0c58_phase : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2743_c41_0c58_ins : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2743_c41_0c58_pc : unsigned(15 downto 0);
signal ldr2_uxn_opcodes_h_l2743_c41_0c58_previous_stack_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2743_c41_0c58_previous_ram_read : unsigned(7 downto 0);
signal ldr2_uxn_opcodes_h_l2743_c41_0c58_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2744_c11_334e]
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c1_e70d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c7_04c0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2744_c7_4b17]
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output : opcode_result_t;

-- str1[uxn_opcodes_h_l2744_c41_3dfb]
signal str1_uxn_opcodes_h_l2744_c41_3dfb_CLOCK_ENABLE : unsigned(0 downto 0);
signal str1_uxn_opcodes_h_l2744_c41_3dfb_phase : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2744_c41_3dfb_ins : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2744_c41_3dfb_pc : unsigned(15 downto 0);
signal str1_uxn_opcodes_h_l2744_c41_3dfb_previous_stack_read : unsigned(7 downto 0);
signal str1_uxn_opcodes_h_l2744_c41_3dfb_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2745_c11_5096]
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c1_b0c6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c7_7272]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2745_c7_04c0]
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output : opcode_result_t;

-- str2[uxn_opcodes_h_l2745_c41_c88a]
signal str2_uxn_opcodes_h_l2745_c41_c88a_CLOCK_ENABLE : unsigned(0 downto 0);
signal str2_uxn_opcodes_h_l2745_c41_c88a_phase : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2745_c41_c88a_ins : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2745_c41_c88a_pc : unsigned(15 downto 0);
signal str2_uxn_opcodes_h_l2745_c41_c88a_previous_stack_read : unsigned(7 downto 0);
signal str2_uxn_opcodes_h_l2745_c41_c88a_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_9095]
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c1_bef4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c7_6ca7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2746_c7_7272]
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_return_output : opcode_result_t;

-- lda[uxn_opcodes_h_l2746_c41_3e4d]
signal lda_uxn_opcodes_h_l2746_c41_3e4d_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda_uxn_opcodes_h_l2746_c41_3e4d_phase : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2746_c41_3e4d_ins : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2746_c41_3e4d_previous_stack_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2746_c41_3e4d_previous_ram_read : unsigned(7 downto 0);
signal lda_uxn_opcodes_h_l2746_c41_3e4d_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_40bc]
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c1_09aa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c7_9ffc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2747_c7_6ca7]
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output : opcode_result_t;

-- lda2[uxn_opcodes_h_l2747_c41_63f8]
signal lda2_uxn_opcodes_h_l2747_c41_63f8_CLOCK_ENABLE : unsigned(0 downto 0);
signal lda2_uxn_opcodes_h_l2747_c41_63f8_phase : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2747_c41_63f8_ins : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2747_c41_63f8_previous_stack_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2747_c41_63f8_previous_ram_read : unsigned(7 downto 0);
signal lda2_uxn_opcodes_h_l2747_c41_63f8_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2748_c11_14f8]
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c1_ec30]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c7_c378]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2748_c7_9ffc]
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output : opcode_result_t;

-- sta[uxn_opcodes_h_l2748_c41_4167]
signal sta_uxn_opcodes_h_l2748_c41_4167_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta_uxn_opcodes_h_l2748_c41_4167_phase : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2748_c41_4167_ins : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2748_c41_4167_previous_stack_read : unsigned(7 downto 0);
signal sta_uxn_opcodes_h_l2748_c41_4167_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_e008]
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c1_5c18]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c7_594a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2749_c7_c378]
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_return_output : opcode_result_t;

-- sta2[uxn_opcodes_h_l2749_c41_4fa0]
signal sta2_uxn_opcodes_h_l2749_c41_4fa0_CLOCK_ENABLE : unsigned(0 downto 0);
signal sta2_uxn_opcodes_h_l2749_c41_4fa0_phase : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2749_c41_4fa0_ins : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2749_c41_4fa0_previous_stack_read : unsigned(7 downto 0);
signal sta2_uxn_opcodes_h_l2749_c41_4fa0_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2750_c11_23b3]
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c1_f952]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c7_3918]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2750_c7_594a]
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_return_output : opcode_result_t;

-- dei[uxn_opcodes_h_l2750_c41_574b]
signal dei_uxn_opcodes_h_l2750_c41_574b_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_uxn_opcodes_h_l2750_c41_574b_phase : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2750_c41_574b_ins : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2750_c41_574b_previous_stack_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2750_c41_574b_previous_device_ram_read : unsigned(7 downto 0);
signal dei_uxn_opcodes_h_l2750_c41_574b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_65d2]
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c1_8584]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c7_8ae0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2751_c7_3918]
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_return_output : opcode_result_t;

-- dei2[uxn_opcodes_h_l2751_c41_9acd]
signal dei2_uxn_opcodes_h_l2751_c41_9acd_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei2_uxn_opcodes_h_l2751_c41_9acd_phase : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2751_c41_9acd_ins : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2751_c41_9acd_previous_stack_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2751_c41_9acd_previous_device_ram_read : unsigned(7 downto 0);
signal dei2_uxn_opcodes_h_l2751_c41_9acd_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2752_c11_6b13]
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c1_d31d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c7_59d1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2752_c7_8ae0]
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output : opcode_result_t;

-- deo[uxn_opcodes_h_l2752_c41_e372]
signal deo_uxn_opcodes_h_l2752_c41_e372_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo_uxn_opcodes_h_l2752_c41_e372_phase : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2752_c41_e372_ins : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2752_c41_e372_previous_stack_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2752_c41_e372_previous_device_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2752_c41_e372_previous_ram_read : unsigned(7 downto 0);
signal deo_uxn_opcodes_h_l2752_c41_e372_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2753_c11_d3a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c1_87b2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c7_67fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2753_c7_59d1]
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output : opcode_result_t;

-- deo2[uxn_opcodes_h_l2753_c41_12a3]
signal deo2_uxn_opcodes_h_l2753_c41_12a3_CLOCK_ENABLE : unsigned(0 downto 0);
signal deo2_uxn_opcodes_h_l2753_c41_12a3_phase : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2753_c41_12a3_ins : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2753_c41_12a3_previous_stack_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2753_c41_12a3_previous_device_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2753_c41_12a3_previous_ram_read : unsigned(7 downto 0);
signal deo2_uxn_opcodes_h_l2753_c41_12a3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_3e34]
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c1_ea55]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c7_b309]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2754_c7_67fd]
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output : opcode_result_t;

-- add[uxn_opcodes_h_l2754_c41_3abf]
signal add_uxn_opcodes_h_l2754_c41_3abf_CLOCK_ENABLE : unsigned(0 downto 0);
signal add_uxn_opcodes_h_l2754_c41_3abf_phase : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2754_c41_3abf_ins : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2754_c41_3abf_previous_stack_read : unsigned(7 downto 0);
signal add_uxn_opcodes_h_l2754_c41_3abf_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_2e08]
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c1_df89]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c7_4e6d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2755_c7_b309]
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_return_output : opcode_result_t;

-- add2[uxn_opcodes_h_l2755_c41_9ced]
signal add2_uxn_opcodes_h_l2755_c41_9ced_CLOCK_ENABLE : unsigned(0 downto 0);
signal add2_uxn_opcodes_h_l2755_c41_9ced_phase : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2755_c41_9ced_ins : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2755_c41_9ced_previous_stack_read : unsigned(7 downto 0);
signal add2_uxn_opcodes_h_l2755_c41_9ced_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2756_c11_fc3b]
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c1_df2f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c7_0ae3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2756_c7_4e6d]
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output : opcode_result_t;

-- sub[uxn_opcodes_h_l2756_c41_feda]
signal sub_uxn_opcodes_h_l2756_c41_feda_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub_uxn_opcodes_h_l2756_c41_feda_phase : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2756_c41_feda_ins : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2756_c41_feda_previous_stack_read : unsigned(7 downto 0);
signal sub_uxn_opcodes_h_l2756_c41_feda_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_a906]
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c1_79c6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c7_bf4e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2757_c7_0ae3]
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output : opcode_result_t;

-- sub2[uxn_opcodes_h_l2757_c41_6d67]
signal sub2_uxn_opcodes_h_l2757_c41_6d67_CLOCK_ENABLE : unsigned(0 downto 0);
signal sub2_uxn_opcodes_h_l2757_c41_6d67_phase : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2757_c41_6d67_ins : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2757_c41_6d67_previous_stack_read : unsigned(7 downto 0);
signal sub2_uxn_opcodes_h_l2757_c41_6d67_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_4cf5]
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c1_4ace]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c7_2d30]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2758_c7_bf4e]
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output : opcode_result_t;

-- mul[uxn_opcodes_h_l2758_c41_7257]
signal mul_uxn_opcodes_h_l2758_c41_7257_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul_uxn_opcodes_h_l2758_c41_7257_phase : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2758_c41_7257_ins : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2758_c41_7257_previous_stack_read : unsigned(7 downto 0);
signal mul_uxn_opcodes_h_l2758_c41_7257_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_0e41]
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c1_e093]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c7_749b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2759_c7_2d30]
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output : opcode_result_t;

-- mul2[uxn_opcodes_h_l2759_c41_1949]
signal mul2_uxn_opcodes_h_l2759_c41_1949_CLOCK_ENABLE : unsigned(0 downto 0);
signal mul2_uxn_opcodes_h_l2759_c41_1949_phase : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2759_c41_1949_ins : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2759_c41_1949_previous_stack_read : unsigned(7 downto 0);
signal mul2_uxn_opcodes_h_l2759_c41_1949_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_3a12]
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c1_58ba]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c7_e3c7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2760_c7_749b]
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_return_output : opcode_result_t;

-- div[uxn_opcodes_h_l2760_c41_6c4e]
signal div_uxn_opcodes_h_l2760_c41_6c4e_CLOCK_ENABLE : unsigned(0 downto 0);
signal div_uxn_opcodes_h_l2760_c41_6c4e_phase : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2760_c41_6c4e_ins : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2760_c41_6c4e_previous_stack_read : unsigned(7 downto 0);
signal div_uxn_opcodes_h_l2760_c41_6c4e_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_b650]
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c1_f836]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c7_c6ec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2761_c7_e3c7]
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output : opcode_result_t;

-- div2[uxn_opcodes_h_l2761_c41_0c5c]
signal div2_uxn_opcodes_h_l2761_c41_0c5c_CLOCK_ENABLE : unsigned(0 downto 0);
signal div2_uxn_opcodes_h_l2761_c41_0c5c_phase : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2761_c41_0c5c_ins : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2761_c41_0c5c_previous_stack_read : unsigned(7 downto 0);
signal div2_uxn_opcodes_h_l2761_c41_0c5c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2762_c11_c3ab]
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c1_1efa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c7_653f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2762_c7_c6ec]
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output : opcode_result_t;

-- and[uxn_opcodes_h_l2762_c41_ddd3]
signal and_uxn_opcodes_h_l2762_c41_ddd3_CLOCK_ENABLE : unsigned(0 downto 0);
signal and_uxn_opcodes_h_l2762_c41_ddd3_phase : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2762_c41_ddd3_ins : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2762_c41_ddd3_previous_stack_read : unsigned(7 downto 0);
signal and_uxn_opcodes_h_l2762_c41_ddd3_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_dc77]
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c1_bd60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c7_b901]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2763_c7_653f]
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_return_output : opcode_result_t;

-- and2[uxn_opcodes_h_l2763_c41_ef9c]
signal and2_uxn_opcodes_h_l2763_c41_ef9c_CLOCK_ENABLE : unsigned(0 downto 0);
signal and2_uxn_opcodes_h_l2763_c41_ef9c_phase : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2763_c41_ef9c_ins : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2763_c41_ef9c_previous_stack_read : unsigned(7 downto 0);
signal and2_uxn_opcodes_h_l2763_c41_ef9c_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2764_c11_e1fc]
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c1_10cc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c7_edc3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2764_c7_b901]
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_return_output : opcode_result_t;

-- ora[uxn_opcodes_h_l2764_c41_9127]
signal ora_uxn_opcodes_h_l2764_c41_9127_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora_uxn_opcodes_h_l2764_c41_9127_phase : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2764_c41_9127_ins : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2764_c41_9127_previous_stack_read : unsigned(7 downto 0);
signal ora_uxn_opcodes_h_l2764_c41_9127_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_7460]
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c1_3d86]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c7_c424]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2765_c7_edc3]
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output : opcode_result_t;

-- ora2[uxn_opcodes_h_l2765_c41_1769]
signal ora2_uxn_opcodes_h_l2765_c41_1769_CLOCK_ENABLE : unsigned(0 downto 0);
signal ora2_uxn_opcodes_h_l2765_c41_1769_phase : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2765_c41_1769_ins : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2765_c41_1769_previous_stack_read : unsigned(7 downto 0);
signal ora2_uxn_opcodes_h_l2765_c41_1769_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_97a4]
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c1_6146]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c7_f2cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2766_c7_c424]
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_return_output : opcode_result_t;

-- eor[uxn_opcodes_h_l2766_c41_a32b]
signal eor_uxn_opcodes_h_l2766_c41_a32b_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor_uxn_opcodes_h_l2766_c41_a32b_phase : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2766_c41_a32b_ins : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2766_c41_a32b_previous_stack_read : unsigned(7 downto 0);
signal eor_uxn_opcodes_h_l2766_c41_a32b_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2767_c11_c672]
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c1_b637]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c7_c600]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2767_c7_f2cc]
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output : opcode_result_t;

-- eor2[uxn_opcodes_h_l2767_c41_d86f]
signal eor2_uxn_opcodes_h_l2767_c41_d86f_CLOCK_ENABLE : unsigned(0 downto 0);
signal eor2_uxn_opcodes_h_l2767_c41_d86f_phase : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2767_c41_d86f_ins : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2767_c41_d86f_previous_stack_read : unsigned(7 downto 0);
signal eor2_uxn_opcodes_h_l2767_c41_d86f_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_722c]
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c1_d24b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c7_0579]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2768_c7_c600]
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_return_output : opcode_result_t;

-- sft[uxn_opcodes_h_l2768_c41_8e76]
signal sft_uxn_opcodes_h_l2768_c41_8e76_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft_uxn_opcodes_h_l2768_c41_8e76_phase : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2768_c41_8e76_ins : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2768_c41_8e76_previous_stack_read : unsigned(7 downto 0);
signal sft_uxn_opcodes_h_l2768_c41_8e76_return_output : opcode_result_t;

-- BIN_OP_EQ[uxn_opcodes_h_l2769_c11_80f1]
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_right : unsigned(5 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c1_fcd8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c1_8598]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_return_output : unsigned(0 downto 0);

-- opc_result_MUX[uxn_opcodes_h_l2769_c7_0579]
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_cond : unsigned(0 downto 0);
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_iftrue : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_iffalse : opcode_result_t;
signal opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_return_output : opcode_result_t;

-- sft2[uxn_opcodes_h_l2769_c41_d577]
signal sft2_uxn_opcodes_h_l2769_c41_d577_CLOCK_ENABLE : unsigned(0 downto 0);
signal sft2_uxn_opcodes_h_l2769_c41_d577_phase : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2769_c41_d577_ins : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2769_c41_d577_previous_stack_read : unsigned(7 downto 0);
signal sft2_uxn_opcodes_h_l2769_c41_d577_return_output : opcode_result_t;

-- printf_uxn_opcodes_h_l2770_c9_0215[uxn_opcodes_h_l2770_c9_0215]
signal printf_uxn_opcodes_h_l2770_c9_0215_uxn_opcodes_h_l2770_c9_0215_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_opcodes_h_l2770_c9_0215_uxn_opcodes_h_l2770_c9_0215_arg0 : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2772_c18_edb9]
signal BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2772_c18_8adb]
signal BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2772_c18_3212]
signal MUX_uxn_opcodes_h_l2772_c18_3212_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2772_c18_3212_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2772_c18_3212_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2772_c18_3212_return_output : unsigned(0 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l2773_c2_fd9e]
signal BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_left : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_right : unsigned(0 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_return_output : unsigned(0 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2775_c2_289c]
signal sp1_MUX_uxn_opcodes_h_l2775_c2_289c_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2775_c2_289c_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2775_c2_289c_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2775_c2_289c_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2775_c2_289c]
signal sp0_MUX_uxn_opcodes_h_l2775_c2_289c_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2775_c2_289c_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2775_c2_289c_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2775_c2_289c_return_output : unsigned(7 downto 0);

-- sp1_MUX[uxn_opcodes_h_l2776_c3_abb5]
signal sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_cond : unsigned(0 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_iftrue : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_iffalse : unsigned(7 downto 0);
signal sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_return_output : unsigned(7 downto 0);

-- sp0_MUX[uxn_opcodes_h_l2776_c3_abb5]
signal sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_cond : unsigned(0 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_iftrue : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_iffalse : unsigned(7 downto 0);
signal sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2777_c4_5c4b]
signal BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2779_c4_66b5]
signal BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_return_output : signed(9 downto 0);

-- MUX[uxn_opcodes_h_l2783_c30_f258]
signal MUX_uxn_opcodes_h_l2783_c30_f258_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2783_c30_f258_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2783_c30_f258_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2783_c30_f258_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2783_c19_fc16]
signal BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_left : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_right : unsigned(11 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_return_output : unsigned(11 downto 0);

-- MUX[uxn_opcodes_h_l2784_c20_b9b7]
signal MUX_uxn_opcodes_h_l2784_c20_b9b7_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2784_c20_b9b7_iftrue : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2784_c20_b9b7_iffalse : unsigned(8 downto 0);
signal MUX_uxn_opcodes_h_l2784_c20_b9b7_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2784_c2_ff6c]
signal BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_left : unsigned(11 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_right : unsigned(8 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_return_output : unsigned(12 downto 0);

-- stack_ram_update[uxn_opcodes_h_l2786_c21_c47b]
signal stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_stack_address : unsigned(11 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_value : unsigned(7 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_write_enable : unsigned(0 downto 0);
signal stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return eval_opcode_result_t is
 
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
      base.vram_address := ref_toks_8;
      base.u8_value := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152
BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_left,
BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_right,
BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a
BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_left,
BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_right,
BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835
BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_left,
BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_right,
BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_return_output);

-- CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2
CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2 : entity work.CONST_SL_4_uint12_t_0CLK_de264c78 port map (
CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2_x,
CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2_return_output);

-- MUX_uxn_opcodes_h_l2696_c10_16b5
MUX_uxn_opcodes_h_l2696_c10_16b5 : entity work.MUX_uint1_t_uint12_t_uint12_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2696_c10_16b5_cond,
MUX_uxn_opcodes_h_l2696_c10_16b5_iftrue,
MUX_uxn_opcodes_h_l2696_c10_16b5_iffalse,
MUX_uxn_opcodes_h_l2696_c10_16b5_return_output);

-- printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875
printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875 : entity work.printf_uxn_opcodes_h_l2698_c2_d875_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg0,
printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg1,
printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg2);

-- BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee
BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_left,
BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_right,
BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output);

-- is_wait_MUX_uxn_opcodes_h_l2700_c2_d362
is_wait_MUX_uxn_opcodes_h_l2700_c2_d362 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_cond,
is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_iftrue,
is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_iffalse,
is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2700_c2_d362
opc_result_MUX_uxn_opcodes_h_l2700_c2_d362 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_cond,
opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_iftrue,
opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_iffalse,
opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output);

-- printf_uxn_opcodes_h_l2700_c23_ba69_uxn_opcodes_h_l2700_c23_ba69
printf_uxn_opcodes_h_l2700_c23_ba69_uxn_opcodes_h_l2700_c23_ba69 : entity work.printf_uxn_opcodes_h_l2700_c23_ba69_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2700_c23_ba69_uxn_opcodes_h_l2700_c23_ba69_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e : entity work.BIN_OP_EQ_uint12_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_left,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_right,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17
opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_cond,
opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_iftrue,
opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_iffalse,
opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output);

-- jci_uxn_opcodes_h_l2701_c41_b678
jci_uxn_opcodes_h_l2701_c41_b678 : entity work.jci_0CLK_8b7cd1f2 port map (
clk,
jci_uxn_opcodes_h_l2701_c41_b678_CLOCK_ENABLE,
jci_uxn_opcodes_h_l2701_c41_b678_phase,
jci_uxn_opcodes_h_l2701_c41_b678_pc,
jci_uxn_opcodes_h_l2701_c41_b678_previous_stack_read,
jci_uxn_opcodes_h_l2701_c41_b678_previous_ram_read,
jci_uxn_opcodes_h_l2701_c41_b678_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_left,
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_right,
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2702_c7_d538
opc_result_MUX_uxn_opcodes_h_l2702_c7_d538 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_cond,
opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_iftrue,
opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_iffalse,
opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_return_output);

-- jmi_uxn_opcodes_h_l2702_c41_b9cc
jmi_uxn_opcodes_h_l2702_c41_b9cc : entity work.jmi_0CLK_8f4d4fc5 port map (
clk,
jmi_uxn_opcodes_h_l2702_c41_b9cc_CLOCK_ENABLE,
jmi_uxn_opcodes_h_l2702_c41_b9cc_phase,
jmi_uxn_opcodes_h_l2702_c41_b9cc_pc,
jmi_uxn_opcodes_h_l2702_c41_b9cc_previous_ram_read,
jmi_uxn_opcodes_h_l2702_c41_b9cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684 : entity work.BIN_OP_EQ_uint12_t_uint11_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_left,
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_right,
BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2703_c7_3648
opc_result_MUX_uxn_opcodes_h_l2703_c7_3648 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_cond,
opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_iftrue,
opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_iffalse,
opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_return_output);

-- jsi_uxn_opcodes_h_l2703_c41_fd08
jsi_uxn_opcodes_h_l2703_c41_fd08 : entity work.jsi_0CLK_af8c339b port map (
clk,
jsi_uxn_opcodes_h_l2703_c41_fd08_CLOCK_ENABLE,
jsi_uxn_opcodes_h_l2703_c41_fd08_phase,
jsi_uxn_opcodes_h_l2703_c41_fd08_pc,
jsi_uxn_opcodes_h_l2703_c41_fd08_previous_ram_read,
jsi_uxn_opcodes_h_l2703_c41_fd08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9
BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_left,
BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_right,
BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2704_c7_8860
opc_result_MUX_uxn_opcodes_h_l2704_c7_8860 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_cond,
opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_iftrue,
opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_iffalse,
opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_return_output);

-- lit_uxn_opcodes_h_l2704_c41_e13e
lit_uxn_opcodes_h_l2704_c41_e13e : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l2704_c41_e13e_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2704_c41_e13e_phase,
lit_uxn_opcodes_h_l2704_c41_e13e_pc,
lit_uxn_opcodes_h_l2704_c41_e13e_previous_ram_read,
lit_uxn_opcodes_h_l2704_c41_e13e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_left,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_right,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2705_c7_6821
opc_result_MUX_uxn_opcodes_h_l2705_c7_6821 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_cond,
opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_iftrue,
opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_iffalse,
opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_return_output);

-- lit2_uxn_opcodes_h_l2705_c41_4388
lit2_uxn_opcodes_h_l2705_c41_4388 : entity work.lit2_0CLK_edc09f97 port map (
clk,
lit2_uxn_opcodes_h_l2705_c41_4388_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2705_c41_4388_phase,
lit2_uxn_opcodes_h_l2705_c41_4388_pc,
lit2_uxn_opcodes_h_l2705_c41_4388_previous_ram_read,
lit2_uxn_opcodes_h_l2705_c41_4388_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_left,
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_right,
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2706_c7_c492
opc_result_MUX_uxn_opcodes_h_l2706_c7_c492 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_cond,
opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_iftrue,
opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_iffalse,
opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_return_output);

-- lit_uxn_opcodes_h_l2706_c41_5f6f
lit_uxn_opcodes_h_l2706_c41_5f6f : entity work.lit_0CLK_ac9ce6a4 port map (
clk,
lit_uxn_opcodes_h_l2706_c41_5f6f_CLOCK_ENABLE,
lit_uxn_opcodes_h_l2706_c41_5f6f_phase,
lit_uxn_opcodes_h_l2706_c41_5f6f_pc,
lit_uxn_opcodes_h_l2706_c41_5f6f_previous_ram_read,
lit_uxn_opcodes_h_l2706_c41_5f6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389
BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_left,
BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_right,
BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2707_c7_882c
opc_result_MUX_uxn_opcodes_h_l2707_c7_882c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_cond,
opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_return_output);

-- lit2_uxn_opcodes_h_l2707_c41_270a
lit2_uxn_opcodes_h_l2707_c41_270a : entity work.lit2_0CLK_edc09f97 port map (
clk,
lit2_uxn_opcodes_h_l2707_c41_270a_CLOCK_ENABLE,
lit2_uxn_opcodes_h_l2707_c41_270a_phase,
lit2_uxn_opcodes_h_l2707_c41_270a_pc,
lit2_uxn_opcodes_h_l2707_c41_270a_previous_ram_read,
lit2_uxn_opcodes_h_l2707_c41_270a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e
BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e : entity work.BIN_OP_EQ_uint12_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_left,
BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_right,
BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98
opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_cond,
opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_iftrue,
opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_iffalse,
opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output);

-- inc_uxn_opcodes_h_l2708_c41_572f
inc_uxn_opcodes_h_l2708_c41_572f : entity work.inc_0CLK_b7103d16 port map (
clk,
inc_uxn_opcodes_h_l2708_c41_572f_CLOCK_ENABLE,
inc_uxn_opcodes_h_l2708_c41_572f_phase,
inc_uxn_opcodes_h_l2708_c41_572f_ins,
inc_uxn_opcodes_h_l2708_c41_572f_previous_stack_read,
inc_uxn_opcodes_h_l2708_c41_572f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05
opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_cond,
opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_iftrue,
opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_iffalse,
opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output);

-- inc2_uxn_opcodes_h_l2709_c41_a57b
inc2_uxn_opcodes_h_l2709_c41_a57b : entity work.inc2_0CLK_a6885b22 port map (
clk,
inc2_uxn_opcodes_h_l2709_c41_a57b_CLOCK_ENABLE,
inc2_uxn_opcodes_h_l2709_c41_a57b_phase,
inc2_uxn_opcodes_h_l2709_c41_a57b_ins,
inc2_uxn_opcodes_h_l2709_c41_a57b_previous_stack_read,
inc2_uxn_opcodes_h_l2709_c41_a57b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_left,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_right,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2710_c7_a395
opc_result_MUX_uxn_opcodes_h_l2710_c7_a395 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_cond,
opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_iftrue,
opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_iffalse,
opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_return_output);

-- pop_uxn_opcodes_h_l2710_c41_b071
pop_uxn_opcodes_h_l2710_c41_b071 : entity work.pop_0CLK_bd0fc640 port map (
clk,
pop_uxn_opcodes_h_l2710_c41_b071_CLOCK_ENABLE,
pop_uxn_opcodes_h_l2710_c41_b071_phase,
pop_uxn_opcodes_h_l2710_c41_b071_ins,
pop_uxn_opcodes_h_l2710_c41_b071_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_left,
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_right,
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2711_c7_b119
opc_result_MUX_uxn_opcodes_h_l2711_c7_b119 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_cond,
opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_iftrue,
opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_iffalse,
opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_return_output);

-- pop2_uxn_opcodes_h_l2711_c41_c35c
pop2_uxn_opcodes_h_l2711_c41_c35c : entity work.pop2_0CLK_bd0fc640 port map (
clk,
pop2_uxn_opcodes_h_l2711_c41_c35c_CLOCK_ENABLE,
pop2_uxn_opcodes_h_l2711_c41_c35c_phase,
pop2_uxn_opcodes_h_l2711_c41_c35c_ins,
pop2_uxn_opcodes_h_l2711_c41_c35c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1 : entity work.BIN_OP_EQ_uint12_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_left,
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_right,
BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2
opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_cond,
opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_iftrue,
opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_iffalse,
opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output);

-- nip_uxn_opcodes_h_l2712_c41_7bf8
nip_uxn_opcodes_h_l2712_c41_7bf8 : entity work.nip_0CLK_a9f1e08f port map (
clk,
nip_uxn_opcodes_h_l2712_c41_7bf8_CLOCK_ENABLE,
nip_uxn_opcodes_h_l2712_c41_7bf8_phase,
nip_uxn_opcodes_h_l2712_c41_7bf8_ins,
nip_uxn_opcodes_h_l2712_c41_7bf8_previous_stack_read,
nip_uxn_opcodes_h_l2712_c41_7bf8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_left,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_right,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef
opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_cond,
opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_iftrue,
opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_iffalse,
opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output);

-- nip2_uxn_opcodes_h_l2713_c41_7e7b
nip2_uxn_opcodes_h_l2713_c41_7e7b : entity work.nip2_0CLK_9a874500 port map (
clk,
nip2_uxn_opcodes_h_l2713_c41_7e7b_CLOCK_ENABLE,
nip2_uxn_opcodes_h_l2713_c41_7e7b_phase,
nip2_uxn_opcodes_h_l2713_c41_7e7b_ins,
nip2_uxn_opcodes_h_l2713_c41_7e7b_previous_stack_read,
nip2_uxn_opcodes_h_l2713_c41_7e7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_left,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_right,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2714_c7_081e
opc_result_MUX_uxn_opcodes_h_l2714_c7_081e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_cond,
opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_return_output);

-- swp_uxn_opcodes_h_l2714_c41_cf94
swp_uxn_opcodes_h_l2714_c41_cf94 : entity work.swp_0CLK_faaf4b1a port map (
clk,
swp_uxn_opcodes_h_l2714_c41_cf94_CLOCK_ENABLE,
swp_uxn_opcodes_h_l2714_c41_cf94_phase,
swp_uxn_opcodes_h_l2714_c41_cf94_ins,
swp_uxn_opcodes_h_l2714_c41_cf94_previous_stack_read,
swp_uxn_opcodes_h_l2714_c41_cf94_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_left,
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_right,
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75
opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_cond,
opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_iftrue,
opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_iffalse,
opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output);

-- swp2_uxn_opcodes_h_l2715_c41_81b0
swp2_uxn_opcodes_h_l2715_c41_81b0 : entity work.swp2_0CLK_e768ce5a port map (
clk,
swp2_uxn_opcodes_h_l2715_c41_81b0_CLOCK_ENABLE,
swp2_uxn_opcodes_h_l2715_c41_81b0_phase,
swp2_uxn_opcodes_h_l2715_c41_81b0_ins,
swp2_uxn_opcodes_h_l2715_c41_81b0_previous_stack_read,
swp2_uxn_opcodes_h_l2715_c41_81b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_left,
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_right,
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb
opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_cond,
opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output);

-- rot_uxn_opcodes_h_l2716_c41_1f20
rot_uxn_opcodes_h_l2716_c41_1f20 : entity work.rot_0CLK_90cbec6a port map (
clk,
rot_uxn_opcodes_h_l2716_c41_1f20_CLOCK_ENABLE,
rot_uxn_opcodes_h_l2716_c41_1f20_phase,
rot_uxn_opcodes_h_l2716_c41_1f20_ins,
rot_uxn_opcodes_h_l2716_c41_1f20_previous_stack_read,
rot_uxn_opcodes_h_l2716_c41_1f20_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca
opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_cond,
opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_iftrue,
opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_iffalse,
opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output);

-- rot2_uxn_opcodes_h_l2717_c41_9c3c
rot2_uxn_opcodes_h_l2717_c41_9c3c : entity work.rot2_0CLK_6006c90f port map (
clk,
rot2_uxn_opcodes_h_l2717_c41_9c3c_CLOCK_ENABLE,
rot2_uxn_opcodes_h_l2717_c41_9c3c_phase,
rot2_uxn_opcodes_h_l2717_c41_9c3c_ins,
rot2_uxn_opcodes_h_l2717_c41_9c3c_previous_stack_read,
rot2_uxn_opcodes_h_l2717_c41_9c3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_left,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_right,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2718_c7_750b
opc_result_MUX_uxn_opcodes_h_l2718_c7_750b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_cond,
opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_return_output);

-- dup_uxn_opcodes_h_l2718_c41_c17e
dup_uxn_opcodes_h_l2718_c41_c17e : entity work.dup_0CLK_6be78140 port map (
clk,
dup_uxn_opcodes_h_l2718_c41_c17e_CLOCK_ENABLE,
dup_uxn_opcodes_h_l2718_c41_c17e_phase,
dup_uxn_opcodes_h_l2718_c41_c17e_ins,
dup_uxn_opcodes_h_l2718_c41_c17e_previous_stack_read,
dup_uxn_opcodes_h_l2718_c41_c17e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_left,
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_right,
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5
opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_cond,
opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output);

-- dup2_uxn_opcodes_h_l2719_c41_0679
dup2_uxn_opcodes_h_l2719_c41_0679 : entity work.dup2_0CLK_49f2c137 port map (
clk,
dup2_uxn_opcodes_h_l2719_c41_0679_CLOCK_ENABLE,
dup2_uxn_opcodes_h_l2719_c41_0679_phase,
dup2_uxn_opcodes_h_l2719_c41_0679_ins,
dup2_uxn_opcodes_h_l2719_c41_0679_previous_stack_read,
dup2_uxn_opcodes_h_l2719_c41_0679_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7 : entity work.BIN_OP_EQ_uint12_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_left,
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_right,
BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11
opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_cond,
opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_iftrue,
opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_iffalse,
opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output);

-- ovr_uxn_opcodes_h_l2720_c41_04a0
ovr_uxn_opcodes_h_l2720_c41_04a0 : entity work.ovr_0CLK_9159c4aa port map (
clk,
ovr_uxn_opcodes_h_l2720_c41_04a0_CLOCK_ENABLE,
ovr_uxn_opcodes_h_l2720_c41_04a0_phase,
ovr_uxn_opcodes_h_l2720_c41_04a0_ins,
ovr_uxn_opcodes_h_l2720_c41_04a0_previous_stack_read,
ovr_uxn_opcodes_h_l2720_c41_04a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_left,
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_right,
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4
opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_cond,
opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output);

-- ovr2_uxn_opcodes_h_l2721_c41_3590
ovr2_uxn_opcodes_h_l2721_c41_3590 : entity work.ovr2_0CLK_c46bbc82 port map (
clk,
ovr2_uxn_opcodes_h_l2721_c41_3590_CLOCK_ENABLE,
ovr2_uxn_opcodes_h_l2721_c41_3590_phase,
ovr2_uxn_opcodes_h_l2721_c41_3590_ins,
ovr2_uxn_opcodes_h_l2721_c41_3590_previous_stack_read,
ovr2_uxn_opcodes_h_l2721_c41_3590_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_left,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_right,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2722_c7_51db
opc_result_MUX_uxn_opcodes_h_l2722_c7_51db : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_cond,
opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_iftrue,
opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_iffalse,
opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_return_output);

-- equ_uxn_opcodes_h_l2722_c41_c13c
equ_uxn_opcodes_h_l2722_c41_c13c : entity work.equ_0CLK_85d5529e port map (
clk,
equ_uxn_opcodes_h_l2722_c41_c13c_CLOCK_ENABLE,
equ_uxn_opcodes_h_l2722_c41_c13c_phase,
equ_uxn_opcodes_h_l2722_c41_c13c_ins,
equ_uxn_opcodes_h_l2722_c41_c13c_previous_stack_read,
equ_uxn_opcodes_h_l2722_c41_c13c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_left,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_right,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2723_c7_462e
opc_result_MUX_uxn_opcodes_h_l2723_c7_462e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_cond,
opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_return_output);

-- equ2_uxn_opcodes_h_l2723_c41_7338
equ2_uxn_opcodes_h_l2723_c41_7338 : entity work.equ2_0CLK_302e9520 port map (
clk,
equ2_uxn_opcodes_h_l2723_c41_7338_CLOCK_ENABLE,
equ2_uxn_opcodes_h_l2723_c41_7338_phase,
equ2_uxn_opcodes_h_l2723_c41_7338_ins,
equ2_uxn_opcodes_h_l2723_c41_7338_previous_stack_read,
equ2_uxn_opcodes_h_l2723_c41_7338_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41
opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_cond,
opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_iftrue,
opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_iffalse,
opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output);

-- neq_uxn_opcodes_h_l2724_c41_2133
neq_uxn_opcodes_h_l2724_c41_2133 : entity work.neq_0CLK_85d5529e port map (
clk,
neq_uxn_opcodes_h_l2724_c41_2133_CLOCK_ENABLE,
neq_uxn_opcodes_h_l2724_c41_2133_phase,
neq_uxn_opcodes_h_l2724_c41_2133_ins,
neq_uxn_opcodes_h_l2724_c41_2133_previous_stack_read,
neq_uxn_opcodes_h_l2724_c41_2133_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_left,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_right,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f
opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_cond,
opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output);

-- neq2_uxn_opcodes_h_l2725_c41_9230
neq2_uxn_opcodes_h_l2725_c41_9230 : entity work.neq2_0CLK_302e9520 port map (
clk,
neq2_uxn_opcodes_h_l2725_c41_9230_CLOCK_ENABLE,
neq2_uxn_opcodes_h_l2725_c41_9230_phase,
neq2_uxn_opcodes_h_l2725_c41_9230_ins,
neq2_uxn_opcodes_h_l2725_c41_9230_previous_stack_read,
neq2_uxn_opcodes_h_l2725_c41_9230_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_left,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_right,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2726_c7_f734
opc_result_MUX_uxn_opcodes_h_l2726_c7_f734 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_cond,
opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_iftrue,
opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_iffalse,
opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_return_output);

-- gth_uxn_opcodes_h_l2726_c41_a7a0
gth_uxn_opcodes_h_l2726_c41_a7a0 : entity work.gth_0CLK_85d5529e port map (
clk,
gth_uxn_opcodes_h_l2726_c41_a7a0_CLOCK_ENABLE,
gth_uxn_opcodes_h_l2726_c41_a7a0_phase,
gth_uxn_opcodes_h_l2726_c41_a7a0_ins,
gth_uxn_opcodes_h_l2726_c41_a7a0_previous_stack_read,
gth_uxn_opcodes_h_l2726_c41_a7a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_left,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_right,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68
opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_cond,
opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_iftrue,
opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_iffalse,
opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output);

-- gth2_uxn_opcodes_h_l2727_c41_48b0
gth2_uxn_opcodes_h_l2727_c41_48b0 : entity work.gth2_0CLK_302e9520 port map (
clk,
gth2_uxn_opcodes_h_l2727_c41_48b0_CLOCK_ENABLE,
gth2_uxn_opcodes_h_l2727_c41_48b0_phase,
gth2_uxn_opcodes_h_l2727_c41_48b0_ins,
gth2_uxn_opcodes_h_l2727_c41_48b0_previous_stack_read,
gth2_uxn_opcodes_h_l2727_c41_48b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_left,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_right,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b
opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_cond,
opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output);

-- lth_uxn_opcodes_h_l2728_c41_577e
lth_uxn_opcodes_h_l2728_c41_577e : entity work.lth_0CLK_85d5529e port map (
clk,
lth_uxn_opcodes_h_l2728_c41_577e_CLOCK_ENABLE,
lth_uxn_opcodes_h_l2728_c41_577e_phase,
lth_uxn_opcodes_h_l2728_c41_577e_ins,
lth_uxn_opcodes_h_l2728_c41_577e_previous_stack_read,
lth_uxn_opcodes_h_l2728_c41_577e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_left,
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_right,
BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2729_c7_e883
opc_result_MUX_uxn_opcodes_h_l2729_c7_e883 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_cond,
opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_iftrue,
opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_iffalse,
opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_return_output);

-- lth2_uxn_opcodes_h_l2729_c41_f078
lth2_uxn_opcodes_h_l2729_c41_f078 : entity work.lth2_0CLK_302e9520 port map (
clk,
lth2_uxn_opcodes_h_l2729_c41_f078_CLOCK_ENABLE,
lth2_uxn_opcodes_h_l2729_c41_f078_phase,
lth2_uxn_opcodes_h_l2729_c41_f078_ins,
lth2_uxn_opcodes_h_l2729_c41_f078_previous_stack_read,
lth2_uxn_opcodes_h_l2729_c41_f078_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76
opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_cond,
opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_iftrue,
opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_iffalse,
opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output);

-- jmp_uxn_opcodes_h_l2730_c41_a2ac
jmp_uxn_opcodes_h_l2730_c41_a2ac : entity work.jmp_0CLK_b7103d16 port map (
clk,
jmp_uxn_opcodes_h_l2730_c41_a2ac_CLOCK_ENABLE,
jmp_uxn_opcodes_h_l2730_c41_a2ac_phase,
jmp_uxn_opcodes_h_l2730_c41_a2ac_ins,
jmp_uxn_opcodes_h_l2730_c41_a2ac_pc,
jmp_uxn_opcodes_h_l2730_c41_a2ac_previous_stack_read,
jmp_uxn_opcodes_h_l2730_c41_a2ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_left,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_right,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3
opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_cond,
opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output);

-- jmp2_uxn_opcodes_h_l2731_c41_5859
jmp2_uxn_opcodes_h_l2731_c41_5859 : entity work.jmp2_0CLK_0b1ee796 port map (
clk,
jmp2_uxn_opcodes_h_l2731_c41_5859_CLOCK_ENABLE,
jmp2_uxn_opcodes_h_l2731_c41_5859_phase,
jmp2_uxn_opcodes_h_l2731_c41_5859_ins,
jmp2_uxn_opcodes_h_l2731_c41_5859_previous_stack_read,
jmp2_uxn_opcodes_h_l2731_c41_5859_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_left,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_right,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2732_c7_9416
opc_result_MUX_uxn_opcodes_h_l2732_c7_9416 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_cond,
opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_iftrue,
opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_iffalse,
opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_return_output);

-- jcn_uxn_opcodes_h_l2732_c41_d896
jcn_uxn_opcodes_h_l2732_c41_d896 : entity work.jcn_0CLK_85d5529e port map (
clk,
jcn_uxn_opcodes_h_l2732_c41_d896_CLOCK_ENABLE,
jcn_uxn_opcodes_h_l2732_c41_d896_phase,
jcn_uxn_opcodes_h_l2732_c41_d896_ins,
jcn_uxn_opcodes_h_l2732_c41_d896_pc,
jcn_uxn_opcodes_h_l2732_c41_d896_previous_stack_read,
jcn_uxn_opcodes_h_l2732_c41_d896_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_left,
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_right,
BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec
opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_cond,
opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_iftrue,
opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_iffalse,
opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output);

-- jcn2_uxn_opcodes_h_l2733_c41_a3e0
jcn2_uxn_opcodes_h_l2733_c41_a3e0 : entity work.jcn2_0CLK_0226dad5 port map (
clk,
jcn2_uxn_opcodes_h_l2733_c41_a3e0_CLOCK_ENABLE,
jcn2_uxn_opcodes_h_l2733_c41_a3e0_phase,
jcn2_uxn_opcodes_h_l2733_c41_a3e0_ins,
jcn2_uxn_opcodes_h_l2733_c41_a3e0_previous_stack_read,
jcn2_uxn_opcodes_h_l2733_c41_a3e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4
opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_cond,
opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output);

-- jsr_uxn_opcodes_h_l2734_c41_65a0
jsr_uxn_opcodes_h_l2734_c41_65a0 : entity work.jsr_0CLK_6da26caa port map (
clk,
jsr_uxn_opcodes_h_l2734_c41_65a0_CLOCK_ENABLE,
jsr_uxn_opcodes_h_l2734_c41_65a0_phase,
jsr_uxn_opcodes_h_l2734_c41_65a0_ins,
jsr_uxn_opcodes_h_l2734_c41_65a0_pc,
jsr_uxn_opcodes_h_l2734_c41_65a0_previous_stack_read,
jsr_uxn_opcodes_h_l2734_c41_65a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_left,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_right,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28
opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_cond,
opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_iftrue,
opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_iffalse,
opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output);

-- jsr2_uxn_opcodes_h_l2735_c41_2859
jsr2_uxn_opcodes_h_l2735_c41_2859 : entity work.jsr2_0CLK_9728fdff port map (
clk,
jsr2_uxn_opcodes_h_l2735_c41_2859_CLOCK_ENABLE,
jsr2_uxn_opcodes_h_l2735_c41_2859_phase,
jsr2_uxn_opcodes_h_l2735_c41_2859_ins,
jsr2_uxn_opcodes_h_l2735_c41_2859_pc,
jsr2_uxn_opcodes_h_l2735_c41_2859_previous_stack_read,
jsr2_uxn_opcodes_h_l2735_c41_2859_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753 : entity work.BIN_OP_EQ_uint12_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_left,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_right,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b
opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_cond,
opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output);

-- sth_uxn_opcodes_h_l2736_c41_fde0
sth_uxn_opcodes_h_l2736_c41_fde0 : entity work.sth_0CLK_85d5529e port map (
clk,
sth_uxn_opcodes_h_l2736_c41_fde0_CLOCK_ENABLE,
sth_uxn_opcodes_h_l2736_c41_fde0_phase,
sth_uxn_opcodes_h_l2736_c41_fde0_ins,
sth_uxn_opcodes_h_l2736_c41_fde0_previous_stack_read,
sth_uxn_opcodes_h_l2736_c41_fde0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_left,
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_right,
BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4
opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_cond,
opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output);

-- sth2_uxn_opcodes_h_l2737_c41_432c
sth2_uxn_opcodes_h_l2737_c41_432c : entity work.sth2_0CLK_302e9520 port map (
clk,
sth2_uxn_opcodes_h_l2737_c41_432c_CLOCK_ENABLE,
sth2_uxn_opcodes_h_l2737_c41_432c_phase,
sth2_uxn_opcodes_h_l2737_c41_432c_ins,
sth2_uxn_opcodes_h_l2737_c41_432c_previous_stack_read,
sth2_uxn_opcodes_h_l2737_c41_432c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5
opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_cond,
opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_iftrue,
opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_iffalse,
opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output);

-- ldz_uxn_opcodes_h_l2738_c41_2192
ldz_uxn_opcodes_h_l2738_c41_2192 : entity work.ldz_0CLK_f74745d5 port map (
clk,
ldz_uxn_opcodes_h_l2738_c41_2192_CLOCK_ENABLE,
ldz_uxn_opcodes_h_l2738_c41_2192_phase,
ldz_uxn_opcodes_h_l2738_c41_2192_ins,
ldz_uxn_opcodes_h_l2738_c41_2192_previous_stack_read,
ldz_uxn_opcodes_h_l2738_c41_2192_previous_ram_read,
ldz_uxn_opcodes_h_l2738_c41_2192_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_left,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_right,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4
opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_cond,
opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_iftrue,
opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_iffalse,
opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output);

-- ldz2_uxn_opcodes_h_l2739_c41_de57
ldz2_uxn_opcodes_h_l2739_c41_de57 : entity work.ldz2_0CLK_d662d237 port map (
clk,
ldz2_uxn_opcodes_h_l2739_c41_de57_CLOCK_ENABLE,
ldz2_uxn_opcodes_h_l2739_c41_de57_phase,
ldz2_uxn_opcodes_h_l2739_c41_de57_ins,
ldz2_uxn_opcodes_h_l2739_c41_de57_previous_stack_read,
ldz2_uxn_opcodes_h_l2739_c41_de57_previous_ram_read,
ldz2_uxn_opcodes_h_l2739_c41_de57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_left,
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_right,
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c
opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_cond,
opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_iftrue,
opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_iffalse,
opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output);

-- stz_uxn_opcodes_h_l2740_c41_7810
stz_uxn_opcodes_h_l2740_c41_7810 : entity work.stz_0CLK_ffdfe23b port map (
clk,
stz_uxn_opcodes_h_l2740_c41_7810_CLOCK_ENABLE,
stz_uxn_opcodes_h_l2740_c41_7810_phase,
stz_uxn_opcodes_h_l2740_c41_7810_ins,
stz_uxn_opcodes_h_l2740_c41_7810_previous_stack_read,
stz_uxn_opcodes_h_l2740_c41_7810_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_left,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_right,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb
opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_cond,
opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_iftrue,
opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_iffalse,
opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output);

-- stz2_uxn_opcodes_h_l2741_c41_cbc2
stz2_uxn_opcodes_h_l2741_c41_cbc2 : entity work.stz2_0CLK_4f993427 port map (
clk,
stz2_uxn_opcodes_h_l2741_c41_cbc2_CLOCK_ENABLE,
stz2_uxn_opcodes_h_l2741_c41_cbc2_phase,
stz2_uxn_opcodes_h_l2741_c41_cbc2_ins,
stz2_uxn_opcodes_h_l2741_c41_cbc2_previous_stack_read,
stz2_uxn_opcodes_h_l2741_c41_cbc2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc
opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_cond,
opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output);

-- ldr_uxn_opcodes_h_l2742_c41_f07b
ldr_uxn_opcodes_h_l2742_c41_f07b : entity work.ldr_0CLK_c61094da port map (
clk,
ldr_uxn_opcodes_h_l2742_c41_f07b_CLOCK_ENABLE,
ldr_uxn_opcodes_h_l2742_c41_f07b_phase,
ldr_uxn_opcodes_h_l2742_c41_f07b_ins,
ldr_uxn_opcodes_h_l2742_c41_f07b_pc,
ldr_uxn_opcodes_h_l2742_c41_f07b_previous_stack_read,
ldr_uxn_opcodes_h_l2742_c41_f07b_previous_ram_read,
ldr_uxn_opcodes_h_l2742_c41_f07b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_left,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_right,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8
opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_cond,
opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_iftrue,
opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_iffalse,
opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output);

-- ldr2_uxn_opcodes_h_l2743_c41_0c58
ldr2_uxn_opcodes_h_l2743_c41_0c58 : entity work.ldr2_0CLK_6193b0ef port map (
clk,
ldr2_uxn_opcodes_h_l2743_c41_0c58_CLOCK_ENABLE,
ldr2_uxn_opcodes_h_l2743_c41_0c58_phase,
ldr2_uxn_opcodes_h_l2743_c41_0c58_ins,
ldr2_uxn_opcodes_h_l2743_c41_0c58_pc,
ldr2_uxn_opcodes_h_l2743_c41_0c58_previous_stack_read,
ldr2_uxn_opcodes_h_l2743_c41_0c58_previous_ram_read,
ldr2_uxn_opcodes_h_l2743_c41_0c58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_left,
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_right,
BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17
opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_cond,
opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_iftrue,
opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_iffalse,
opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output);

-- str1_uxn_opcodes_h_l2744_c41_3dfb
str1_uxn_opcodes_h_l2744_c41_3dfb : entity work.str1_0CLK_faaf4b1a port map (
clk,
str1_uxn_opcodes_h_l2744_c41_3dfb_CLOCK_ENABLE,
str1_uxn_opcodes_h_l2744_c41_3dfb_phase,
str1_uxn_opcodes_h_l2744_c41_3dfb_ins,
str1_uxn_opcodes_h_l2744_c41_3dfb_pc,
str1_uxn_opcodes_h_l2744_c41_3dfb_previous_stack_read,
str1_uxn_opcodes_h_l2744_c41_3dfb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_left,
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_right,
BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0
opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_cond,
opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output);

-- str2_uxn_opcodes_h_l2745_c41_c88a
str2_uxn_opcodes_h_l2745_c41_c88a : entity work.str2_0CLK_4f993427 port map (
clk,
str2_uxn_opcodes_h_l2745_c41_c88a_CLOCK_ENABLE,
str2_uxn_opcodes_h_l2745_c41_c88a_phase,
str2_uxn_opcodes_h_l2745_c41_c88a_ins,
str2_uxn_opcodes_h_l2745_c41_c88a_pc,
str2_uxn_opcodes_h_l2745_c41_c88a_previous_stack_read,
str2_uxn_opcodes_h_l2745_c41_c88a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_left,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_right,
BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2746_c7_7272
opc_result_MUX_uxn_opcodes_h_l2746_c7_7272 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_cond,
opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_iftrue,
opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_iffalse,
opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_return_output);

-- lda_uxn_opcodes_h_l2746_c41_3e4d
lda_uxn_opcodes_h_l2746_c41_3e4d : entity work.lda_0CLK_dc46ab2b port map (
clk,
lda_uxn_opcodes_h_l2746_c41_3e4d_CLOCK_ENABLE,
lda_uxn_opcodes_h_l2746_c41_3e4d_phase,
lda_uxn_opcodes_h_l2746_c41_3e4d_ins,
lda_uxn_opcodes_h_l2746_c41_3e4d_previous_stack_read,
lda_uxn_opcodes_h_l2746_c41_3e4d_previous_ram_read,
lda_uxn_opcodes_h_l2746_c41_3e4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_left,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_right,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7
opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_cond,
opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output);

-- lda2_uxn_opcodes_h_l2747_c41_63f8
lda2_uxn_opcodes_h_l2747_c41_63f8 : entity work.lda2_0CLK_0d6e2712 port map (
clk,
lda2_uxn_opcodes_h_l2747_c41_63f8_CLOCK_ENABLE,
lda2_uxn_opcodes_h_l2747_c41_63f8_phase,
lda2_uxn_opcodes_h_l2747_c41_63f8_ins,
lda2_uxn_opcodes_h_l2747_c41_63f8_previous_stack_read,
lda2_uxn_opcodes_h_l2747_c41_63f8_previous_ram_read,
lda2_uxn_opcodes_h_l2747_c41_63f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_left,
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_right,
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc
opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_cond,
opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output);

-- sta_uxn_opcodes_h_l2748_c41_4167
sta_uxn_opcodes_h_l2748_c41_4167 : entity work.sta_0CLK_d2dce55b port map (
clk,
sta_uxn_opcodes_h_l2748_c41_4167_CLOCK_ENABLE,
sta_uxn_opcodes_h_l2748_c41_4167_phase,
sta_uxn_opcodes_h_l2748_c41_4167_ins,
sta_uxn_opcodes_h_l2748_c41_4167_previous_stack_read,
sta_uxn_opcodes_h_l2748_c41_4167_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_left,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_right,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2749_c7_c378
opc_result_MUX_uxn_opcodes_h_l2749_c7_c378 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_cond,
opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_iftrue,
opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_iffalse,
opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_return_output);

-- sta2_uxn_opcodes_h_l2749_c41_4fa0
sta2_uxn_opcodes_h_l2749_c41_4fa0 : entity work.sta2_0CLK_7d7b1f8b port map (
clk,
sta2_uxn_opcodes_h_l2749_c41_4fa0_CLOCK_ENABLE,
sta2_uxn_opcodes_h_l2749_c41_4fa0_phase,
sta2_uxn_opcodes_h_l2749_c41_4fa0_ins,
sta2_uxn_opcodes_h_l2749_c41_4fa0_previous_stack_read,
sta2_uxn_opcodes_h_l2749_c41_4fa0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_left,
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_right,
BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2750_c7_594a
opc_result_MUX_uxn_opcodes_h_l2750_c7_594a : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_cond,
opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_iftrue,
opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_iffalse,
opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_return_output);

-- dei_uxn_opcodes_h_l2750_c41_574b
dei_uxn_opcodes_h_l2750_c41_574b : entity work.dei_0CLK_1826c28e port map (
clk,
dei_uxn_opcodes_h_l2750_c41_574b_CLOCK_ENABLE,
dei_uxn_opcodes_h_l2750_c41_574b_phase,
dei_uxn_opcodes_h_l2750_c41_574b_ins,
dei_uxn_opcodes_h_l2750_c41_574b_previous_stack_read,
dei_uxn_opcodes_h_l2750_c41_574b_previous_device_ram_read,
dei_uxn_opcodes_h_l2750_c41_574b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_left,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_right,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2751_c7_3918
opc_result_MUX_uxn_opcodes_h_l2751_c7_3918 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_cond,
opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_iftrue,
opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_iffalse,
opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_return_output);

-- dei2_uxn_opcodes_h_l2751_c41_9acd
dei2_uxn_opcodes_h_l2751_c41_9acd : entity work.dei2_0CLK_82b906b0 port map (
clk,
dei2_uxn_opcodes_h_l2751_c41_9acd_CLOCK_ENABLE,
dei2_uxn_opcodes_h_l2751_c41_9acd_phase,
dei2_uxn_opcodes_h_l2751_c41_9acd_ins,
dei2_uxn_opcodes_h_l2751_c41_9acd_previous_stack_read,
dei2_uxn_opcodes_h_l2751_c41_9acd_previous_device_ram_read,
dei2_uxn_opcodes_h_l2751_c41_9acd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_left,
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_right,
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0
opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_cond,
opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_iftrue,
opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_iffalse,
opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output);

-- deo_uxn_opcodes_h_l2752_c41_e372
deo_uxn_opcodes_h_l2752_c41_e372 : entity work.deo_0CLK_0f1297eb port map (
clk,
deo_uxn_opcodes_h_l2752_c41_e372_CLOCK_ENABLE,
deo_uxn_opcodes_h_l2752_c41_e372_phase,
deo_uxn_opcodes_h_l2752_c41_e372_ins,
deo_uxn_opcodes_h_l2752_c41_e372_previous_stack_read,
deo_uxn_opcodes_h_l2752_c41_e372_previous_device_ram_read,
deo_uxn_opcodes_h_l2752_c41_e372_previous_ram_read,
deo_uxn_opcodes_h_l2752_c41_e372_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1
opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_cond,
opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_iftrue,
opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_iffalse,
opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output);

-- deo2_uxn_opcodes_h_l2753_c41_12a3
deo2_uxn_opcodes_h_l2753_c41_12a3 : entity work.deo2_0CLK_0f83c89f port map (
clk,
deo2_uxn_opcodes_h_l2753_c41_12a3_CLOCK_ENABLE,
deo2_uxn_opcodes_h_l2753_c41_12a3_phase,
deo2_uxn_opcodes_h_l2753_c41_12a3_ins,
deo2_uxn_opcodes_h_l2753_c41_12a3_previous_stack_read,
deo2_uxn_opcodes_h_l2753_c41_12a3_previous_device_ram_read,
deo2_uxn_opcodes_h_l2753_c41_12a3_previous_ram_read,
deo2_uxn_opcodes_h_l2753_c41_12a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_left,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_right,
BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd
opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_cond,
opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_iftrue,
opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_iffalse,
opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output);

-- add_uxn_opcodes_h_l2754_c41_3abf
add_uxn_opcodes_h_l2754_c41_3abf : entity work.add_0CLK_bacf6a1d port map (
clk,
add_uxn_opcodes_h_l2754_c41_3abf_CLOCK_ENABLE,
add_uxn_opcodes_h_l2754_c41_3abf_phase,
add_uxn_opcodes_h_l2754_c41_3abf_ins,
add_uxn_opcodes_h_l2754_c41_3abf_previous_stack_read,
add_uxn_opcodes_h_l2754_c41_3abf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_left,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_right,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2755_c7_b309
opc_result_MUX_uxn_opcodes_h_l2755_c7_b309 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_cond,
opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_iftrue,
opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_iffalse,
opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_return_output);

-- add2_uxn_opcodes_h_l2755_c41_9ced
add2_uxn_opcodes_h_l2755_c41_9ced : entity work.add2_0CLK_f74041be port map (
clk,
add2_uxn_opcodes_h_l2755_c41_9ced_CLOCK_ENABLE,
add2_uxn_opcodes_h_l2755_c41_9ced_phase,
add2_uxn_opcodes_h_l2755_c41_9ced_ins,
add2_uxn_opcodes_h_l2755_c41_9ced_previous_stack_read,
add2_uxn_opcodes_h_l2755_c41_9ced_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_left,
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_right,
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d
opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_cond,
opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_iftrue,
opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_iffalse,
opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output);

-- sub_uxn_opcodes_h_l2756_c41_feda
sub_uxn_opcodes_h_l2756_c41_feda : entity work.sub_0CLK_bacf6a1d port map (
clk,
sub_uxn_opcodes_h_l2756_c41_feda_CLOCK_ENABLE,
sub_uxn_opcodes_h_l2756_c41_feda_phase,
sub_uxn_opcodes_h_l2756_c41_feda_ins,
sub_uxn_opcodes_h_l2756_c41_feda_previous_stack_read,
sub_uxn_opcodes_h_l2756_c41_feda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_left,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_right,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3
opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_cond,
opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output);

-- sub2_uxn_opcodes_h_l2757_c41_6d67
sub2_uxn_opcodes_h_l2757_c41_6d67 : entity work.sub2_0CLK_f74041be port map (
clk,
sub2_uxn_opcodes_h_l2757_c41_6d67_CLOCK_ENABLE,
sub2_uxn_opcodes_h_l2757_c41_6d67_phase,
sub2_uxn_opcodes_h_l2757_c41_6d67_ins,
sub2_uxn_opcodes_h_l2757_c41_6d67_previous_stack_read,
sub2_uxn_opcodes_h_l2757_c41_6d67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_left,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_right,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e
opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_cond,
opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_iftrue,
opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_iffalse,
opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output);

-- mul_uxn_opcodes_h_l2758_c41_7257
mul_uxn_opcodes_h_l2758_c41_7257 : entity work.mul_0CLK_bacf6a1d port map (
clk,
mul_uxn_opcodes_h_l2758_c41_7257_CLOCK_ENABLE,
mul_uxn_opcodes_h_l2758_c41_7257_phase,
mul_uxn_opcodes_h_l2758_c41_7257_ins,
mul_uxn_opcodes_h_l2758_c41_7257_previous_stack_read,
mul_uxn_opcodes_h_l2758_c41_7257_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_left,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_right,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30
opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_cond,
opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_iftrue,
opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_iffalse,
opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output);

-- mul2_uxn_opcodes_h_l2759_c41_1949
mul2_uxn_opcodes_h_l2759_c41_1949 : entity work.mul2_0CLK_f74041be port map (
clk,
mul2_uxn_opcodes_h_l2759_c41_1949_CLOCK_ENABLE,
mul2_uxn_opcodes_h_l2759_c41_1949_phase,
mul2_uxn_opcodes_h_l2759_c41_1949_ins,
mul2_uxn_opcodes_h_l2759_c41_1949_previous_stack_read,
mul2_uxn_opcodes_h_l2759_c41_1949_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_left,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_right,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2760_c7_749b
opc_result_MUX_uxn_opcodes_h_l2760_c7_749b : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_cond,
opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_iftrue,
opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_iffalse,
opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_return_output);

-- div_uxn_opcodes_h_l2760_c41_6c4e
div_uxn_opcodes_h_l2760_c41_6c4e : entity work.div_0CLK_a35230ee port map (
clk,
div_uxn_opcodes_h_l2760_c41_6c4e_CLOCK_ENABLE,
div_uxn_opcodes_h_l2760_c41_6c4e_phase,
div_uxn_opcodes_h_l2760_c41_6c4e_ins,
div_uxn_opcodes_h_l2760_c41_6c4e_previous_stack_read,
div_uxn_opcodes_h_l2760_c41_6c4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_left,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_right,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7
opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_cond,
opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_iftrue,
opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_iffalse,
opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output);

-- div2_uxn_opcodes_h_l2761_c41_0c5c
div2_uxn_opcodes_h_l2761_c41_0c5c : entity work.div2_0CLK_6d03de33 port map (
clk,
div2_uxn_opcodes_h_l2761_c41_0c5c_CLOCK_ENABLE,
div2_uxn_opcodes_h_l2761_c41_0c5c_phase,
div2_uxn_opcodes_h_l2761_c41_0c5c_ins,
div2_uxn_opcodes_h_l2761_c41_0c5c_previous_stack_read,
div2_uxn_opcodes_h_l2761_c41_0c5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_left,
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_right,
BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec
opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_cond,
opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_iftrue,
opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_iffalse,
opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output);

-- and_uxn_opcodes_h_l2762_c41_ddd3
and_uxn_opcodes_h_l2762_c41_ddd3 : entity work.and_0CLK_bacf6a1d port map (
clk,
and_uxn_opcodes_h_l2762_c41_ddd3_CLOCK_ENABLE,
and_uxn_opcodes_h_l2762_c41_ddd3_phase,
and_uxn_opcodes_h_l2762_c41_ddd3_ins,
and_uxn_opcodes_h_l2762_c41_ddd3_previous_stack_read,
and_uxn_opcodes_h_l2762_c41_ddd3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_left,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_right,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2763_c7_653f
opc_result_MUX_uxn_opcodes_h_l2763_c7_653f : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_cond,
opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_iftrue,
opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_iffalse,
opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_return_output);

-- and2_uxn_opcodes_h_l2763_c41_ef9c
and2_uxn_opcodes_h_l2763_c41_ef9c : entity work.and2_0CLK_f74041be port map (
clk,
and2_uxn_opcodes_h_l2763_c41_ef9c_CLOCK_ENABLE,
and2_uxn_opcodes_h_l2763_c41_ef9c_phase,
and2_uxn_opcodes_h_l2763_c41_ef9c_ins,
and2_uxn_opcodes_h_l2763_c41_ef9c_previous_stack_read,
and2_uxn_opcodes_h_l2763_c41_ef9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_left,
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_right,
BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2764_c7_b901
opc_result_MUX_uxn_opcodes_h_l2764_c7_b901 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_cond,
opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_iftrue,
opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_iffalse,
opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_return_output);

-- ora_uxn_opcodes_h_l2764_c41_9127
ora_uxn_opcodes_h_l2764_c41_9127 : entity work.ora_0CLK_bacf6a1d port map (
clk,
ora_uxn_opcodes_h_l2764_c41_9127_CLOCK_ENABLE,
ora_uxn_opcodes_h_l2764_c41_9127_phase,
ora_uxn_opcodes_h_l2764_c41_9127_ins,
ora_uxn_opcodes_h_l2764_c41_9127_previous_stack_read,
ora_uxn_opcodes_h_l2764_c41_9127_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_left,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_right,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3
opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_cond,
opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_iftrue,
opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_iffalse,
opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output);

-- ora2_uxn_opcodes_h_l2765_c41_1769
ora2_uxn_opcodes_h_l2765_c41_1769 : entity work.ora2_0CLK_f74041be port map (
clk,
ora2_uxn_opcodes_h_l2765_c41_1769_CLOCK_ENABLE,
ora2_uxn_opcodes_h_l2765_c41_1769_phase,
ora2_uxn_opcodes_h_l2765_c41_1769_ins,
ora2_uxn_opcodes_h_l2765_c41_1769_previous_stack_read,
ora2_uxn_opcodes_h_l2765_c41_1769_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4 : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_left,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_right,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2766_c7_c424
opc_result_MUX_uxn_opcodes_h_l2766_c7_c424 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_cond,
opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_iftrue,
opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_iffalse,
opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_return_output);

-- eor_uxn_opcodes_h_l2766_c41_a32b
eor_uxn_opcodes_h_l2766_c41_a32b : entity work.eor_0CLK_bacf6a1d port map (
clk,
eor_uxn_opcodes_h_l2766_c41_a32b_CLOCK_ENABLE,
eor_uxn_opcodes_h_l2766_c41_a32b_phase,
eor_uxn_opcodes_h_l2766_c41_a32b_ins,
eor_uxn_opcodes_h_l2766_c41_a32b_previous_stack_read,
eor_uxn_opcodes_h_l2766_c41_a32b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_left,
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_right,
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc
opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_cond,
opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_iftrue,
opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_iffalse,
opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output);

-- eor2_uxn_opcodes_h_l2767_c41_d86f
eor2_uxn_opcodes_h_l2767_c41_d86f : entity work.eor2_0CLK_f74041be port map (
clk,
eor2_uxn_opcodes_h_l2767_c41_d86f_CLOCK_ENABLE,
eor2_uxn_opcodes_h_l2767_c41_d86f_phase,
eor2_uxn_opcodes_h_l2767_c41_d86f_ins,
eor2_uxn_opcodes_h_l2767_c41_d86f_previous_stack_read,
eor2_uxn_opcodes_h_l2767_c41_d86f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c : entity work.BIN_OP_EQ_uint12_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_left,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_right,
BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2768_c7_c600
opc_result_MUX_uxn_opcodes_h_l2768_c7_c600 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_cond,
opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_iftrue,
opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_iffalse,
opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_return_output);

-- sft_uxn_opcodes_h_l2768_c41_8e76
sft_uxn_opcodes_h_l2768_c41_8e76 : entity work.sft_0CLK_10aab3e1 port map (
clk,
sft_uxn_opcodes_h_l2768_c41_8e76_CLOCK_ENABLE,
sft_uxn_opcodes_h_l2768_c41_8e76_phase,
sft_uxn_opcodes_h_l2768_c41_8e76_ins,
sft_uxn_opcodes_h_l2768_c41_8e76_previous_stack_read,
sft_uxn_opcodes_h_l2768_c41_8e76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1 : entity work.BIN_OP_EQ_uint12_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_left,
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_right,
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_return_output);

-- opc_result_MUX_uxn_opcodes_h_l2769_c7_0579
opc_result_MUX_uxn_opcodes_h_l2769_c7_0579 : entity work.MUX_uint1_t_opcode_result_t_opcode_result_t_0CLK_de264c78 port map (
opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_cond,
opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_iftrue,
opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_iffalse,
opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_return_output);

-- sft2_uxn_opcodes_h_l2769_c41_d577
sft2_uxn_opcodes_h_l2769_c41_d577 : entity work.sft2_0CLK_77062510 port map (
clk,
sft2_uxn_opcodes_h_l2769_c41_d577_CLOCK_ENABLE,
sft2_uxn_opcodes_h_l2769_c41_d577_phase,
sft2_uxn_opcodes_h_l2769_c41_d577_ins,
sft2_uxn_opcodes_h_l2769_c41_d577_previous_stack_read,
sft2_uxn_opcodes_h_l2769_c41_d577_return_output);

-- printf_uxn_opcodes_h_l2770_c9_0215_uxn_opcodes_h_l2770_c9_0215
printf_uxn_opcodes_h_l2770_c9_0215_uxn_opcodes_h_l2770_c9_0215 : entity work.printf_uxn_opcodes_h_l2770_c9_0215_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2770_c9_0215_uxn_opcodes_h_l2770_c9_0215_CLOCK_ENABLE,
printf_uxn_opcodes_h_l2770_c9_0215_uxn_opcodes_h_l2770_c9_0215_arg0);

-- BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9
BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_left,
BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_right,
BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb
BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_left,
BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_right,
BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_return_output);

-- MUX_uxn_opcodes_h_l2772_c18_3212
MUX_uxn_opcodes_h_l2772_c18_3212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2772_c18_3212_cond,
MUX_uxn_opcodes_h_l2772_c18_3212_iftrue,
MUX_uxn_opcodes_h_l2772_c18_3212_iffalse,
MUX_uxn_opcodes_h_l2772_c18_3212_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e
BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e : entity work.BIN_OP_XOR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_left,
BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_right,
BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_return_output);

-- sp1_MUX_uxn_opcodes_h_l2775_c2_289c
sp1_MUX_uxn_opcodes_h_l2775_c2_289c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2775_c2_289c_cond,
sp1_MUX_uxn_opcodes_h_l2775_c2_289c_iftrue,
sp1_MUX_uxn_opcodes_h_l2775_c2_289c_iffalse,
sp1_MUX_uxn_opcodes_h_l2775_c2_289c_return_output);

-- sp0_MUX_uxn_opcodes_h_l2775_c2_289c
sp0_MUX_uxn_opcodes_h_l2775_c2_289c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2775_c2_289c_cond,
sp0_MUX_uxn_opcodes_h_l2775_c2_289c_iftrue,
sp0_MUX_uxn_opcodes_h_l2775_c2_289c_iffalse,
sp0_MUX_uxn_opcodes_h_l2775_c2_289c_return_output);

-- sp1_MUX_uxn_opcodes_h_l2776_c3_abb5
sp1_MUX_uxn_opcodes_h_l2776_c3_abb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_cond,
sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_iftrue,
sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_iffalse,
sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_return_output);

-- sp0_MUX_uxn_opcodes_h_l2776_c3_abb5
sp0_MUX_uxn_opcodes_h_l2776_c3_abb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_cond,
sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_iftrue,
sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_iffalse,
sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b
BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_left,
BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_right,
BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5
BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_left,
BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_right,
BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_return_output);

-- MUX_uxn_opcodes_h_l2783_c30_f258
MUX_uxn_opcodes_h_l2783_c30_f258 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2783_c30_f258_cond,
MUX_uxn_opcodes_h_l2783_c30_f258_iftrue,
MUX_uxn_opcodes_h_l2783_c30_f258_iffalse,
MUX_uxn_opcodes_h_l2783_c30_f258_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16
BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16 : entity work.BIN_OP_MINUS_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_left,
BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_right,
BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_return_output);

-- MUX_uxn_opcodes_h_l2784_c20_b9b7
MUX_uxn_opcodes_h_l2784_c20_b9b7 : entity work.MUX_uint1_t_uint9_t_uint9_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2784_c20_b9b7_cond,
MUX_uxn_opcodes_h_l2784_c20_b9b7_iftrue,
MUX_uxn_opcodes_h_l2784_c20_b9b7_iffalse,
MUX_uxn_opcodes_h_l2784_c20_b9b7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c
BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c : entity work.BIN_OP_PLUS_uint12_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_left,
BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_right,
BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_return_output);

-- stack_ram_update_uxn_opcodes_h_l2786_c21_c47b
stack_ram_update_uxn_opcodes_h_l2786_c21_c47b : entity work.stack_ram_update_0CLK_23f04728 port map (
clk,
stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_CLOCK_ENABLE,
stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_stack_address,
stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_value,
stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_write_enable,
stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_return_output);



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
 opc,
 stack_index,
 is_wait,
 stack_address,
 stack_read_value,
 opc_result,
 opc_eval_result,
 -- All submodule outputs
 BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_return_output,
 CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2_return_output,
 MUX_uxn_opcodes_h_l2696_c10_16b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output,
 is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_return_output,
 opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_return_output,
 opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output,
 jci_uxn_opcodes_h_l2701_c41_b678_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_return_output,
 opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_return_output,
 jmi_uxn_opcodes_h_l2702_c41_b9cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_return_output,
 opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_return_output,
 jsi_uxn_opcodes_h_l2703_c41_fd08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_return_output,
 opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_return_output,
 lit_uxn_opcodes_h_l2704_c41_e13e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_return_output,
 opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_return_output,
 lit2_uxn_opcodes_h_l2705_c41_4388_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_return_output,
 lit_uxn_opcodes_h_l2706_c41_5f6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output,
 opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_return_output,
 lit2_uxn_opcodes_h_l2707_c41_270a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output,
 opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output,
 inc_uxn_opcodes_h_l2708_c41_572f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_return_output,
 opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output,
 inc2_uxn_opcodes_h_l2709_c41_a57b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_return_output,
 opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_return_output,
 pop_uxn_opcodes_h_l2710_c41_b071_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output,
 opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_return_output,
 pop2_uxn_opcodes_h_l2711_c41_c35c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output,
 opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output,
 nip_uxn_opcodes_h_l2712_c41_7bf8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output,
 nip2_uxn_opcodes_h_l2713_c41_7e7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output,
 opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_return_output,
 swp_uxn_opcodes_h_l2714_c41_cf94_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output,
 swp2_uxn_opcodes_h_l2715_c41_81b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output,
 opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output,
 rot_uxn_opcodes_h_l2716_c41_1f20_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output,
 rot2_uxn_opcodes_h_l2717_c41_9c3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_return_output,
 dup_uxn_opcodes_h_l2718_c41_c17e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output,
 opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output,
 dup2_uxn_opcodes_h_l2719_c41_0679_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output,
 ovr_uxn_opcodes_h_l2720_c41_04a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_return_output,
 opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output,
 ovr2_uxn_opcodes_h_l2721_c41_3590_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_return_output,
 equ_uxn_opcodes_h_l2722_c41_c13c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output,
 opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_return_output,
 equ2_uxn_opcodes_h_l2723_c41_7338_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output,
 neq_uxn_opcodes_h_l2724_c41_2133_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_return_output,
 opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output,
 neq2_uxn_opcodes_h_l2725_c41_9230_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output,
 opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_return_output,
 gth_uxn_opcodes_h_l2726_c41_a7a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output,
 gth2_uxn_opcodes_h_l2727_c41_48b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_return_output,
 opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output,
 lth_uxn_opcodes_h_l2728_c41_577e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output,
 opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_return_output,
 lth2_uxn_opcodes_h_l2729_c41_f078_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output,
 jmp_uxn_opcodes_h_l2730_c41_a2ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_return_output,
 opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output,
 jmp2_uxn_opcodes_h_l2731_c41_5859_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output,
 opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_return_output,
 jcn_uxn_opcodes_h_l2732_c41_d896_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output,
 jcn2_uxn_opcodes_h_l2733_c41_a3e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output,
 opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output,
 jsr_uxn_opcodes_h_l2734_c41_65a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output,
 jsr2_uxn_opcodes_h_l2735_c41_2859_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output,
 sth_uxn_opcodes_h_l2736_c41_fde0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output,
 opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output,
 sth2_uxn_opcodes_h_l2737_c41_432c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output,
 opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output,
 ldz_uxn_opcodes_h_l2738_c41_2192_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output,
 opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output,
 ldz2_uxn_opcodes_h_l2739_c41_de57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output,
 opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output,
 stz_uxn_opcodes_h_l2740_c41_7810_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output,
 stz2_uxn_opcodes_h_l2741_c41_cbc2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output,
 opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output,
 ldr_uxn_opcodes_h_l2742_c41_f07b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output,
 opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output,
 ldr2_uxn_opcodes_h_l2743_c41_0c58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output,
 str1_uxn_opcodes_h_l2744_c41_3dfb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_return_output,
 opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output,
 str2_uxn_opcodes_h_l2745_c41_c88a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_return_output,
 lda_uxn_opcodes_h_l2746_c41_3e4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output,
 lda2_uxn_opcodes_h_l2747_c41_63f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_return_output,
 opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output,
 sta_uxn_opcodes_h_l2748_c41_4167_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_return_output,
 opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_return_output,
 sta2_uxn_opcodes_h_l2749_c41_4fa0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_return_output,
 opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_return_output,
 dei_uxn_opcodes_h_l2750_c41_574b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output,
 opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_return_output,
 dei2_uxn_opcodes_h_l2751_c41_9acd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output,
 opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output,
 deo_uxn_opcodes_h_l2752_c41_e372_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output,
 opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output,
 deo2_uxn_opcodes_h_l2753_c41_12a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_return_output,
 opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output,
 add_uxn_opcodes_h_l2754_c41_3abf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output,
 opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_return_output,
 add2_uxn_opcodes_h_l2755_c41_9ced_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output,
 sub_uxn_opcodes_h_l2756_c41_feda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output,
 opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output,
 sub2_uxn_opcodes_h_l2757_c41_6d67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output,
 opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output,
 mul_uxn_opcodes_h_l2758_c41_7257_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_return_output,
 opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output,
 mul2_uxn_opcodes_h_l2759_c41_1949_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output,
 opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_return_output,
 div_uxn_opcodes_h_l2760_c41_6c4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output,
 opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output,
 div2_uxn_opcodes_h_l2761_c41_0c5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_return_output,
 opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output,
 and_uxn_opcodes_h_l2762_c41_ddd3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_return_output,
 opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_return_output,
 and2_uxn_opcodes_h_l2763_c41_ef9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output,
 opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_return_output,
 ora_uxn_opcodes_h_l2764_c41_9127_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_return_output,
 opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output,
 ora2_uxn_opcodes_h_l2765_c41_1769_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output,
 opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_return_output,
 eor_uxn_opcodes_h_l2766_c41_a32b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_return_output,
 opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output,
 eor2_uxn_opcodes_h_l2767_c41_d86f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_return_output,
 opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_return_output,
 sft_uxn_opcodes_h_l2768_c41_8e76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_return_output,
 opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_return_output,
 sft2_uxn_opcodes_h_l2769_c41_d577_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_return_output,
 MUX_uxn_opcodes_h_l2772_c18_3212_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_return_output,
 sp1_MUX_uxn_opcodes_h_l2775_c2_289c_return_output,
 sp0_MUX_uxn_opcodes_h_l2775_c2_289c_return_output,
 sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_return_output,
 sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_return_output,
 MUX_uxn_opcodes_h_l2783_c30_f258_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_return_output,
 MUX_uxn_opcodes_h_l2784_c20_b9b7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_return_output,
 stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : eval_opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_opc_uxn_opcodes_h_l2696_c2_02f1 : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2696_c10_16b5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2696_c10_16b5_iftrue : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2696_c10_16b5_iffalse : unsigned(11 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2696_c30_641d_return_output : unsigned(11 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2696_c57_0c2f_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2_return_output : unsigned(11 downto 0);
 variable VAR_CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2_x : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2696_c10_16b5_return_output : unsigned(11 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg1 : unsigned(31 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg2 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_iftrue : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_iffalse : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_return_output : unsigned(0 downto 0);
 variable VAR_is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_cond : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_iftrue : opcode_result_t;
 variable VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2700_c2_d362_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2700_c23_ba69_uxn_opcodes_h_l2700_c23_ba69_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_cond : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2701_c41_b678_phase : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2701_c41_b678_pc : unsigned(15 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2701_c41_b678_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2701_c41_b678_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2701_c41_b678_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jci_uxn_opcodes_h_l2701_c41_b678_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_cond : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_phase : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_pc : unsigned(15 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_right : unsigned(10 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_cond : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_phase : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_pc : unsigned(15 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_previous_ram_read : unsigned(7 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2704_c41_e13e_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2704_c41_e13e_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2704_c41_e13e_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2704_c41_e13e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2704_c41_e13e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2705_c41_4388_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2705_c41_4388_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2705_c41_4388_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2705_c41_4388_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2705_c41_4388_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_cond : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_phase : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_pc : unsigned(15 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_cond : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2707_c41_270a_phase : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2707_c41_270a_pc : unsigned(15 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2707_c41_270a_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2707_c41_270a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lit2_uxn_opcodes_h_l2707_c41_270a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_cond : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2708_c41_572f_phase : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2708_c41_572f_ins : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2708_c41_572f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2708_c41_572f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc_uxn_opcodes_h_l2708_c41_572f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_cond : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_phase : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_ins : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_cond : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2710_c41_b071_phase : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2710_c41_b071_ins : unsigned(7 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2710_c41_b071_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop_uxn_opcodes_h_l2710_c41_b071_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_cond : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2711_c41_c35c_phase : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2711_c41_c35c_ins : unsigned(7 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2711_c41_c35c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_pop2_uxn_opcodes_h_l2711_c41_c35c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_cond : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_phase : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_ins : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_cond : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_phase : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_ins : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_cond : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2714_c41_cf94_phase : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2714_c41_cf94_ins : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2714_c41_cf94_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2714_c41_cf94_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp_uxn_opcodes_h_l2714_c41_cf94_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_cond : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_phase : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_ins : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_cond : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2716_c41_1f20_phase : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2716_c41_1f20_ins : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2716_c41_1f20_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2716_c41_1f20_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot_uxn_opcodes_h_l2716_c41_1f20_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_cond : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_phase : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_ins : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_cond : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2718_c41_c17e_phase : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2718_c41_c17e_ins : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2718_c41_c17e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2718_c41_c17e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup_uxn_opcodes_h_l2718_c41_c17e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_cond : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2719_c41_0679_phase : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2719_c41_0679_ins : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2719_c41_0679_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2719_c41_0679_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dup2_uxn_opcodes_h_l2719_c41_0679_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_cond : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_phase : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_ins : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_cond : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_phase : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_ins : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_cond : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2722_c41_c13c_phase : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2722_c41_c13c_ins : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2722_c41_c13c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2722_c41_c13c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ_uxn_opcodes_h_l2722_c41_c13c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_cond : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2723_c41_7338_phase : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2723_c41_7338_ins : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2723_c41_7338_previous_stack_read : unsigned(7 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2723_c41_7338_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_equ2_uxn_opcodes_h_l2723_c41_7338_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_cond : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2724_c41_2133_phase : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2724_c41_2133_ins : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2724_c41_2133_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2724_c41_2133_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq_uxn_opcodes_h_l2724_c41_2133_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_cond : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2725_c41_9230_phase : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2725_c41_9230_ins : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2725_c41_9230_previous_stack_read : unsigned(7 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2725_c41_9230_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_neq2_uxn_opcodes_h_l2725_c41_9230_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_cond : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_phase : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_ins : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_cond : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_phase : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_ins : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_cond : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2728_c41_577e_phase : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2728_c41_577e_ins : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2728_c41_577e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2728_c41_577e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth_uxn_opcodes_h_l2728_c41_577e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_cond : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2729_c41_f078_phase : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2729_c41_f078_ins : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2729_c41_f078_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2729_c41_f078_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lth2_uxn_opcodes_h_l2729_c41_f078_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_cond : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_phase : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_ins : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_pc : unsigned(15 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_cond : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_phase : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_ins : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_cond : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2732_c41_d896_phase : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2732_c41_d896_ins : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2732_c41_d896_pc : unsigned(15 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2732_c41_d896_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2732_c41_d896_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn_uxn_opcodes_h_l2732_c41_d896_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_cond : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_phase : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_ins : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_cond : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_phase : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_ins : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_pc : unsigned(15 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_cond : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_phase : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_ins : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_pc : unsigned(15 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_previous_stack_read : unsigned(7 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_cond : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2736_c41_fde0_phase : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2736_c41_fde0_ins : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2736_c41_fde0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2736_c41_fde0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth_uxn_opcodes_h_l2736_c41_fde0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_cond : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2737_c41_432c_phase : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2737_c41_432c_ins : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2737_c41_432c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2737_c41_432c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sth2_uxn_opcodes_h_l2737_c41_432c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_cond : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2738_c41_2192_phase : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2738_c41_2192_ins : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2738_c41_2192_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2738_c41_2192_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2738_c41_2192_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz_uxn_opcodes_h_l2738_c41_2192_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_cond : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_phase : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_ins : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_cond : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2740_c41_7810_phase : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2740_c41_7810_ins : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2740_c41_7810_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2740_c41_7810_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz_uxn_opcodes_h_l2740_c41_7810_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_cond : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_phase : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_ins : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_previous_stack_read : unsigned(7 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_cond : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_phase : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_ins : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_pc : unsigned(15 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_cond : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_phase : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_ins : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_pc : unsigned(15 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_previous_ram_read : unsigned(7 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_cond : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_phase : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_ins : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_pc : unsigned(15 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_cond : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2745_c41_c88a_phase : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2745_c41_c88a_ins : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2745_c41_c88a_pc : unsigned(15 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2745_c41_c88a_previous_stack_read : unsigned(7 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2745_c41_c88a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_str2_uxn_opcodes_h_l2745_c41_c88a_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_cond : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_phase : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_ins : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_cond : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_phase : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_ins : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_previous_stack_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_previous_ram_read : unsigned(7 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_cond : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2748_c41_4167_phase : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2748_c41_4167_ins : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2748_c41_4167_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2748_c41_4167_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta_uxn_opcodes_h_l2748_c41_4167_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_cond : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_phase : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_ins : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_cond : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2750_c41_574b_phase : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2750_c41_574b_ins : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2750_c41_574b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2750_c41_574b_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2750_c41_574b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_uxn_opcodes_h_l2750_c41_574b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_cond : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_phase : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_ins : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_previous_stack_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_cond : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2752_c41_e372_phase : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2752_c41_e372_ins : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2752_c41_e372_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2752_c41_e372_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2752_c41_e372_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2752_c41_e372_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo_uxn_opcodes_h_l2752_c41_e372_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_cond : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_phase : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_ins : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_previous_ram_read : unsigned(7 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_cond : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2754_c41_3abf_phase : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2754_c41_3abf_ins : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2754_c41_3abf_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add_uxn_opcodes_h_l2754_c41_3abf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add_uxn_opcodes_h_l2754_c41_3abf_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_cond : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2755_c41_9ced_phase : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2755_c41_9ced_ins : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2755_c41_9ced_previous_stack_read : unsigned(7 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2755_c41_9ced_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_add2_uxn_opcodes_h_l2755_c41_9ced_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_cond : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2756_c41_feda_phase : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2756_c41_feda_ins : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2756_c41_feda_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2756_c41_feda_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub_uxn_opcodes_h_l2756_c41_feda_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_cond : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_phase : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_ins : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_cond : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2758_c41_7257_phase : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2758_c41_7257_ins : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2758_c41_7257_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2758_c41_7257_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul_uxn_opcodes_h_l2758_c41_7257_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_cond : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2759_c41_1949_phase : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2759_c41_1949_ins : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2759_c41_1949_previous_stack_read : unsigned(7 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2759_c41_1949_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_mul2_uxn_opcodes_h_l2759_c41_1949_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_cond : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2760_c41_6c4e_phase : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2760_c41_6c4e_ins : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2760_c41_6c4e_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div_uxn_opcodes_h_l2760_c41_6c4e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div_uxn_opcodes_h_l2760_c41_6c4e_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_cond : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_phase : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_ins : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_cond : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2762_c41_ddd3_phase : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2762_c41_ddd3_ins : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2762_c41_ddd3_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and_uxn_opcodes_h_l2762_c41_ddd3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and_uxn_opcodes_h_l2762_c41_ddd3_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_cond : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_phase : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_ins : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_previous_stack_read : unsigned(7 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_cond : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2764_c41_9127_phase : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2764_c41_9127_ins : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2764_c41_9127_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2764_c41_9127_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora_uxn_opcodes_h_l2764_c41_9127_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_cond : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2765_c41_1769_phase : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2765_c41_1769_ins : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2765_c41_1769_previous_stack_read : unsigned(7 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2765_c41_1769_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_ora2_uxn_opcodes_h_l2765_c41_1769_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_cond : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2766_c41_a32b_phase : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2766_c41_a32b_ins : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2766_c41_a32b_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2766_c41_a32b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor_uxn_opcodes_h_l2766_c41_a32b_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_cond : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_phase : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_ins : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_previous_stack_read : unsigned(7 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_return_output : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_cond : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2768_c41_8e76_phase : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2768_c41_8e76_ins : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2768_c41_8e76_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2768_c41_8e76_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft_uxn_opcodes_h_l2768_c41_8e76_return_output : opcode_result_t;
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_iffalse : unsigned(0 downto 0);
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_iftrue : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_iffalse : opcode_result_t;
 variable VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_cond : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2769_c41_d577_phase : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2769_c41_d577_ins : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2769_c41_d577_previous_stack_read : unsigned(7 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2769_c41_d577_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_sft2_uxn_opcodes_h_l2769_c41_d577_return_output : opcode_result_t;
 variable VAR_printf_uxn_opcodes_h_l2770_c9_0215_uxn_opcodes_h_l2770_c9_0215_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2770_c9_0215_uxn_opcodes_h_l2770_c9_0215_arg0 : unsigned(31 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2772_c18_3212_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2772_c18_3212_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2772_c18_3212_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2772_c18_3212_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_left : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2773_c17_c5ba_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2775_c6_6a3d_return_output : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2775_c2_289c_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2775_c2_289c_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2775_c2_289c_return_output : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2775_c2_289c_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2775_c2_289c_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2775_c2_289c_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2775_c2_289c_return_output : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2775_c2_289c_cond : unsigned(0 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_iftrue : unsigned(7 downto 0);
 variable VAR_sp1_uxn_opcodes_h_l2777_c4_7820 : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_iffalse : unsigned(7 downto 0);
 variable VAR_sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_cond : unsigned(0 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_iftrue : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_iffalse : unsigned(7 downto 0);
 variable VAR_sp0_uxn_opcodes_h_l2779_c4_dbfe : unsigned(7 downto 0);
 variable VAR_sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_return_output : signed(9 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2783_c30_f258_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2783_c30_f258_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2783_c30_f258_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2783_c30_f258_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2783_c19_7d8d_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_left : unsigned(11 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2783_c70_4542_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2783_c59_7bd3_return_output : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_return_output : unsigned(11 downto 0);
 variable VAR_stack_address_uxn_opcodes_h_l2784_c2_4484 : unsigned(11 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_left : unsigned(11 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2784_c20_b9b7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2784_c20_b9b7_iftrue : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2784_c20_b9b7_iffalse : unsigned(8 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2784_c20_b9b7_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_return_output : unsigned(12 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_stack_address : unsigned(11 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_value : unsigned(7 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_write_enable : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2789_c3_3a80_return_output : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2793_c39_95ff_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2794_c40_cc35_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2795_c34_bf3d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2796_c30_478c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2797_c33_c282_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2798_c34_5fd5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2799_c37_e3d2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2800_c33_1e25_return_output : unsigned(23 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2802_c32_80df_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2777_l2779_DUPLICATE_4f46_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2779_l2777_DUPLICATE_5091_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2788_l2801_DUPLICATE_acc5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2804_l2682_DUPLICATE_be73_return_output : eval_opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_sp0 : unsigned(7 downto 0);
variable REG_VAR_sp1 : unsigned(7 downto 0);
variable REG_VAR_opc : unsigned(11 downto 0);
variable REG_VAR_stack_index : unsigned(0 downto 0);
variable REG_VAR_is_wait : unsigned(0 downto 0);
variable REG_VAR_stack_address : unsigned(11 downto 0);
variable REG_VAR_stack_read_value : unsigned(7 downto 0);
variable REG_VAR_opc_result : opcode_result_t;
variable REG_VAR_opc_eval_result : eval_opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_sp0 := sp0;
  REG_VAR_sp1 := sp1;
  REG_VAR_opc := opc;
  REG_VAR_stack_index := stack_index;
  REG_VAR_is_wait := is_wait;
  REG_VAR_stack_address := stack_address;
  REG_VAR_stack_read_value := stack_read_value;
  REG_VAR_opc_result := opc_result;
  REG_VAR_opc_eval_result := opc_eval_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_right := to_unsigned(35, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_right := to_unsigned(50, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_right := to_unsigned(22, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_right := to_unsigned(21, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_right := to_unsigned(3584, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_right := to_unsigned(56, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_right := to_unsigned(16, 5);
     VAR_is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_iffalse := to_unsigned(0, 1);
     VAR_is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_right := to_unsigned(27, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_right := to_unsigned(34, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_right := to_unsigned(512, 10);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_right := to_unsigned(30, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_right := to_unsigned(51, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_right := to_unsigned(6, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_right := to_unsigned(36, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_right := to_unsigned(25, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_right := to_unsigned(8, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_right := to_unsigned(63, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_right := to_unsigned(44, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_right := to_unsigned(52, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_right := to_unsigned(47, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_right := to_unsigned(12, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2772_c18_3212_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_right := to_unsigned(42, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_right := to_unsigned(40, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_right := to_unsigned(33, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_right := to_unsigned(29, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_right := to_unsigned(53, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2772_c18_3212_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_right := to_unsigned(54, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_right := to_unsigned(1536, 11);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_right := to_unsigned(55, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_right := to_unsigned(41, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_right := to_unsigned(62, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_right := to_unsigned(39, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_right := to_unsigned(43, 6);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_right := to_unsigned(31, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_right := to_unsigned(2048, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_right := to_unsigned(48, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_right := to_unsigned(57, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_right := to_unsigned(17, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_right := to_unsigned(26, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_right := to_unsigned(64, 7);
     VAR_MUX_uxn_opcodes_h_l2784_c20_b9b7_iffalse := resize(to_unsigned(0, 1), 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_right := to_unsigned(20, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_right := to_unsigned(59, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_right := to_unsigned(63, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_right := to_unsigned(38, 6);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_right := to_unsigned(60, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_right := to_unsigned(49, 6);
     VAR_MUX_uxn_opcodes_h_l2784_c20_b9b7_iftrue := to_unsigned(256, 9);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_right := to_unsigned(24, 5);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_right := to_unsigned(45, 6);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_right := to_unsigned(28, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_right := to_unsigned(2560, 12);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_right := to_unsigned(61, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_right := to_unsigned(37, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_right := to_unsigned(46, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_right := to_unsigned(58, 6);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_right := to_unsigned(23, 5);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_right := to_unsigned(3072, 12);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_right := to_unsigned(18, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_right := to_unsigned(1024, 11);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_iftrue := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_left := VAR_ins;
     VAR_add2_uxn_opcodes_h_l2755_c41_9ced_ins := VAR_ins;
     VAR_add_uxn_opcodes_h_l2754_c41_3abf_ins := VAR_ins;
     VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_ins := VAR_ins;
     VAR_and_uxn_opcodes_h_l2762_c41_ddd3_ins := VAR_ins;
     VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_ins := VAR_ins;
     VAR_dei_uxn_opcodes_h_l2750_c41_574b_ins := VAR_ins;
     VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_ins := VAR_ins;
     VAR_deo_uxn_opcodes_h_l2752_c41_e372_ins := VAR_ins;
     VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_ins := VAR_ins;
     VAR_div_uxn_opcodes_h_l2760_c41_6c4e_ins := VAR_ins;
     VAR_dup2_uxn_opcodes_h_l2719_c41_0679_ins := VAR_ins;
     VAR_dup_uxn_opcodes_h_l2718_c41_c17e_ins := VAR_ins;
     VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_ins := VAR_ins;
     VAR_eor_uxn_opcodes_h_l2766_c41_a32b_ins := VAR_ins;
     VAR_equ2_uxn_opcodes_h_l2723_c41_7338_ins := VAR_ins;
     VAR_equ_uxn_opcodes_h_l2722_c41_c13c_ins := VAR_ins;
     VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_ins := VAR_ins;
     VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_ins := VAR_ins;
     VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_ins := VAR_ins;
     VAR_inc_uxn_opcodes_h_l2708_c41_572f_ins := VAR_ins;
     VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_ins := VAR_ins;
     VAR_jcn_uxn_opcodes_h_l2732_c41_d896_ins := VAR_ins;
     VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_ins := VAR_ins;
     VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_ins := VAR_ins;
     VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_ins := VAR_ins;
     VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_ins := VAR_ins;
     VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_ins := VAR_ins;
     VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_ins := VAR_ins;
     VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_ins := VAR_ins;
     VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_ins := VAR_ins;
     VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_ins := VAR_ins;
     VAR_ldz_uxn_opcodes_h_l2738_c41_2192_ins := VAR_ins;
     VAR_lth2_uxn_opcodes_h_l2729_c41_f078_ins := VAR_ins;
     VAR_lth_uxn_opcodes_h_l2728_c41_577e_ins := VAR_ins;
     VAR_mul2_uxn_opcodes_h_l2759_c41_1949_ins := VAR_ins;
     VAR_mul_uxn_opcodes_h_l2758_c41_7257_ins := VAR_ins;
     VAR_neq2_uxn_opcodes_h_l2725_c41_9230_ins := VAR_ins;
     VAR_neq_uxn_opcodes_h_l2724_c41_2133_ins := VAR_ins;
     VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_ins := VAR_ins;
     VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_ins := VAR_ins;
     VAR_ora2_uxn_opcodes_h_l2765_c41_1769_ins := VAR_ins;
     VAR_ora_uxn_opcodes_h_l2764_c41_9127_ins := VAR_ins;
     VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_ins := VAR_ins;
     VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_ins := VAR_ins;
     VAR_pop2_uxn_opcodes_h_l2711_c41_c35c_ins := VAR_ins;
     VAR_pop_uxn_opcodes_h_l2710_c41_b071_ins := VAR_ins;
     VAR_printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg0 := resize(VAR_ins, 32);
     VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_ins := VAR_ins;
     VAR_rot_uxn_opcodes_h_l2716_c41_1f20_ins := VAR_ins;
     VAR_sft2_uxn_opcodes_h_l2769_c41_d577_ins := VAR_ins;
     VAR_sft_uxn_opcodes_h_l2768_c41_8e76_ins := VAR_ins;
     VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_ins := VAR_ins;
     VAR_sta_uxn_opcodes_h_l2748_c41_4167_ins := VAR_ins;
     VAR_sth2_uxn_opcodes_h_l2737_c41_432c_ins := VAR_ins;
     VAR_sth_uxn_opcodes_h_l2736_c41_fde0_ins := VAR_ins;
     VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_ins := VAR_ins;
     VAR_str2_uxn_opcodes_h_l2745_c41_c88a_ins := VAR_ins;
     VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_ins := VAR_ins;
     VAR_stz_uxn_opcodes_h_l2740_c41_7810_ins := VAR_ins;
     VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_ins := VAR_ins;
     VAR_sub_uxn_opcodes_h_l2756_c41_feda_ins := VAR_ins;
     VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_ins := VAR_ins;
     VAR_swp_uxn_opcodes_h_l2714_c41_cf94_ins := VAR_ins;
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_iffalse := opc_result;
     VAR_jci_uxn_opcodes_h_l2701_c41_b678_pc := VAR_pc;
     VAR_jcn_uxn_opcodes_h_l2732_c41_d896_pc := VAR_pc;
     VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_pc := VAR_pc;
     VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_pc := VAR_pc;
     VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_pc := VAR_pc;
     VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_pc := VAR_pc;
     VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_pc := VAR_pc;
     VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_pc := VAR_pc;
     VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2705_c41_4388_pc := VAR_pc;
     VAR_lit2_uxn_opcodes_h_l2707_c41_270a_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2704_c41_e13e_pc := VAR_pc;
     VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_pc := VAR_pc;
     VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_pc := VAR_pc;
     VAR_str2_uxn_opcodes_h_l2745_c41_c88a_pc := VAR_pc;
     VAR_add2_uxn_opcodes_h_l2755_c41_9ced_phase := VAR_phase;
     VAR_add_uxn_opcodes_h_l2754_c41_3abf_phase := VAR_phase;
     VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_phase := VAR_phase;
     VAR_and_uxn_opcodes_h_l2762_c41_ddd3_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_phase := VAR_phase;
     VAR_dei_uxn_opcodes_h_l2750_c41_574b_phase := VAR_phase;
     VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_phase := VAR_phase;
     VAR_deo_uxn_opcodes_h_l2752_c41_e372_phase := VAR_phase;
     VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_phase := VAR_phase;
     VAR_div_uxn_opcodes_h_l2760_c41_6c4e_phase := VAR_phase;
     VAR_dup2_uxn_opcodes_h_l2719_c41_0679_phase := VAR_phase;
     VAR_dup_uxn_opcodes_h_l2718_c41_c17e_phase := VAR_phase;
     VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_phase := VAR_phase;
     VAR_eor_uxn_opcodes_h_l2766_c41_a32b_phase := VAR_phase;
     VAR_equ2_uxn_opcodes_h_l2723_c41_7338_phase := VAR_phase;
     VAR_equ_uxn_opcodes_h_l2722_c41_c13c_phase := VAR_phase;
     VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_phase := VAR_phase;
     VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_phase := VAR_phase;
     VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_phase := VAR_phase;
     VAR_inc_uxn_opcodes_h_l2708_c41_572f_phase := VAR_phase;
     VAR_jci_uxn_opcodes_h_l2701_c41_b678_phase := VAR_phase;
     VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_phase := VAR_phase;
     VAR_jcn_uxn_opcodes_h_l2732_c41_d896_phase := VAR_phase;
     VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_phase := VAR_phase;
     VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_phase := VAR_phase;
     VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_phase := VAR_phase;
     VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_phase := VAR_phase;
     VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_phase := VAR_phase;
     VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_phase := VAR_phase;
     VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_phase := VAR_phase;
     VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_phase := VAR_phase;
     VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_phase := VAR_phase;
     VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_phase := VAR_phase;
     VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_phase := VAR_phase;
     VAR_ldz_uxn_opcodes_h_l2738_c41_2192_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2705_c41_4388_phase := VAR_phase;
     VAR_lit2_uxn_opcodes_h_l2707_c41_270a_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2704_c41_e13e_phase := VAR_phase;
     VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_phase := VAR_phase;
     VAR_lth2_uxn_opcodes_h_l2729_c41_f078_phase := VAR_phase;
     VAR_lth_uxn_opcodes_h_l2728_c41_577e_phase := VAR_phase;
     VAR_mul2_uxn_opcodes_h_l2759_c41_1949_phase := VAR_phase;
     VAR_mul_uxn_opcodes_h_l2758_c41_7257_phase := VAR_phase;
     VAR_neq2_uxn_opcodes_h_l2725_c41_9230_phase := VAR_phase;
     VAR_neq_uxn_opcodes_h_l2724_c41_2133_phase := VAR_phase;
     VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_phase := VAR_phase;
     VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_phase := VAR_phase;
     VAR_ora2_uxn_opcodes_h_l2765_c41_1769_phase := VAR_phase;
     VAR_ora_uxn_opcodes_h_l2764_c41_9127_phase := VAR_phase;
     VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_phase := VAR_phase;
     VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_phase := VAR_phase;
     VAR_pop2_uxn_opcodes_h_l2711_c41_c35c_phase := VAR_phase;
     VAR_pop_uxn_opcodes_h_l2710_c41_b071_phase := VAR_phase;
     VAR_printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg2 := resize(VAR_phase, 32);
     VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_phase := VAR_phase;
     VAR_rot_uxn_opcodes_h_l2716_c41_1f20_phase := VAR_phase;
     VAR_sft2_uxn_opcodes_h_l2769_c41_d577_phase := VAR_phase;
     VAR_sft_uxn_opcodes_h_l2768_c41_8e76_phase := VAR_phase;
     VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_phase := VAR_phase;
     VAR_sta_uxn_opcodes_h_l2748_c41_4167_phase := VAR_phase;
     VAR_sth2_uxn_opcodes_h_l2737_c41_432c_phase := VAR_phase;
     VAR_sth_uxn_opcodes_h_l2736_c41_fde0_phase := VAR_phase;
     VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_phase := VAR_phase;
     VAR_str2_uxn_opcodes_h_l2745_c41_c88a_phase := VAR_phase;
     VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_phase := VAR_phase;
     VAR_stz_uxn_opcodes_h_l2740_c41_7810_phase := VAR_phase;
     VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_phase := VAR_phase;
     VAR_sub_uxn_opcodes_h_l2756_c41_feda_phase := VAR_phase;
     VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_phase := VAR_phase;
     VAR_swp_uxn_opcodes_h_l2714_c41_cf94_phase := VAR_phase;
     VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_dei_uxn_opcodes_h_l2750_c41_574b_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo_uxn_opcodes_h_l2752_c41_e372_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_previous_ram_read := VAR_previous_ram_read;
     VAR_deo_uxn_opcodes_h_l2752_c41_e372_previous_ram_read := VAR_previous_ram_read;
     VAR_jci_uxn_opcodes_h_l2701_c41_b678_previous_ram_read := VAR_previous_ram_read;
     VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_previous_ram_read := VAR_previous_ram_read;
     VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_previous_ram_read := VAR_previous_ram_read;
     VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_previous_ram_read := VAR_previous_ram_read;
     VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_previous_ram_read := VAR_previous_ram_read;
     VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_previous_ram_read := VAR_previous_ram_read;
     VAR_ldz_uxn_opcodes_h_l2738_c41_2192_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2705_c41_4388_previous_ram_read := VAR_previous_ram_read;
     VAR_lit2_uxn_opcodes_h_l2707_c41_270a_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2704_c41_e13e_previous_ram_read := VAR_previous_ram_read;
     VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_previous_ram_read := VAR_previous_ram_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_left := signed(std_logic_vector(resize(sp0, 9)));
     VAR_sp0_MUX_uxn_opcodes_h_l2775_c2_289c_iffalse := sp0;
     VAR_sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_iftrue := sp0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_left := signed(std_logic_vector(resize(sp1, 9)));
     VAR_sp1_MUX_uxn_opcodes_h_l2775_c2_289c_iffalse := sp1;
     VAR_sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_iffalse := sp1;
     VAR_add2_uxn_opcodes_h_l2755_c41_9ced_previous_stack_read := stack_read_value;
     VAR_add_uxn_opcodes_h_l2754_c41_3abf_previous_stack_read := stack_read_value;
     VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_previous_stack_read := stack_read_value;
     VAR_and_uxn_opcodes_h_l2762_c41_ddd3_previous_stack_read := stack_read_value;
     VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_previous_stack_read := stack_read_value;
     VAR_dei_uxn_opcodes_h_l2750_c41_574b_previous_stack_read := stack_read_value;
     VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_previous_stack_read := stack_read_value;
     VAR_deo_uxn_opcodes_h_l2752_c41_e372_previous_stack_read := stack_read_value;
     VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_previous_stack_read := stack_read_value;
     VAR_div_uxn_opcodes_h_l2760_c41_6c4e_previous_stack_read := stack_read_value;
     VAR_dup2_uxn_opcodes_h_l2719_c41_0679_previous_stack_read := stack_read_value;
     VAR_dup_uxn_opcodes_h_l2718_c41_c17e_previous_stack_read := stack_read_value;
     VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_previous_stack_read := stack_read_value;
     VAR_eor_uxn_opcodes_h_l2766_c41_a32b_previous_stack_read := stack_read_value;
     VAR_equ2_uxn_opcodes_h_l2723_c41_7338_previous_stack_read := stack_read_value;
     VAR_equ_uxn_opcodes_h_l2722_c41_c13c_previous_stack_read := stack_read_value;
     VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_previous_stack_read := stack_read_value;
     VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_previous_stack_read := stack_read_value;
     VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_previous_stack_read := stack_read_value;
     VAR_inc_uxn_opcodes_h_l2708_c41_572f_previous_stack_read := stack_read_value;
     VAR_jci_uxn_opcodes_h_l2701_c41_b678_previous_stack_read := stack_read_value;
     VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_previous_stack_read := stack_read_value;
     VAR_jcn_uxn_opcodes_h_l2732_c41_d896_previous_stack_read := stack_read_value;
     VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_previous_stack_read := stack_read_value;
     VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_previous_stack_read := stack_read_value;
     VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_previous_stack_read := stack_read_value;
     VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_previous_stack_read := stack_read_value;
     VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_previous_stack_read := stack_read_value;
     VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_previous_stack_read := stack_read_value;
     VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_previous_stack_read := stack_read_value;
     VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_previous_stack_read := stack_read_value;
     VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_previous_stack_read := stack_read_value;
     VAR_ldz_uxn_opcodes_h_l2738_c41_2192_previous_stack_read := stack_read_value;
     VAR_lth2_uxn_opcodes_h_l2729_c41_f078_previous_stack_read := stack_read_value;
     VAR_lth_uxn_opcodes_h_l2728_c41_577e_previous_stack_read := stack_read_value;
     VAR_mul2_uxn_opcodes_h_l2759_c41_1949_previous_stack_read := stack_read_value;
     VAR_mul_uxn_opcodes_h_l2758_c41_7257_previous_stack_read := stack_read_value;
     VAR_neq2_uxn_opcodes_h_l2725_c41_9230_previous_stack_read := stack_read_value;
     VAR_neq_uxn_opcodes_h_l2724_c41_2133_previous_stack_read := stack_read_value;
     VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_previous_stack_read := stack_read_value;
     VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_previous_stack_read := stack_read_value;
     VAR_ora2_uxn_opcodes_h_l2765_c41_1769_previous_stack_read := stack_read_value;
     VAR_ora_uxn_opcodes_h_l2764_c41_9127_previous_stack_read := stack_read_value;
     VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_previous_stack_read := stack_read_value;
     VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_previous_stack_read := stack_read_value;
     VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_previous_stack_read := stack_read_value;
     VAR_rot_uxn_opcodes_h_l2716_c41_1f20_previous_stack_read := stack_read_value;
     VAR_sft2_uxn_opcodes_h_l2769_c41_d577_previous_stack_read := stack_read_value;
     VAR_sft_uxn_opcodes_h_l2768_c41_8e76_previous_stack_read := stack_read_value;
     VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_previous_stack_read := stack_read_value;
     VAR_sta_uxn_opcodes_h_l2748_c41_4167_previous_stack_read := stack_read_value;
     VAR_sth2_uxn_opcodes_h_l2737_c41_432c_previous_stack_read := stack_read_value;
     VAR_sth_uxn_opcodes_h_l2736_c41_fde0_previous_stack_read := stack_read_value;
     VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_previous_stack_read := stack_read_value;
     VAR_str2_uxn_opcodes_h_l2745_c41_c88a_previous_stack_read := stack_read_value;
     VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_previous_stack_read := stack_read_value;
     VAR_stz_uxn_opcodes_h_l2740_c41_7810_previous_stack_read := stack_read_value;
     VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_previous_stack_read := stack_read_value;
     VAR_sub_uxn_opcodes_h_l2756_c41_feda_previous_stack_read := stack_read_value;
     VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_previous_stack_read := stack_read_value;
     VAR_swp_uxn_opcodes_h_l2714_c41_cf94_previous_stack_read := stack_read_value;
     -- BIN_OP_AND[uxn_opcodes_h_l2772_c18_edb9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_left;
     BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_return_output := BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2696_c57_0c2f] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2696_c57_0c2f_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_ins);

     -- BIN_OP_AND[uxn_opcodes_h_l2696_c41_a835] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_left;
     BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_return_output := BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2696_c10_0152] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_left;
     BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_return_output := BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_return_output;

     -- opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f[uxn_opcodes_h_l2700_c2_d362] LATENCY=0
     VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2700_c2_d362_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f(
     opc_result,
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c10_0152_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2772_c18_edb9_return_output;
     VAR_CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2_x := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2696_c57_0c2f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_iftrue := VAR_opc_result_TRUE_INPUT_MUX_CONST_REF_RD_opcode_result_t_opcode_result_t_3a2f_uxn_opcodes_h_l2700_c2_d362_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2772_c18_8adb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_left;
     BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_return_output := BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2696_c10_cd2a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_left;
     BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_return_output := BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_return_output;

     -- CAST_TO_uint12_t[uxn_opcodes_h_l2696_c30_641d] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2696_c30_641d_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l2696_c41_a835_return_output);

     -- CONST_SL_4[uxn_opcodes_h_l2696_c57_14f2] LATENCY=0
     -- Inputs
     CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2_x <= VAR_CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2_x;
     -- Outputs
     VAR_CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2_return_output := CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2696_c10_16b5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2696_c10_cd2a_return_output;
     VAR_MUX_uxn_opcodes_h_l2772_c18_3212_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2772_c18_8adb_return_output;
     VAR_MUX_uxn_opcodes_h_l2696_c10_16b5_iftrue := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2696_c30_641d_return_output;
     VAR_MUX_uxn_opcodes_h_l2696_c10_16b5_iffalse := VAR_CONST_SL_4_uxn_opcodes_h_l2696_c57_14f2_return_output;
     -- MUX[uxn_opcodes_h_l2772_c18_3212] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2772_c18_3212_cond <= VAR_MUX_uxn_opcodes_h_l2772_c18_3212_cond;
     MUX_uxn_opcodes_h_l2772_c18_3212_iftrue <= VAR_MUX_uxn_opcodes_h_l2772_c18_3212_iftrue;
     MUX_uxn_opcodes_h_l2772_c18_3212_iffalse <= VAR_MUX_uxn_opcodes_h_l2772_c18_3212_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2772_c18_3212_return_output := MUX_uxn_opcodes_h_l2772_c18_3212_return_output;

     -- MUX[uxn_opcodes_h_l2696_c10_16b5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2696_c10_16b5_cond <= VAR_MUX_uxn_opcodes_h_l2696_c10_16b5_cond;
     MUX_uxn_opcodes_h_l2696_c10_16b5_iftrue <= VAR_MUX_uxn_opcodes_h_l2696_c10_16b5_iftrue;
     MUX_uxn_opcodes_h_l2696_c10_16b5_iffalse <= VAR_MUX_uxn_opcodes_h_l2696_c10_16b5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2696_c10_16b5_return_output := MUX_uxn_opcodes_h_l2696_c10_16b5_return_output;

     -- Submodule level 3
     VAR_opc_uxn_opcodes_h_l2696_c2_02f1 := VAR_MUX_uxn_opcodes_h_l2696_c10_16b5_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_left := VAR_MUX_uxn_opcodes_h_l2772_c18_3212_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_left := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     REG_VAR_opc := VAR_opc_uxn_opcodes_h_l2696_c2_02f1;
     VAR_printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg1 := resize(VAR_opc_uxn_opcodes_h_l2696_c2_02f1, 32);
     VAR_printf_uxn_opcodes_h_l2770_c9_0215_uxn_opcodes_h_l2770_c9_0215_arg0 := resize(VAR_opc_uxn_opcodes_h_l2696_c2_02f1, 32);
     -- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_a906] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_left;
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_return_output := BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_e4c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2752_c11_6b13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_left;
     BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_return_output := BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_b650] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_left;
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_return_output := BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_97a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_0e1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2720_c11_65d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_40bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2762_c11_c3ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2721_c11_ad30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_left;
     BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_return_output := BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_e008] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_left;
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_return_output := BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2703_c11_0684] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_left;
     BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_return_output := BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_71b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_1548] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_left;
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_return_output := BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2756_c11_fc3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2729_c11_8cda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_left;
     BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_return_output := BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_return_output;

     -- printf_uxn_opcodes_h_l2698_c2_d875[uxn_opcodes_h_l2698_c2_d875] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg0 <= VAR_printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg0;
     printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg1 <= VAR_printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg1;
     printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg2 <= VAR_printf_uxn_opcodes_h_l2698_c2_d875_uxn_opcodes_h_l2698_c2_d875_arg2;
     -- Outputs

     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_0be4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_f848] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_left;
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_return_output := BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_1753] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_left;
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_return_output := BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_4cf5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2740_c11_cf8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2764_c11_e1fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2744_c11_334e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2708_c11_4a7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_7460] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_left;
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_return_output := BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_f7e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2715_c11_f0c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2769_c11_80f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_1aba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_left;
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_return_output := BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_65d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2748_c11_14f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2768_c11_722c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_00e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_0e41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_left;
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_return_output := BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2745_c11_5096] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_left;
     BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_return_output := BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2753_c11_d3a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_450e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2702_c11_3f92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_left;
     BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_return_output := BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2711_c11_4ec6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2746_c11_9095] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_left;
     BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_return_output := BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_e23e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_5198] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_c15a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2712_c11_94c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_0d4b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_776b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2719_c11_7449] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_left;
     BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_return_output := BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2704_c11_65f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2733_c11_becd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2750_c11_23b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2767_c11_c672] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_left;
     BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_return_output := BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_3e5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_3a12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_left;
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_return_output := BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2706_c11_3893] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_left;
     BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_return_output := BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_1645] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_left;
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_return_output := BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_16d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2754_c11_3e34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_left;
     BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_return_output := BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_ba9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2716_c11_7b5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_9158] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2707_c11_3389] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_left;
     BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_return_output := BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_1536] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_left;
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_return_output := BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_c17f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_0610] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_left;
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_return_output := BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2700_c6_f7ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_2e08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_left;
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_return_output := BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2737_c11_7ea0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_dc77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_left;
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_return_output := BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_1c2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_267e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_return_output;
     VAR_is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c6_f7ee_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_450e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_3f92_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c11_0684_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2704_c11_65f9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_e4c5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_3893_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_3389_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c11_4a7e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_00e6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_267e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_4ec6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2712_c11_94c1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_f848_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_1645_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_f0c6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_7b5c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_5198_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_e23e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_7449_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2720_c11_65d7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_ad30_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_c17f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_0e1f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_3e5a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_1aba_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_1548_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_c15a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_16d4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2729_c11_8cda_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_1c2b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_0610_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_0d4b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2733_c11_becd_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_f7e8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_776b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_1753_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2737_c11_7ea0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_0be4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_1536_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_cf8b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_71b5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_9158_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_ba9f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2744_c11_334e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2745_c11_5096_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2746_c11_9095_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_40bc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_14f8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_e008_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2750_c11_23b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_65d2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_6b13_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_d3a5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2754_c11_3e34_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_2e08_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_fc3b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_a906_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_4cf5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_0e41_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_3a12_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_b650_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2762_c11_c3ab_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_dc77_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2764_c11_e1fc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_7460_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_97a4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_c672_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2768_c11_722c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_80f1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2701_c7_5c17] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2700_c1_ce6a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_return_output;

     -- is_wait_MUX[uxn_opcodes_h_l2700_c2_d362] LATENCY=0
     -- Inputs
     is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_cond <= VAR_is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_cond;
     is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_iftrue <= VAR_is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_iftrue;
     is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_iffalse <= VAR_is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_iffalse;
     -- Outputs
     VAR_is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_return_output := is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output;
     VAR_printf_uxn_opcodes_h_l2700_c23_ba69_uxn_opcodes_h_l2700_c23_ba69_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2700_c1_ce6a_return_output;
     REG_VAR_is_wait := VAR_is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_return_output;
     -- printf_uxn_opcodes_h_l2700_c23_ba69[uxn_opcodes_h_l2700_c23_ba69] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2700_c23_ba69_uxn_opcodes_h_l2700_c23_ba69_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2700_c23_ba69_uxn_opcodes_h_l2700_c23_ba69_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2702_c7_d538] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2701_c1_434c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c7_d538_return_output;
     VAR_jci_uxn_opcodes_h_l2701_c41_b678_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2701_c1_434c_return_output;
     -- jci[uxn_opcodes_h_l2701_c41_b678] LATENCY=0
     -- Clock enable
     jci_uxn_opcodes_h_l2701_c41_b678_CLOCK_ENABLE <= VAR_jci_uxn_opcodes_h_l2701_c41_b678_CLOCK_ENABLE;
     -- Inputs
     jci_uxn_opcodes_h_l2701_c41_b678_phase <= VAR_jci_uxn_opcodes_h_l2701_c41_b678_phase;
     jci_uxn_opcodes_h_l2701_c41_b678_pc <= VAR_jci_uxn_opcodes_h_l2701_c41_b678_pc;
     jci_uxn_opcodes_h_l2701_c41_b678_previous_stack_read <= VAR_jci_uxn_opcodes_h_l2701_c41_b678_previous_stack_read;
     jci_uxn_opcodes_h_l2701_c41_b678_previous_ram_read <= VAR_jci_uxn_opcodes_h_l2701_c41_b678_previous_ram_read;
     -- Outputs
     VAR_jci_uxn_opcodes_h_l2701_c41_b678_return_output := jci_uxn_opcodes_h_l2701_c41_b678_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2703_c7_3648] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2702_c1_0e74] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c7_3648_return_output;
     VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2702_c1_0e74_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_iftrue := VAR_jci_uxn_opcodes_h_l2701_c41_b678_return_output;
     -- jmi[uxn_opcodes_h_l2702_c41_b9cc] LATENCY=0
     -- Clock enable
     jmi_uxn_opcodes_h_l2702_c41_b9cc_CLOCK_ENABLE <= VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_CLOCK_ENABLE;
     -- Inputs
     jmi_uxn_opcodes_h_l2702_c41_b9cc_phase <= VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_phase;
     jmi_uxn_opcodes_h_l2702_c41_b9cc_pc <= VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_pc;
     jmi_uxn_opcodes_h_l2702_c41_b9cc_previous_ram_read <= VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_previous_ram_read;
     -- Outputs
     VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_return_output := jmi_uxn_opcodes_h_l2702_c41_b9cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2704_c7_8860] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2703_c1_d32f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c7_8860_return_output;
     VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2703_c1_d32f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_iftrue := VAR_jmi_uxn_opcodes_h_l2702_c41_b9cc_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2705_c7_6821] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2704_c1_65b0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_return_output;

     -- jsi[uxn_opcodes_h_l2703_c41_fd08] LATENCY=0
     -- Clock enable
     jsi_uxn_opcodes_h_l2703_c41_fd08_CLOCK_ENABLE <= VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_CLOCK_ENABLE;
     -- Inputs
     jsi_uxn_opcodes_h_l2703_c41_fd08_phase <= VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_phase;
     jsi_uxn_opcodes_h_l2703_c41_fd08_pc <= VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_pc;
     jsi_uxn_opcodes_h_l2703_c41_fd08_previous_ram_read <= VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_previous_ram_read;
     -- Outputs
     VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_return_output := jsi_uxn_opcodes_h_l2703_c41_fd08_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c7_6821_return_output;
     VAR_lit_uxn_opcodes_h_l2704_c41_e13e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2704_c1_65b0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_iftrue := VAR_jsi_uxn_opcodes_h_l2703_c41_fd08_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2706_c7_c492] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2705_c1_99f4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_return_output;

     -- lit[uxn_opcodes_h_l2704_c41_e13e] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2704_c41_e13e_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2704_c41_e13e_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2704_c41_e13e_phase <= VAR_lit_uxn_opcodes_h_l2704_c41_e13e_phase;
     lit_uxn_opcodes_h_l2704_c41_e13e_pc <= VAR_lit_uxn_opcodes_h_l2704_c41_e13e_pc;
     lit_uxn_opcodes_h_l2704_c41_e13e_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2704_c41_e13e_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2704_c41_e13e_return_output := lit_uxn_opcodes_h_l2704_c41_e13e_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c7_c492_return_output;
     VAR_lit2_uxn_opcodes_h_l2705_c41_4388_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2705_c1_99f4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_iftrue := VAR_lit_uxn_opcodes_h_l2704_c41_e13e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2707_c7_882c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2706_c1_a15a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_return_output;

     -- lit2[uxn_opcodes_h_l2705_c41_4388] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2705_c41_4388_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2705_c41_4388_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2705_c41_4388_phase <= VAR_lit2_uxn_opcodes_h_l2705_c41_4388_phase;
     lit2_uxn_opcodes_h_l2705_c41_4388_pc <= VAR_lit2_uxn_opcodes_h_l2705_c41_4388_pc;
     lit2_uxn_opcodes_h_l2705_c41_4388_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2705_c41_4388_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2705_c41_4388_return_output := lit2_uxn_opcodes_h_l2705_c41_4388_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c7_882c_return_output;
     VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2706_c1_a15a_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_iftrue := VAR_lit2_uxn_opcodes_h_l2705_c41_4388_return_output;
     -- lit[uxn_opcodes_h_l2706_c41_5f6f] LATENCY=0
     -- Clock enable
     lit_uxn_opcodes_h_l2706_c41_5f6f_CLOCK_ENABLE <= VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_CLOCK_ENABLE;
     -- Inputs
     lit_uxn_opcodes_h_l2706_c41_5f6f_phase <= VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_phase;
     lit_uxn_opcodes_h_l2706_c41_5f6f_pc <= VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_pc;
     lit_uxn_opcodes_h_l2706_c41_5f6f_previous_ram_read <= VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_previous_ram_read;
     -- Outputs
     VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_return_output := lit_uxn_opcodes_h_l2706_c41_5f6f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2708_c7_ce98] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2707_c1_e574] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output;
     VAR_lit2_uxn_opcodes_h_l2707_c41_270a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2707_c1_e574_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_iftrue := VAR_lit_uxn_opcodes_h_l2706_c41_5f6f_return_output;
     -- lit2[uxn_opcodes_h_l2707_c41_270a] LATENCY=0
     -- Clock enable
     lit2_uxn_opcodes_h_l2707_c41_270a_CLOCK_ENABLE <= VAR_lit2_uxn_opcodes_h_l2707_c41_270a_CLOCK_ENABLE;
     -- Inputs
     lit2_uxn_opcodes_h_l2707_c41_270a_phase <= VAR_lit2_uxn_opcodes_h_l2707_c41_270a_phase;
     lit2_uxn_opcodes_h_l2707_c41_270a_pc <= VAR_lit2_uxn_opcodes_h_l2707_c41_270a_pc;
     lit2_uxn_opcodes_h_l2707_c41_270a_previous_ram_read <= VAR_lit2_uxn_opcodes_h_l2707_c41_270a_previous_ram_read;
     -- Outputs
     VAR_lit2_uxn_opcodes_h_l2707_c41_270a_return_output := lit2_uxn_opcodes_h_l2707_c41_270a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2708_c1_70c0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c7_ee05] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output;
     VAR_inc_uxn_opcodes_h_l2708_c41_572f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2708_c1_70c0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_iftrue := VAR_lit2_uxn_opcodes_h_l2707_c41_270a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2709_c1_cd7f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_return_output;

     -- inc[uxn_opcodes_h_l2708_c41_572f] LATENCY=0
     -- Clock enable
     inc_uxn_opcodes_h_l2708_c41_572f_CLOCK_ENABLE <= VAR_inc_uxn_opcodes_h_l2708_c41_572f_CLOCK_ENABLE;
     -- Inputs
     inc_uxn_opcodes_h_l2708_c41_572f_phase <= VAR_inc_uxn_opcodes_h_l2708_c41_572f_phase;
     inc_uxn_opcodes_h_l2708_c41_572f_ins <= VAR_inc_uxn_opcodes_h_l2708_c41_572f_ins;
     inc_uxn_opcodes_h_l2708_c41_572f_previous_stack_read <= VAR_inc_uxn_opcodes_h_l2708_c41_572f_previous_stack_read;
     -- Outputs
     VAR_inc_uxn_opcodes_h_l2708_c41_572f_return_output := inc_uxn_opcodes_h_l2708_c41_572f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c7_a395] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c7_a395_return_output;
     VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2709_c1_cd7f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_iftrue := VAR_inc_uxn_opcodes_h_l2708_c41_572f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2710_c1_f5cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c7_b119] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_return_output;

     -- inc2[uxn_opcodes_h_l2709_c41_a57b] LATENCY=0
     -- Clock enable
     inc2_uxn_opcodes_h_l2709_c41_a57b_CLOCK_ENABLE <= VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_CLOCK_ENABLE;
     -- Inputs
     inc2_uxn_opcodes_h_l2709_c41_a57b_phase <= VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_phase;
     inc2_uxn_opcodes_h_l2709_c41_a57b_ins <= VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_ins;
     inc2_uxn_opcodes_h_l2709_c41_a57b_previous_stack_read <= VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_previous_stack_read;
     -- Outputs
     VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_return_output := inc2_uxn_opcodes_h_l2709_c41_a57b_return_output;

     -- Submodule level 15
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c7_b119_return_output;
     VAR_pop_uxn_opcodes_h_l2710_c41_b071_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2710_c1_f5cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_iftrue := VAR_inc2_uxn_opcodes_h_l2709_c41_a57b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2711_c1_8440] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c7_47c2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output;

     -- pop[uxn_opcodes_h_l2710_c41_b071] LATENCY=0
     -- Clock enable
     pop_uxn_opcodes_h_l2710_c41_b071_CLOCK_ENABLE <= VAR_pop_uxn_opcodes_h_l2710_c41_b071_CLOCK_ENABLE;
     -- Inputs
     pop_uxn_opcodes_h_l2710_c41_b071_phase <= VAR_pop_uxn_opcodes_h_l2710_c41_b071_phase;
     pop_uxn_opcodes_h_l2710_c41_b071_ins <= VAR_pop_uxn_opcodes_h_l2710_c41_b071_ins;
     -- Outputs
     VAR_pop_uxn_opcodes_h_l2710_c41_b071_return_output := pop_uxn_opcodes_h_l2710_c41_b071_return_output;

     -- Submodule level 16
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output;
     VAR_pop2_uxn_opcodes_h_l2711_c41_c35c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2711_c1_8440_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_iftrue := VAR_pop_uxn_opcodes_h_l2710_c41_b071_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2712_c1_a45f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c7_69ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output;

     -- pop2[uxn_opcodes_h_l2711_c41_c35c] LATENCY=0
     -- Clock enable
     pop2_uxn_opcodes_h_l2711_c41_c35c_CLOCK_ENABLE <= VAR_pop2_uxn_opcodes_h_l2711_c41_c35c_CLOCK_ENABLE;
     -- Inputs
     pop2_uxn_opcodes_h_l2711_c41_c35c_phase <= VAR_pop2_uxn_opcodes_h_l2711_c41_c35c_phase;
     pop2_uxn_opcodes_h_l2711_c41_c35c_ins <= VAR_pop2_uxn_opcodes_h_l2711_c41_c35c_ins;
     -- Outputs
     VAR_pop2_uxn_opcodes_h_l2711_c41_c35c_return_output := pop2_uxn_opcodes_h_l2711_c41_c35c_return_output;

     -- Submodule level 17
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output;
     VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2712_c1_a45f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_iftrue := VAR_pop2_uxn_opcodes_h_l2711_c41_c35c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c7_081e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2713_c1_14a5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_return_output;

     -- nip[uxn_opcodes_h_l2712_c41_7bf8] LATENCY=0
     -- Clock enable
     nip_uxn_opcodes_h_l2712_c41_7bf8_CLOCK_ENABLE <= VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_CLOCK_ENABLE;
     -- Inputs
     nip_uxn_opcodes_h_l2712_c41_7bf8_phase <= VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_phase;
     nip_uxn_opcodes_h_l2712_c41_7bf8_ins <= VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_ins;
     nip_uxn_opcodes_h_l2712_c41_7bf8_previous_stack_read <= VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_previous_stack_read;
     -- Outputs
     VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_return_output := nip_uxn_opcodes_h_l2712_c41_7bf8_return_output;

     -- Submodule level 18
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c7_081e_return_output;
     VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2713_c1_14a5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_iftrue := VAR_nip_uxn_opcodes_h_l2712_c41_7bf8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2714_c1_8c12] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c7_4b75] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output;

     -- nip2[uxn_opcodes_h_l2713_c41_7e7b] LATENCY=0
     -- Clock enable
     nip2_uxn_opcodes_h_l2713_c41_7e7b_CLOCK_ENABLE <= VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_CLOCK_ENABLE;
     -- Inputs
     nip2_uxn_opcodes_h_l2713_c41_7e7b_phase <= VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_phase;
     nip2_uxn_opcodes_h_l2713_c41_7e7b_ins <= VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_ins;
     nip2_uxn_opcodes_h_l2713_c41_7e7b_previous_stack_read <= VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_previous_stack_read;
     -- Outputs
     VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_return_output := nip2_uxn_opcodes_h_l2713_c41_7e7b_return_output;

     -- Submodule level 19
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output;
     VAR_swp_uxn_opcodes_h_l2714_c41_cf94_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2714_c1_8c12_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_iftrue := VAR_nip2_uxn_opcodes_h_l2713_c41_7e7b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c7_2dbb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output;

     -- swp[uxn_opcodes_h_l2714_c41_cf94] LATENCY=0
     -- Clock enable
     swp_uxn_opcodes_h_l2714_c41_cf94_CLOCK_ENABLE <= VAR_swp_uxn_opcodes_h_l2714_c41_cf94_CLOCK_ENABLE;
     -- Inputs
     swp_uxn_opcodes_h_l2714_c41_cf94_phase <= VAR_swp_uxn_opcodes_h_l2714_c41_cf94_phase;
     swp_uxn_opcodes_h_l2714_c41_cf94_ins <= VAR_swp_uxn_opcodes_h_l2714_c41_cf94_ins;
     swp_uxn_opcodes_h_l2714_c41_cf94_previous_stack_read <= VAR_swp_uxn_opcodes_h_l2714_c41_cf94_previous_stack_read;
     -- Outputs
     VAR_swp_uxn_opcodes_h_l2714_c41_cf94_return_output := swp_uxn_opcodes_h_l2714_c41_cf94_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2715_c1_d764] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_return_output;

     -- Submodule level 20
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output;
     VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2715_c1_d764_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_iftrue := VAR_swp_uxn_opcodes_h_l2714_c41_cf94_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2716_c1_a513] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c7_d1ca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output;

     -- swp2[uxn_opcodes_h_l2715_c41_81b0] LATENCY=0
     -- Clock enable
     swp2_uxn_opcodes_h_l2715_c41_81b0_CLOCK_ENABLE <= VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_CLOCK_ENABLE;
     -- Inputs
     swp2_uxn_opcodes_h_l2715_c41_81b0_phase <= VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_phase;
     swp2_uxn_opcodes_h_l2715_c41_81b0_ins <= VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_ins;
     swp2_uxn_opcodes_h_l2715_c41_81b0_previous_stack_read <= VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_previous_stack_read;
     -- Outputs
     VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_return_output := swp2_uxn_opcodes_h_l2715_c41_81b0_return_output;

     -- Submodule level 21
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output;
     VAR_rot_uxn_opcodes_h_l2716_c41_1f20_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2716_c1_a513_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_iftrue := VAR_swp2_uxn_opcodes_h_l2715_c41_81b0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2717_c1_3e79] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_return_output;

     -- rot[uxn_opcodes_h_l2716_c41_1f20] LATENCY=0
     -- Clock enable
     rot_uxn_opcodes_h_l2716_c41_1f20_CLOCK_ENABLE <= VAR_rot_uxn_opcodes_h_l2716_c41_1f20_CLOCK_ENABLE;
     -- Inputs
     rot_uxn_opcodes_h_l2716_c41_1f20_phase <= VAR_rot_uxn_opcodes_h_l2716_c41_1f20_phase;
     rot_uxn_opcodes_h_l2716_c41_1f20_ins <= VAR_rot_uxn_opcodes_h_l2716_c41_1f20_ins;
     rot_uxn_opcodes_h_l2716_c41_1f20_previous_stack_read <= VAR_rot_uxn_opcodes_h_l2716_c41_1f20_previous_stack_read;
     -- Outputs
     VAR_rot_uxn_opcodes_h_l2716_c41_1f20_return_output := rot_uxn_opcodes_h_l2716_c41_1f20_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c7_750b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_return_output;

     -- Submodule level 22
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c7_750b_return_output;
     VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2717_c1_3e79_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_iftrue := VAR_rot_uxn_opcodes_h_l2716_c41_1f20_return_output;
     -- rot2[uxn_opcodes_h_l2717_c41_9c3c] LATENCY=0
     -- Clock enable
     rot2_uxn_opcodes_h_l2717_c41_9c3c_CLOCK_ENABLE <= VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_CLOCK_ENABLE;
     -- Inputs
     rot2_uxn_opcodes_h_l2717_c41_9c3c_phase <= VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_phase;
     rot2_uxn_opcodes_h_l2717_c41_9c3c_ins <= VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_ins;
     rot2_uxn_opcodes_h_l2717_c41_9c3c_previous_stack_read <= VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_previous_stack_read;
     -- Outputs
     VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_return_output := rot2_uxn_opcodes_h_l2717_c41_9c3c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2718_c1_b866] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c7_b6a5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output;

     -- Submodule level 23
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output;
     VAR_dup_uxn_opcodes_h_l2718_c41_c17e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2718_c1_b866_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_iftrue := VAR_rot2_uxn_opcodes_h_l2717_c41_9c3c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c7_cf11] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2719_c1_a5e1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_return_output;

     -- dup[uxn_opcodes_h_l2718_c41_c17e] LATENCY=0
     -- Clock enable
     dup_uxn_opcodes_h_l2718_c41_c17e_CLOCK_ENABLE <= VAR_dup_uxn_opcodes_h_l2718_c41_c17e_CLOCK_ENABLE;
     -- Inputs
     dup_uxn_opcodes_h_l2718_c41_c17e_phase <= VAR_dup_uxn_opcodes_h_l2718_c41_c17e_phase;
     dup_uxn_opcodes_h_l2718_c41_c17e_ins <= VAR_dup_uxn_opcodes_h_l2718_c41_c17e_ins;
     dup_uxn_opcodes_h_l2718_c41_c17e_previous_stack_read <= VAR_dup_uxn_opcodes_h_l2718_c41_c17e_previous_stack_read;
     -- Outputs
     VAR_dup_uxn_opcodes_h_l2718_c41_c17e_return_output := dup_uxn_opcodes_h_l2718_c41_c17e_return_output;

     -- Submodule level 24
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output;
     VAR_dup2_uxn_opcodes_h_l2719_c41_0679_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2719_c1_a5e1_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_iftrue := VAR_dup_uxn_opcodes_h_l2718_c41_c17e_return_output;
     -- dup2[uxn_opcodes_h_l2719_c41_0679] LATENCY=0
     -- Clock enable
     dup2_uxn_opcodes_h_l2719_c41_0679_CLOCK_ENABLE <= VAR_dup2_uxn_opcodes_h_l2719_c41_0679_CLOCK_ENABLE;
     -- Inputs
     dup2_uxn_opcodes_h_l2719_c41_0679_phase <= VAR_dup2_uxn_opcodes_h_l2719_c41_0679_phase;
     dup2_uxn_opcodes_h_l2719_c41_0679_ins <= VAR_dup2_uxn_opcodes_h_l2719_c41_0679_ins;
     dup2_uxn_opcodes_h_l2719_c41_0679_previous_stack_read <= VAR_dup2_uxn_opcodes_h_l2719_c41_0679_previous_stack_read;
     -- Outputs
     VAR_dup2_uxn_opcodes_h_l2719_c41_0679_return_output := dup2_uxn_opcodes_h_l2719_c41_0679_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2720_c1_6966] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c7_25f4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output;

     -- Submodule level 25
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output;
     VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2720_c1_6966_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_iftrue := VAR_dup2_uxn_opcodes_h_l2719_c41_0679_return_output;
     -- ovr[uxn_opcodes_h_l2720_c41_04a0] LATENCY=0
     -- Clock enable
     ovr_uxn_opcodes_h_l2720_c41_04a0_CLOCK_ENABLE <= VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_CLOCK_ENABLE;
     -- Inputs
     ovr_uxn_opcodes_h_l2720_c41_04a0_phase <= VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_phase;
     ovr_uxn_opcodes_h_l2720_c41_04a0_ins <= VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_ins;
     ovr_uxn_opcodes_h_l2720_c41_04a0_previous_stack_read <= VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_previous_stack_read;
     -- Outputs
     VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_return_output := ovr_uxn_opcodes_h_l2720_c41_04a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2721_c1_7482] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c7_51db] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_return_output;

     -- Submodule level 26
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c7_51db_return_output;
     VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2721_c1_7482_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_iftrue := VAR_ovr_uxn_opcodes_h_l2720_c41_04a0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2722_c1_b44b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_return_output;

     -- ovr2[uxn_opcodes_h_l2721_c41_3590] LATENCY=0
     -- Clock enable
     ovr2_uxn_opcodes_h_l2721_c41_3590_CLOCK_ENABLE <= VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_CLOCK_ENABLE;
     -- Inputs
     ovr2_uxn_opcodes_h_l2721_c41_3590_phase <= VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_phase;
     ovr2_uxn_opcodes_h_l2721_c41_3590_ins <= VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_ins;
     ovr2_uxn_opcodes_h_l2721_c41_3590_previous_stack_read <= VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_previous_stack_read;
     -- Outputs
     VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_return_output := ovr2_uxn_opcodes_h_l2721_c41_3590_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c7_462e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_return_output;

     -- Submodule level 27
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c7_462e_return_output;
     VAR_equ_uxn_opcodes_h_l2722_c41_c13c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2722_c1_b44b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_iftrue := VAR_ovr2_uxn_opcodes_h_l2721_c41_3590_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2723_c1_4573] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c7_5a41] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output;

     -- equ[uxn_opcodes_h_l2722_c41_c13c] LATENCY=0
     -- Clock enable
     equ_uxn_opcodes_h_l2722_c41_c13c_CLOCK_ENABLE <= VAR_equ_uxn_opcodes_h_l2722_c41_c13c_CLOCK_ENABLE;
     -- Inputs
     equ_uxn_opcodes_h_l2722_c41_c13c_phase <= VAR_equ_uxn_opcodes_h_l2722_c41_c13c_phase;
     equ_uxn_opcodes_h_l2722_c41_c13c_ins <= VAR_equ_uxn_opcodes_h_l2722_c41_c13c_ins;
     equ_uxn_opcodes_h_l2722_c41_c13c_previous_stack_read <= VAR_equ_uxn_opcodes_h_l2722_c41_c13c_previous_stack_read;
     -- Outputs
     VAR_equ_uxn_opcodes_h_l2722_c41_c13c_return_output := equ_uxn_opcodes_h_l2722_c41_c13c_return_output;

     -- Submodule level 28
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output;
     VAR_equ2_uxn_opcodes_h_l2723_c41_7338_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2723_c1_4573_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_iftrue := VAR_equ_uxn_opcodes_h_l2722_c41_c13c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c7_3d5f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2724_c1_122c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_return_output;

     -- equ2[uxn_opcodes_h_l2723_c41_7338] LATENCY=0
     -- Clock enable
     equ2_uxn_opcodes_h_l2723_c41_7338_CLOCK_ENABLE <= VAR_equ2_uxn_opcodes_h_l2723_c41_7338_CLOCK_ENABLE;
     -- Inputs
     equ2_uxn_opcodes_h_l2723_c41_7338_phase <= VAR_equ2_uxn_opcodes_h_l2723_c41_7338_phase;
     equ2_uxn_opcodes_h_l2723_c41_7338_ins <= VAR_equ2_uxn_opcodes_h_l2723_c41_7338_ins;
     equ2_uxn_opcodes_h_l2723_c41_7338_previous_stack_read <= VAR_equ2_uxn_opcodes_h_l2723_c41_7338_previous_stack_read;
     -- Outputs
     VAR_equ2_uxn_opcodes_h_l2723_c41_7338_return_output := equ2_uxn_opcodes_h_l2723_c41_7338_return_output;

     -- Submodule level 29
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output;
     VAR_neq_uxn_opcodes_h_l2724_c41_2133_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2724_c1_122c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_iftrue := VAR_equ2_uxn_opcodes_h_l2723_c41_7338_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c7_f734] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_return_output;

     -- neq[uxn_opcodes_h_l2724_c41_2133] LATENCY=0
     -- Clock enable
     neq_uxn_opcodes_h_l2724_c41_2133_CLOCK_ENABLE <= VAR_neq_uxn_opcodes_h_l2724_c41_2133_CLOCK_ENABLE;
     -- Inputs
     neq_uxn_opcodes_h_l2724_c41_2133_phase <= VAR_neq_uxn_opcodes_h_l2724_c41_2133_phase;
     neq_uxn_opcodes_h_l2724_c41_2133_ins <= VAR_neq_uxn_opcodes_h_l2724_c41_2133_ins;
     neq_uxn_opcodes_h_l2724_c41_2133_previous_stack_read <= VAR_neq_uxn_opcodes_h_l2724_c41_2133_previous_stack_read;
     -- Outputs
     VAR_neq_uxn_opcodes_h_l2724_c41_2133_return_output := neq_uxn_opcodes_h_l2724_c41_2133_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2725_c1_d337] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_return_output;

     -- Submodule level 30
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c7_f734_return_output;
     VAR_neq2_uxn_opcodes_h_l2725_c41_9230_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2725_c1_d337_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_iftrue := VAR_neq_uxn_opcodes_h_l2724_c41_2133_return_output;
     -- neq2[uxn_opcodes_h_l2725_c41_9230] LATENCY=0
     -- Clock enable
     neq2_uxn_opcodes_h_l2725_c41_9230_CLOCK_ENABLE <= VAR_neq2_uxn_opcodes_h_l2725_c41_9230_CLOCK_ENABLE;
     -- Inputs
     neq2_uxn_opcodes_h_l2725_c41_9230_phase <= VAR_neq2_uxn_opcodes_h_l2725_c41_9230_phase;
     neq2_uxn_opcodes_h_l2725_c41_9230_ins <= VAR_neq2_uxn_opcodes_h_l2725_c41_9230_ins;
     neq2_uxn_opcodes_h_l2725_c41_9230_previous_stack_read <= VAR_neq2_uxn_opcodes_h_l2725_c41_9230_previous_stack_read;
     -- Outputs
     VAR_neq2_uxn_opcodes_h_l2725_c41_9230_return_output := neq2_uxn_opcodes_h_l2725_c41_9230_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2726_c1_bac8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c7_fe68] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output;

     -- Submodule level 31
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output;
     VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2726_c1_bac8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_iftrue := VAR_neq2_uxn_opcodes_h_l2725_c41_9230_return_output;
     -- gth[uxn_opcodes_h_l2726_c41_a7a0] LATENCY=0
     -- Clock enable
     gth_uxn_opcodes_h_l2726_c41_a7a0_CLOCK_ENABLE <= VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_CLOCK_ENABLE;
     -- Inputs
     gth_uxn_opcodes_h_l2726_c41_a7a0_phase <= VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_phase;
     gth_uxn_opcodes_h_l2726_c41_a7a0_ins <= VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_ins;
     gth_uxn_opcodes_h_l2726_c41_a7a0_previous_stack_read <= VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_previous_stack_read;
     -- Outputs
     VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_return_output := gth_uxn_opcodes_h_l2726_c41_a7a0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2727_c1_f89c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c7_ac0b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output;

     -- Submodule level 32
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output;
     VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2727_c1_f89c_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_iftrue := VAR_gth_uxn_opcodes_h_l2726_c41_a7a0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c7_e883] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_return_output;

     -- gth2[uxn_opcodes_h_l2727_c41_48b0] LATENCY=0
     -- Clock enable
     gth2_uxn_opcodes_h_l2727_c41_48b0_CLOCK_ENABLE <= VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_CLOCK_ENABLE;
     -- Inputs
     gth2_uxn_opcodes_h_l2727_c41_48b0_phase <= VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_phase;
     gth2_uxn_opcodes_h_l2727_c41_48b0_ins <= VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_ins;
     gth2_uxn_opcodes_h_l2727_c41_48b0_previous_stack_read <= VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_previous_stack_read;
     -- Outputs
     VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_return_output := gth2_uxn_opcodes_h_l2727_c41_48b0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2728_c1_98fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_return_output;

     -- Submodule level 33
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c7_e883_return_output;
     VAR_lth_uxn_opcodes_h_l2728_c41_577e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2728_c1_98fb_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_iftrue := VAR_gth2_uxn_opcodes_h_l2727_c41_48b0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2729_c1_c7e5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_return_output;

     -- lth[uxn_opcodes_h_l2728_c41_577e] LATENCY=0
     -- Clock enable
     lth_uxn_opcodes_h_l2728_c41_577e_CLOCK_ENABLE <= VAR_lth_uxn_opcodes_h_l2728_c41_577e_CLOCK_ENABLE;
     -- Inputs
     lth_uxn_opcodes_h_l2728_c41_577e_phase <= VAR_lth_uxn_opcodes_h_l2728_c41_577e_phase;
     lth_uxn_opcodes_h_l2728_c41_577e_ins <= VAR_lth_uxn_opcodes_h_l2728_c41_577e_ins;
     lth_uxn_opcodes_h_l2728_c41_577e_previous_stack_read <= VAR_lth_uxn_opcodes_h_l2728_c41_577e_previous_stack_read;
     -- Outputs
     VAR_lth_uxn_opcodes_h_l2728_c41_577e_return_output := lth_uxn_opcodes_h_l2728_c41_577e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c7_0b76] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output;

     -- Submodule level 34
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output;
     VAR_lth2_uxn_opcodes_h_l2729_c41_f078_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2729_c1_c7e5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_iftrue := VAR_lth_uxn_opcodes_h_l2728_c41_577e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c7_efc3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output;

     -- lth2[uxn_opcodes_h_l2729_c41_f078] LATENCY=0
     -- Clock enable
     lth2_uxn_opcodes_h_l2729_c41_f078_CLOCK_ENABLE <= VAR_lth2_uxn_opcodes_h_l2729_c41_f078_CLOCK_ENABLE;
     -- Inputs
     lth2_uxn_opcodes_h_l2729_c41_f078_phase <= VAR_lth2_uxn_opcodes_h_l2729_c41_f078_phase;
     lth2_uxn_opcodes_h_l2729_c41_f078_ins <= VAR_lth2_uxn_opcodes_h_l2729_c41_f078_ins;
     lth2_uxn_opcodes_h_l2729_c41_f078_previous_stack_read <= VAR_lth2_uxn_opcodes_h_l2729_c41_f078_previous_stack_read;
     -- Outputs
     VAR_lth2_uxn_opcodes_h_l2729_c41_f078_return_output := lth2_uxn_opcodes_h_l2729_c41_f078_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2730_c1_3e88] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_return_output;

     -- Submodule level 35
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output;
     VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2730_c1_3e88_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_iftrue := VAR_lth2_uxn_opcodes_h_l2729_c41_f078_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c7_9416] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2731_c1_dab5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_return_output;

     -- jmp[uxn_opcodes_h_l2730_c41_a2ac] LATENCY=0
     -- Clock enable
     jmp_uxn_opcodes_h_l2730_c41_a2ac_CLOCK_ENABLE <= VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_CLOCK_ENABLE;
     -- Inputs
     jmp_uxn_opcodes_h_l2730_c41_a2ac_phase <= VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_phase;
     jmp_uxn_opcodes_h_l2730_c41_a2ac_ins <= VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_ins;
     jmp_uxn_opcodes_h_l2730_c41_a2ac_pc <= VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_pc;
     jmp_uxn_opcodes_h_l2730_c41_a2ac_previous_stack_read <= VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_previous_stack_read;
     -- Outputs
     VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_return_output := jmp_uxn_opcodes_h_l2730_c41_a2ac_return_output;

     -- Submodule level 36
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c7_9416_return_output;
     VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2731_c1_dab5_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_iftrue := VAR_jmp_uxn_opcodes_h_l2730_c41_a2ac_return_output;
     -- jmp2[uxn_opcodes_h_l2731_c41_5859] LATENCY=0
     -- Clock enable
     jmp2_uxn_opcodes_h_l2731_c41_5859_CLOCK_ENABLE <= VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_CLOCK_ENABLE;
     -- Inputs
     jmp2_uxn_opcodes_h_l2731_c41_5859_phase <= VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_phase;
     jmp2_uxn_opcodes_h_l2731_c41_5859_ins <= VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_ins;
     jmp2_uxn_opcodes_h_l2731_c41_5859_previous_stack_read <= VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_previous_stack_read;
     -- Outputs
     VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_return_output := jmp2_uxn_opcodes_h_l2731_c41_5859_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2732_c1_f6a0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c7_07ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output;

     -- Submodule level 37
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output;
     VAR_jcn_uxn_opcodes_h_l2732_c41_d896_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2732_c1_f6a0_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_iftrue := VAR_jmp2_uxn_opcodes_h_l2731_c41_5859_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2733_c1_f077] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c7_c7e4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output;

     -- jcn[uxn_opcodes_h_l2732_c41_d896] LATENCY=0
     -- Clock enable
     jcn_uxn_opcodes_h_l2732_c41_d896_CLOCK_ENABLE <= VAR_jcn_uxn_opcodes_h_l2732_c41_d896_CLOCK_ENABLE;
     -- Inputs
     jcn_uxn_opcodes_h_l2732_c41_d896_phase <= VAR_jcn_uxn_opcodes_h_l2732_c41_d896_phase;
     jcn_uxn_opcodes_h_l2732_c41_d896_ins <= VAR_jcn_uxn_opcodes_h_l2732_c41_d896_ins;
     jcn_uxn_opcodes_h_l2732_c41_d896_pc <= VAR_jcn_uxn_opcodes_h_l2732_c41_d896_pc;
     jcn_uxn_opcodes_h_l2732_c41_d896_previous_stack_read <= VAR_jcn_uxn_opcodes_h_l2732_c41_d896_previous_stack_read;
     -- Outputs
     VAR_jcn_uxn_opcodes_h_l2732_c41_d896_return_output := jcn_uxn_opcodes_h_l2732_c41_d896_return_output;

     -- Submodule level 38
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output;
     VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2733_c1_f077_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_iftrue := VAR_jcn_uxn_opcodes_h_l2732_c41_d896_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c7_2d28] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output;

     -- jcn2[uxn_opcodes_h_l2733_c41_a3e0] LATENCY=0
     -- Clock enable
     jcn2_uxn_opcodes_h_l2733_c41_a3e0_CLOCK_ENABLE <= VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_CLOCK_ENABLE;
     -- Inputs
     jcn2_uxn_opcodes_h_l2733_c41_a3e0_phase <= VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_phase;
     jcn2_uxn_opcodes_h_l2733_c41_a3e0_ins <= VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_ins;
     jcn2_uxn_opcodes_h_l2733_c41_a3e0_previous_stack_read <= VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_previous_stack_read;
     -- Outputs
     VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_return_output := jcn2_uxn_opcodes_h_l2733_c41_a3e0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2734_c1_b811] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_return_output;

     -- Submodule level 39
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output;
     VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2734_c1_b811_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_iftrue := VAR_jcn2_uxn_opcodes_h_l2733_c41_a3e0_return_output;
     -- jsr[uxn_opcodes_h_l2734_c41_65a0] LATENCY=0
     -- Clock enable
     jsr_uxn_opcodes_h_l2734_c41_65a0_CLOCK_ENABLE <= VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_CLOCK_ENABLE;
     -- Inputs
     jsr_uxn_opcodes_h_l2734_c41_65a0_phase <= VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_phase;
     jsr_uxn_opcodes_h_l2734_c41_65a0_ins <= VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_ins;
     jsr_uxn_opcodes_h_l2734_c41_65a0_pc <= VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_pc;
     jsr_uxn_opcodes_h_l2734_c41_65a0_previous_stack_read <= VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_previous_stack_read;
     -- Outputs
     VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_return_output := jsr_uxn_opcodes_h_l2734_c41_65a0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c7_fd1b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2735_c1_81ac] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_return_output;

     -- Submodule level 40
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output;
     VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2735_c1_81ac_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_iftrue := VAR_jsr_uxn_opcodes_h_l2734_c41_65a0_return_output;
     -- jsr2[uxn_opcodes_h_l2735_c41_2859] LATENCY=0
     -- Clock enable
     jsr2_uxn_opcodes_h_l2735_c41_2859_CLOCK_ENABLE <= VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_CLOCK_ENABLE;
     -- Inputs
     jsr2_uxn_opcodes_h_l2735_c41_2859_phase <= VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_phase;
     jsr2_uxn_opcodes_h_l2735_c41_2859_ins <= VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_ins;
     jsr2_uxn_opcodes_h_l2735_c41_2859_pc <= VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_pc;
     jsr2_uxn_opcodes_h_l2735_c41_2859_previous_stack_read <= VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_previous_stack_read;
     -- Outputs
     VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_return_output := jsr2_uxn_opcodes_h_l2735_c41_2859_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2736_c1_4087] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c7_c7d4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output;

     -- Submodule level 41
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output;
     VAR_sth_uxn_opcodes_h_l2736_c41_fde0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2736_c1_4087_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_iftrue := VAR_jsr2_uxn_opcodes_h_l2735_c41_2859_return_output;
     -- sth[uxn_opcodes_h_l2736_c41_fde0] LATENCY=0
     -- Clock enable
     sth_uxn_opcodes_h_l2736_c41_fde0_CLOCK_ENABLE <= VAR_sth_uxn_opcodes_h_l2736_c41_fde0_CLOCK_ENABLE;
     -- Inputs
     sth_uxn_opcodes_h_l2736_c41_fde0_phase <= VAR_sth_uxn_opcodes_h_l2736_c41_fde0_phase;
     sth_uxn_opcodes_h_l2736_c41_fde0_ins <= VAR_sth_uxn_opcodes_h_l2736_c41_fde0_ins;
     sth_uxn_opcodes_h_l2736_c41_fde0_previous_stack_read <= VAR_sth_uxn_opcodes_h_l2736_c41_fde0_previous_stack_read;
     -- Outputs
     VAR_sth_uxn_opcodes_h_l2736_c41_fde0_return_output := sth_uxn_opcodes_h_l2736_c41_fde0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c7_6ed5] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2737_c1_7c96] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_return_output;

     -- Submodule level 42
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output;
     VAR_sth2_uxn_opcodes_h_l2737_c41_432c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2737_c1_7c96_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_iftrue := VAR_sth_uxn_opcodes_h_l2736_c41_fde0_return_output;
     -- sth2[uxn_opcodes_h_l2737_c41_432c] LATENCY=0
     -- Clock enable
     sth2_uxn_opcodes_h_l2737_c41_432c_CLOCK_ENABLE <= VAR_sth2_uxn_opcodes_h_l2737_c41_432c_CLOCK_ENABLE;
     -- Inputs
     sth2_uxn_opcodes_h_l2737_c41_432c_phase <= VAR_sth2_uxn_opcodes_h_l2737_c41_432c_phase;
     sth2_uxn_opcodes_h_l2737_c41_432c_ins <= VAR_sth2_uxn_opcodes_h_l2737_c41_432c_ins;
     sth2_uxn_opcodes_h_l2737_c41_432c_previous_stack_read <= VAR_sth2_uxn_opcodes_h_l2737_c41_432c_previous_stack_read;
     -- Outputs
     VAR_sth2_uxn_opcodes_h_l2737_c41_432c_return_output := sth2_uxn_opcodes_h_l2737_c41_432c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c7_7bf4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2738_c1_1d6e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_return_output;

     -- Submodule level 43
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output;
     VAR_ldz_uxn_opcodes_h_l2738_c41_2192_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2738_c1_1d6e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_iftrue := VAR_sth2_uxn_opcodes_h_l2737_c41_432c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c7_8b6c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2739_c1_0334] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_return_output;

     -- ldz[uxn_opcodes_h_l2738_c41_2192] LATENCY=0
     -- Clock enable
     ldz_uxn_opcodes_h_l2738_c41_2192_CLOCK_ENABLE <= VAR_ldz_uxn_opcodes_h_l2738_c41_2192_CLOCK_ENABLE;
     -- Inputs
     ldz_uxn_opcodes_h_l2738_c41_2192_phase <= VAR_ldz_uxn_opcodes_h_l2738_c41_2192_phase;
     ldz_uxn_opcodes_h_l2738_c41_2192_ins <= VAR_ldz_uxn_opcodes_h_l2738_c41_2192_ins;
     ldz_uxn_opcodes_h_l2738_c41_2192_previous_stack_read <= VAR_ldz_uxn_opcodes_h_l2738_c41_2192_previous_stack_read;
     ldz_uxn_opcodes_h_l2738_c41_2192_previous_ram_read <= VAR_ldz_uxn_opcodes_h_l2738_c41_2192_previous_ram_read;
     -- Outputs
     VAR_ldz_uxn_opcodes_h_l2738_c41_2192_return_output := ldz_uxn_opcodes_h_l2738_c41_2192_return_output;

     -- Submodule level 44
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output;
     VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2739_c1_0334_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_iftrue := VAR_ldz_uxn_opcodes_h_l2738_c41_2192_return_output;
     -- ldz2[uxn_opcodes_h_l2739_c41_de57] LATENCY=0
     -- Clock enable
     ldz2_uxn_opcodes_h_l2739_c41_de57_CLOCK_ENABLE <= VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_CLOCK_ENABLE;
     -- Inputs
     ldz2_uxn_opcodes_h_l2739_c41_de57_phase <= VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_phase;
     ldz2_uxn_opcodes_h_l2739_c41_de57_ins <= VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_ins;
     ldz2_uxn_opcodes_h_l2739_c41_de57_previous_stack_read <= VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_previous_stack_read;
     ldz2_uxn_opcodes_h_l2739_c41_de57_previous_ram_read <= VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_previous_ram_read;
     -- Outputs
     VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_return_output := ldz2_uxn_opcodes_h_l2739_c41_de57_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c7_dabb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2740_c1_781e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_return_output;

     -- Submodule level 45
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output;
     VAR_stz_uxn_opcodes_h_l2740_c41_7810_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2740_c1_781e_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_iftrue := VAR_ldz2_uxn_opcodes_h_l2739_c41_de57_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2741_c1_5b23] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c7_6ebc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output;

     -- stz[uxn_opcodes_h_l2740_c41_7810] LATENCY=0
     -- Clock enable
     stz_uxn_opcodes_h_l2740_c41_7810_CLOCK_ENABLE <= VAR_stz_uxn_opcodes_h_l2740_c41_7810_CLOCK_ENABLE;
     -- Inputs
     stz_uxn_opcodes_h_l2740_c41_7810_phase <= VAR_stz_uxn_opcodes_h_l2740_c41_7810_phase;
     stz_uxn_opcodes_h_l2740_c41_7810_ins <= VAR_stz_uxn_opcodes_h_l2740_c41_7810_ins;
     stz_uxn_opcodes_h_l2740_c41_7810_previous_stack_read <= VAR_stz_uxn_opcodes_h_l2740_c41_7810_previous_stack_read;
     -- Outputs
     VAR_stz_uxn_opcodes_h_l2740_c41_7810_return_output := stz_uxn_opcodes_h_l2740_c41_7810_return_output;

     -- Submodule level 46
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output;
     VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2741_c1_5b23_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_iftrue := VAR_stz_uxn_opcodes_h_l2740_c41_7810_return_output;
     -- stz2[uxn_opcodes_h_l2741_c41_cbc2] LATENCY=0
     -- Clock enable
     stz2_uxn_opcodes_h_l2741_c41_cbc2_CLOCK_ENABLE <= VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_CLOCK_ENABLE;
     -- Inputs
     stz2_uxn_opcodes_h_l2741_c41_cbc2_phase <= VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_phase;
     stz2_uxn_opcodes_h_l2741_c41_cbc2_ins <= VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_ins;
     stz2_uxn_opcodes_h_l2741_c41_cbc2_previous_stack_read <= VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_previous_stack_read;
     -- Outputs
     VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_return_output := stz2_uxn_opcodes_h_l2741_c41_cbc2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c7_63d8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2742_c1_b691] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_return_output;

     -- Submodule level 47
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output;
     VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2742_c1_b691_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_iftrue := VAR_stz2_uxn_opcodes_h_l2741_c41_cbc2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c7_4b17] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output;

     -- ldr[uxn_opcodes_h_l2742_c41_f07b] LATENCY=0
     -- Clock enable
     ldr_uxn_opcodes_h_l2742_c41_f07b_CLOCK_ENABLE <= VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_CLOCK_ENABLE;
     -- Inputs
     ldr_uxn_opcodes_h_l2742_c41_f07b_phase <= VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_phase;
     ldr_uxn_opcodes_h_l2742_c41_f07b_ins <= VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_ins;
     ldr_uxn_opcodes_h_l2742_c41_f07b_pc <= VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_pc;
     ldr_uxn_opcodes_h_l2742_c41_f07b_previous_stack_read <= VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_previous_stack_read;
     ldr_uxn_opcodes_h_l2742_c41_f07b_previous_ram_read <= VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_previous_ram_read;
     -- Outputs
     VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_return_output := ldr_uxn_opcodes_h_l2742_c41_f07b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2743_c1_54e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_return_output;

     -- Submodule level 48
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output;
     VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2743_c1_54e8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_iftrue := VAR_ldr_uxn_opcodes_h_l2742_c41_f07b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c7_04c0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2744_c1_e70d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_return_output;

     -- ldr2[uxn_opcodes_h_l2743_c41_0c58] LATENCY=0
     -- Clock enable
     ldr2_uxn_opcodes_h_l2743_c41_0c58_CLOCK_ENABLE <= VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_CLOCK_ENABLE;
     -- Inputs
     ldr2_uxn_opcodes_h_l2743_c41_0c58_phase <= VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_phase;
     ldr2_uxn_opcodes_h_l2743_c41_0c58_ins <= VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_ins;
     ldr2_uxn_opcodes_h_l2743_c41_0c58_pc <= VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_pc;
     ldr2_uxn_opcodes_h_l2743_c41_0c58_previous_stack_read <= VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_previous_stack_read;
     ldr2_uxn_opcodes_h_l2743_c41_0c58_previous_ram_read <= VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_previous_ram_read;
     -- Outputs
     VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_return_output := ldr2_uxn_opcodes_h_l2743_c41_0c58_return_output;

     -- Submodule level 49
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output;
     VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2744_c1_e70d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_iftrue := VAR_ldr2_uxn_opcodes_h_l2743_c41_0c58_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c7_7272] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_return_output;

     -- str1[uxn_opcodes_h_l2744_c41_3dfb] LATENCY=0
     -- Clock enable
     str1_uxn_opcodes_h_l2744_c41_3dfb_CLOCK_ENABLE <= VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_CLOCK_ENABLE;
     -- Inputs
     str1_uxn_opcodes_h_l2744_c41_3dfb_phase <= VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_phase;
     str1_uxn_opcodes_h_l2744_c41_3dfb_ins <= VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_ins;
     str1_uxn_opcodes_h_l2744_c41_3dfb_pc <= VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_pc;
     str1_uxn_opcodes_h_l2744_c41_3dfb_previous_stack_read <= VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_previous_stack_read;
     -- Outputs
     VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_return_output := str1_uxn_opcodes_h_l2744_c41_3dfb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2745_c1_b0c6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_return_output;

     -- Submodule level 50
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c7_7272_return_output;
     VAR_str2_uxn_opcodes_h_l2745_c41_c88a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2745_c1_b0c6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_iftrue := VAR_str1_uxn_opcodes_h_l2744_c41_3dfb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c7_6ca7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2746_c1_bef4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_return_output;

     -- str2[uxn_opcodes_h_l2745_c41_c88a] LATENCY=0
     -- Clock enable
     str2_uxn_opcodes_h_l2745_c41_c88a_CLOCK_ENABLE <= VAR_str2_uxn_opcodes_h_l2745_c41_c88a_CLOCK_ENABLE;
     -- Inputs
     str2_uxn_opcodes_h_l2745_c41_c88a_phase <= VAR_str2_uxn_opcodes_h_l2745_c41_c88a_phase;
     str2_uxn_opcodes_h_l2745_c41_c88a_ins <= VAR_str2_uxn_opcodes_h_l2745_c41_c88a_ins;
     str2_uxn_opcodes_h_l2745_c41_c88a_pc <= VAR_str2_uxn_opcodes_h_l2745_c41_c88a_pc;
     str2_uxn_opcodes_h_l2745_c41_c88a_previous_stack_read <= VAR_str2_uxn_opcodes_h_l2745_c41_c88a_previous_stack_read;
     -- Outputs
     VAR_str2_uxn_opcodes_h_l2745_c41_c88a_return_output := str2_uxn_opcodes_h_l2745_c41_c88a_return_output;

     -- Submodule level 51
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output;
     VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2746_c1_bef4_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_iftrue := VAR_str2_uxn_opcodes_h_l2745_c41_c88a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c7_9ffc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2747_c1_09aa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_return_output;

     -- lda[uxn_opcodes_h_l2746_c41_3e4d] LATENCY=0
     -- Clock enable
     lda_uxn_opcodes_h_l2746_c41_3e4d_CLOCK_ENABLE <= VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_CLOCK_ENABLE;
     -- Inputs
     lda_uxn_opcodes_h_l2746_c41_3e4d_phase <= VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_phase;
     lda_uxn_opcodes_h_l2746_c41_3e4d_ins <= VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_ins;
     lda_uxn_opcodes_h_l2746_c41_3e4d_previous_stack_read <= VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_previous_stack_read;
     lda_uxn_opcodes_h_l2746_c41_3e4d_previous_ram_read <= VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_previous_ram_read;
     -- Outputs
     VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_return_output := lda_uxn_opcodes_h_l2746_c41_3e4d_return_output;

     -- Submodule level 52
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output;
     VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2747_c1_09aa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_iftrue := VAR_lda_uxn_opcodes_h_l2746_c41_3e4d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c7_c378] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2748_c1_ec30] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_return_output;

     -- lda2[uxn_opcodes_h_l2747_c41_63f8] LATENCY=0
     -- Clock enable
     lda2_uxn_opcodes_h_l2747_c41_63f8_CLOCK_ENABLE <= VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_CLOCK_ENABLE;
     -- Inputs
     lda2_uxn_opcodes_h_l2747_c41_63f8_phase <= VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_phase;
     lda2_uxn_opcodes_h_l2747_c41_63f8_ins <= VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_ins;
     lda2_uxn_opcodes_h_l2747_c41_63f8_previous_stack_read <= VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_previous_stack_read;
     lda2_uxn_opcodes_h_l2747_c41_63f8_previous_ram_read <= VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_previous_ram_read;
     -- Outputs
     VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_return_output := lda2_uxn_opcodes_h_l2747_c41_63f8_return_output;

     -- Submodule level 53
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c7_c378_return_output;
     VAR_sta_uxn_opcodes_h_l2748_c41_4167_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2748_c1_ec30_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_iftrue := VAR_lda2_uxn_opcodes_h_l2747_c41_63f8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c7_594a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_return_output;

     -- sta[uxn_opcodes_h_l2748_c41_4167] LATENCY=0
     -- Clock enable
     sta_uxn_opcodes_h_l2748_c41_4167_CLOCK_ENABLE <= VAR_sta_uxn_opcodes_h_l2748_c41_4167_CLOCK_ENABLE;
     -- Inputs
     sta_uxn_opcodes_h_l2748_c41_4167_phase <= VAR_sta_uxn_opcodes_h_l2748_c41_4167_phase;
     sta_uxn_opcodes_h_l2748_c41_4167_ins <= VAR_sta_uxn_opcodes_h_l2748_c41_4167_ins;
     sta_uxn_opcodes_h_l2748_c41_4167_previous_stack_read <= VAR_sta_uxn_opcodes_h_l2748_c41_4167_previous_stack_read;
     -- Outputs
     VAR_sta_uxn_opcodes_h_l2748_c41_4167_return_output := sta_uxn_opcodes_h_l2748_c41_4167_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2749_c1_5c18] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_return_output;

     -- Submodule level 54
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c7_594a_return_output;
     VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2749_c1_5c18_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_iftrue := VAR_sta_uxn_opcodes_h_l2748_c41_4167_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c7_3918] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2750_c1_f952] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_return_output;

     -- sta2[uxn_opcodes_h_l2749_c41_4fa0] LATENCY=0
     -- Clock enable
     sta2_uxn_opcodes_h_l2749_c41_4fa0_CLOCK_ENABLE <= VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_CLOCK_ENABLE;
     -- Inputs
     sta2_uxn_opcodes_h_l2749_c41_4fa0_phase <= VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_phase;
     sta2_uxn_opcodes_h_l2749_c41_4fa0_ins <= VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_ins;
     sta2_uxn_opcodes_h_l2749_c41_4fa0_previous_stack_read <= VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_previous_stack_read;
     -- Outputs
     VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_return_output := sta2_uxn_opcodes_h_l2749_c41_4fa0_return_output;

     -- Submodule level 55
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c7_3918_return_output;
     VAR_dei_uxn_opcodes_h_l2750_c41_574b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2750_c1_f952_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_iftrue := VAR_sta2_uxn_opcodes_h_l2749_c41_4fa0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2751_c1_8584] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c7_8ae0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output;

     -- dei[uxn_opcodes_h_l2750_c41_574b] LATENCY=0
     -- Clock enable
     dei_uxn_opcodes_h_l2750_c41_574b_CLOCK_ENABLE <= VAR_dei_uxn_opcodes_h_l2750_c41_574b_CLOCK_ENABLE;
     -- Inputs
     dei_uxn_opcodes_h_l2750_c41_574b_phase <= VAR_dei_uxn_opcodes_h_l2750_c41_574b_phase;
     dei_uxn_opcodes_h_l2750_c41_574b_ins <= VAR_dei_uxn_opcodes_h_l2750_c41_574b_ins;
     dei_uxn_opcodes_h_l2750_c41_574b_previous_stack_read <= VAR_dei_uxn_opcodes_h_l2750_c41_574b_previous_stack_read;
     dei_uxn_opcodes_h_l2750_c41_574b_previous_device_ram_read <= VAR_dei_uxn_opcodes_h_l2750_c41_574b_previous_device_ram_read;
     -- Outputs
     VAR_dei_uxn_opcodes_h_l2750_c41_574b_return_output := dei_uxn_opcodes_h_l2750_c41_574b_return_output;

     -- Submodule level 56
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output;
     VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2751_c1_8584_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_iftrue := VAR_dei_uxn_opcodes_h_l2750_c41_574b_return_output;
     -- dei2[uxn_opcodes_h_l2751_c41_9acd] LATENCY=0
     -- Clock enable
     dei2_uxn_opcodes_h_l2751_c41_9acd_CLOCK_ENABLE <= VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_CLOCK_ENABLE;
     -- Inputs
     dei2_uxn_opcodes_h_l2751_c41_9acd_phase <= VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_phase;
     dei2_uxn_opcodes_h_l2751_c41_9acd_ins <= VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_ins;
     dei2_uxn_opcodes_h_l2751_c41_9acd_previous_stack_read <= VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_previous_stack_read;
     dei2_uxn_opcodes_h_l2751_c41_9acd_previous_device_ram_read <= VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_previous_device_ram_read;
     -- Outputs
     VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_return_output := dei2_uxn_opcodes_h_l2751_c41_9acd_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c7_59d1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2752_c1_d31d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_return_output;

     -- Submodule level 57
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output;
     VAR_deo_uxn_opcodes_h_l2752_c41_e372_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2752_c1_d31d_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_iftrue := VAR_dei2_uxn_opcodes_h_l2751_c41_9acd_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2753_c1_87b2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c7_67fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output;

     -- deo[uxn_opcodes_h_l2752_c41_e372] LATENCY=0
     -- Clock enable
     deo_uxn_opcodes_h_l2752_c41_e372_CLOCK_ENABLE <= VAR_deo_uxn_opcodes_h_l2752_c41_e372_CLOCK_ENABLE;
     -- Inputs
     deo_uxn_opcodes_h_l2752_c41_e372_phase <= VAR_deo_uxn_opcodes_h_l2752_c41_e372_phase;
     deo_uxn_opcodes_h_l2752_c41_e372_ins <= VAR_deo_uxn_opcodes_h_l2752_c41_e372_ins;
     deo_uxn_opcodes_h_l2752_c41_e372_previous_stack_read <= VAR_deo_uxn_opcodes_h_l2752_c41_e372_previous_stack_read;
     deo_uxn_opcodes_h_l2752_c41_e372_previous_device_ram_read <= VAR_deo_uxn_opcodes_h_l2752_c41_e372_previous_device_ram_read;
     deo_uxn_opcodes_h_l2752_c41_e372_previous_ram_read <= VAR_deo_uxn_opcodes_h_l2752_c41_e372_previous_ram_read;
     -- Outputs
     VAR_deo_uxn_opcodes_h_l2752_c41_e372_return_output := deo_uxn_opcodes_h_l2752_c41_e372_return_output;

     -- Submodule level 58
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output;
     VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2753_c1_87b2_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_iftrue := VAR_deo_uxn_opcodes_h_l2752_c41_e372_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2754_c1_ea55] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c7_b309] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_return_output;

     -- deo2[uxn_opcodes_h_l2753_c41_12a3] LATENCY=0
     -- Clock enable
     deo2_uxn_opcodes_h_l2753_c41_12a3_CLOCK_ENABLE <= VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_CLOCK_ENABLE;
     -- Inputs
     deo2_uxn_opcodes_h_l2753_c41_12a3_phase <= VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_phase;
     deo2_uxn_opcodes_h_l2753_c41_12a3_ins <= VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_ins;
     deo2_uxn_opcodes_h_l2753_c41_12a3_previous_stack_read <= VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_previous_stack_read;
     deo2_uxn_opcodes_h_l2753_c41_12a3_previous_device_ram_read <= VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_previous_device_ram_read;
     deo2_uxn_opcodes_h_l2753_c41_12a3_previous_ram_read <= VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_previous_ram_read;
     -- Outputs
     VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_return_output := deo2_uxn_opcodes_h_l2753_c41_12a3_return_output;

     -- Submodule level 59
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c7_b309_return_output;
     VAR_add_uxn_opcodes_h_l2754_c41_3abf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2754_c1_ea55_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_iftrue := VAR_deo2_uxn_opcodes_h_l2753_c41_12a3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c7_4e6d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output;

     -- add[uxn_opcodes_h_l2754_c41_3abf] LATENCY=0
     -- Clock enable
     add_uxn_opcodes_h_l2754_c41_3abf_CLOCK_ENABLE <= VAR_add_uxn_opcodes_h_l2754_c41_3abf_CLOCK_ENABLE;
     -- Inputs
     add_uxn_opcodes_h_l2754_c41_3abf_phase <= VAR_add_uxn_opcodes_h_l2754_c41_3abf_phase;
     add_uxn_opcodes_h_l2754_c41_3abf_ins <= VAR_add_uxn_opcodes_h_l2754_c41_3abf_ins;
     add_uxn_opcodes_h_l2754_c41_3abf_previous_stack_read <= VAR_add_uxn_opcodes_h_l2754_c41_3abf_previous_stack_read;
     -- Outputs
     VAR_add_uxn_opcodes_h_l2754_c41_3abf_return_output := add_uxn_opcodes_h_l2754_c41_3abf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2755_c1_df89] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_return_output;

     -- Submodule level 60
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output;
     VAR_add2_uxn_opcodes_h_l2755_c41_9ced_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2755_c1_df89_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_iftrue := VAR_add_uxn_opcodes_h_l2754_c41_3abf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c7_0ae3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output;

     -- add2[uxn_opcodes_h_l2755_c41_9ced] LATENCY=0
     -- Clock enable
     add2_uxn_opcodes_h_l2755_c41_9ced_CLOCK_ENABLE <= VAR_add2_uxn_opcodes_h_l2755_c41_9ced_CLOCK_ENABLE;
     -- Inputs
     add2_uxn_opcodes_h_l2755_c41_9ced_phase <= VAR_add2_uxn_opcodes_h_l2755_c41_9ced_phase;
     add2_uxn_opcodes_h_l2755_c41_9ced_ins <= VAR_add2_uxn_opcodes_h_l2755_c41_9ced_ins;
     add2_uxn_opcodes_h_l2755_c41_9ced_previous_stack_read <= VAR_add2_uxn_opcodes_h_l2755_c41_9ced_previous_stack_read;
     -- Outputs
     VAR_add2_uxn_opcodes_h_l2755_c41_9ced_return_output := add2_uxn_opcodes_h_l2755_c41_9ced_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2756_c1_df2f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_return_output;

     -- Submodule level 61
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output;
     VAR_sub_uxn_opcodes_h_l2756_c41_feda_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2756_c1_df2f_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_iftrue := VAR_add2_uxn_opcodes_h_l2755_c41_9ced_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c7_bf4e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2757_c1_79c6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_return_output;

     -- sub[uxn_opcodes_h_l2756_c41_feda] LATENCY=0
     -- Clock enable
     sub_uxn_opcodes_h_l2756_c41_feda_CLOCK_ENABLE <= VAR_sub_uxn_opcodes_h_l2756_c41_feda_CLOCK_ENABLE;
     -- Inputs
     sub_uxn_opcodes_h_l2756_c41_feda_phase <= VAR_sub_uxn_opcodes_h_l2756_c41_feda_phase;
     sub_uxn_opcodes_h_l2756_c41_feda_ins <= VAR_sub_uxn_opcodes_h_l2756_c41_feda_ins;
     sub_uxn_opcodes_h_l2756_c41_feda_previous_stack_read <= VAR_sub_uxn_opcodes_h_l2756_c41_feda_previous_stack_read;
     -- Outputs
     VAR_sub_uxn_opcodes_h_l2756_c41_feda_return_output := sub_uxn_opcodes_h_l2756_c41_feda_return_output;

     -- Submodule level 62
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output;
     VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2757_c1_79c6_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_iftrue := VAR_sub_uxn_opcodes_h_l2756_c41_feda_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2758_c1_4ace] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_return_output;

     -- sub2[uxn_opcodes_h_l2757_c41_6d67] LATENCY=0
     -- Clock enable
     sub2_uxn_opcodes_h_l2757_c41_6d67_CLOCK_ENABLE <= VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_CLOCK_ENABLE;
     -- Inputs
     sub2_uxn_opcodes_h_l2757_c41_6d67_phase <= VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_phase;
     sub2_uxn_opcodes_h_l2757_c41_6d67_ins <= VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_ins;
     sub2_uxn_opcodes_h_l2757_c41_6d67_previous_stack_read <= VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_previous_stack_read;
     -- Outputs
     VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_return_output := sub2_uxn_opcodes_h_l2757_c41_6d67_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c7_2d30] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output;

     -- Submodule level 63
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output;
     VAR_mul_uxn_opcodes_h_l2758_c41_7257_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2758_c1_4ace_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_iftrue := VAR_sub2_uxn_opcodes_h_l2757_c41_6d67_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c7_749b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_return_output;

     -- mul[uxn_opcodes_h_l2758_c41_7257] LATENCY=0
     -- Clock enable
     mul_uxn_opcodes_h_l2758_c41_7257_CLOCK_ENABLE <= VAR_mul_uxn_opcodes_h_l2758_c41_7257_CLOCK_ENABLE;
     -- Inputs
     mul_uxn_opcodes_h_l2758_c41_7257_phase <= VAR_mul_uxn_opcodes_h_l2758_c41_7257_phase;
     mul_uxn_opcodes_h_l2758_c41_7257_ins <= VAR_mul_uxn_opcodes_h_l2758_c41_7257_ins;
     mul_uxn_opcodes_h_l2758_c41_7257_previous_stack_read <= VAR_mul_uxn_opcodes_h_l2758_c41_7257_previous_stack_read;
     -- Outputs
     VAR_mul_uxn_opcodes_h_l2758_c41_7257_return_output := mul_uxn_opcodes_h_l2758_c41_7257_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2759_c1_e093] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_return_output;

     -- Submodule level 64
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c7_749b_return_output;
     VAR_mul2_uxn_opcodes_h_l2759_c41_1949_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2759_c1_e093_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_iftrue := VAR_mul_uxn_opcodes_h_l2758_c41_7257_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2760_c1_58ba] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c7_e3c7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output;

     -- mul2[uxn_opcodes_h_l2759_c41_1949] LATENCY=0
     -- Clock enable
     mul2_uxn_opcodes_h_l2759_c41_1949_CLOCK_ENABLE <= VAR_mul2_uxn_opcodes_h_l2759_c41_1949_CLOCK_ENABLE;
     -- Inputs
     mul2_uxn_opcodes_h_l2759_c41_1949_phase <= VAR_mul2_uxn_opcodes_h_l2759_c41_1949_phase;
     mul2_uxn_opcodes_h_l2759_c41_1949_ins <= VAR_mul2_uxn_opcodes_h_l2759_c41_1949_ins;
     mul2_uxn_opcodes_h_l2759_c41_1949_previous_stack_read <= VAR_mul2_uxn_opcodes_h_l2759_c41_1949_previous_stack_read;
     -- Outputs
     VAR_mul2_uxn_opcodes_h_l2759_c41_1949_return_output := mul2_uxn_opcodes_h_l2759_c41_1949_return_output;

     -- Submodule level 65
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output;
     VAR_div_uxn_opcodes_h_l2760_c41_6c4e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2760_c1_58ba_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_iftrue := VAR_mul2_uxn_opcodes_h_l2759_c41_1949_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2761_c1_f836] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_return_output;

     -- div[uxn_opcodes_h_l2760_c41_6c4e] LATENCY=0
     -- Clock enable
     div_uxn_opcodes_h_l2760_c41_6c4e_CLOCK_ENABLE <= VAR_div_uxn_opcodes_h_l2760_c41_6c4e_CLOCK_ENABLE;
     -- Inputs
     div_uxn_opcodes_h_l2760_c41_6c4e_phase <= VAR_div_uxn_opcodes_h_l2760_c41_6c4e_phase;
     div_uxn_opcodes_h_l2760_c41_6c4e_ins <= VAR_div_uxn_opcodes_h_l2760_c41_6c4e_ins;
     div_uxn_opcodes_h_l2760_c41_6c4e_previous_stack_read <= VAR_div_uxn_opcodes_h_l2760_c41_6c4e_previous_stack_read;
     -- Outputs
     VAR_div_uxn_opcodes_h_l2760_c41_6c4e_return_output := div_uxn_opcodes_h_l2760_c41_6c4e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c7_c6ec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output;

     -- Submodule level 66
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output;
     VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2761_c1_f836_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_iftrue := VAR_div_uxn_opcodes_h_l2760_c41_6c4e_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2762_c1_1efa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c7_653f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_return_output;

     -- div2[uxn_opcodes_h_l2761_c41_0c5c] LATENCY=0
     -- Clock enable
     div2_uxn_opcodes_h_l2761_c41_0c5c_CLOCK_ENABLE <= VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_CLOCK_ENABLE;
     -- Inputs
     div2_uxn_opcodes_h_l2761_c41_0c5c_phase <= VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_phase;
     div2_uxn_opcodes_h_l2761_c41_0c5c_ins <= VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_ins;
     div2_uxn_opcodes_h_l2761_c41_0c5c_previous_stack_read <= VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_previous_stack_read;
     -- Outputs
     VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_return_output := div2_uxn_opcodes_h_l2761_c41_0c5c_return_output;

     -- Submodule level 67
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c7_653f_return_output;
     VAR_and_uxn_opcodes_h_l2762_c41_ddd3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2762_c1_1efa_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_iftrue := VAR_div2_uxn_opcodes_h_l2761_c41_0c5c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c7_b901] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2763_c1_bd60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_return_output;

     -- and[uxn_opcodes_h_l2762_c41_ddd3] LATENCY=0
     -- Clock enable
     and_uxn_opcodes_h_l2762_c41_ddd3_CLOCK_ENABLE <= VAR_and_uxn_opcodes_h_l2762_c41_ddd3_CLOCK_ENABLE;
     -- Inputs
     and_uxn_opcodes_h_l2762_c41_ddd3_phase <= VAR_and_uxn_opcodes_h_l2762_c41_ddd3_phase;
     and_uxn_opcodes_h_l2762_c41_ddd3_ins <= VAR_and_uxn_opcodes_h_l2762_c41_ddd3_ins;
     and_uxn_opcodes_h_l2762_c41_ddd3_previous_stack_read <= VAR_and_uxn_opcodes_h_l2762_c41_ddd3_previous_stack_read;
     -- Outputs
     VAR_and_uxn_opcodes_h_l2762_c41_ddd3_return_output := and_uxn_opcodes_h_l2762_c41_ddd3_return_output;

     -- Submodule level 68
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c7_b901_return_output;
     VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2763_c1_bd60_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_iftrue := VAR_and_uxn_opcodes_h_l2762_c41_ddd3_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c7_edc3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2764_c1_10cc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_return_output;

     -- and2[uxn_opcodes_h_l2763_c41_ef9c] LATENCY=0
     -- Clock enable
     and2_uxn_opcodes_h_l2763_c41_ef9c_CLOCK_ENABLE <= VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_CLOCK_ENABLE;
     -- Inputs
     and2_uxn_opcodes_h_l2763_c41_ef9c_phase <= VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_phase;
     and2_uxn_opcodes_h_l2763_c41_ef9c_ins <= VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_ins;
     and2_uxn_opcodes_h_l2763_c41_ef9c_previous_stack_read <= VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_previous_stack_read;
     -- Outputs
     VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_return_output := and2_uxn_opcodes_h_l2763_c41_ef9c_return_output;

     -- Submodule level 69
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output;
     VAR_ora_uxn_opcodes_h_l2764_c41_9127_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2764_c1_10cc_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_iftrue := VAR_and2_uxn_opcodes_h_l2763_c41_ef9c_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2765_c1_3d86] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_return_output;

     -- ora[uxn_opcodes_h_l2764_c41_9127] LATENCY=0
     -- Clock enable
     ora_uxn_opcodes_h_l2764_c41_9127_CLOCK_ENABLE <= VAR_ora_uxn_opcodes_h_l2764_c41_9127_CLOCK_ENABLE;
     -- Inputs
     ora_uxn_opcodes_h_l2764_c41_9127_phase <= VAR_ora_uxn_opcodes_h_l2764_c41_9127_phase;
     ora_uxn_opcodes_h_l2764_c41_9127_ins <= VAR_ora_uxn_opcodes_h_l2764_c41_9127_ins;
     ora_uxn_opcodes_h_l2764_c41_9127_previous_stack_read <= VAR_ora_uxn_opcodes_h_l2764_c41_9127_previous_stack_read;
     -- Outputs
     VAR_ora_uxn_opcodes_h_l2764_c41_9127_return_output := ora_uxn_opcodes_h_l2764_c41_9127_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c7_c424] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_return_output;

     -- Submodule level 70
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c7_c424_return_output;
     VAR_ora2_uxn_opcodes_h_l2765_c41_1769_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2765_c1_3d86_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_iftrue := VAR_ora_uxn_opcodes_h_l2764_c41_9127_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c7_f2cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2766_c1_6146] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_return_output;

     -- ora2[uxn_opcodes_h_l2765_c41_1769] LATENCY=0
     -- Clock enable
     ora2_uxn_opcodes_h_l2765_c41_1769_CLOCK_ENABLE <= VAR_ora2_uxn_opcodes_h_l2765_c41_1769_CLOCK_ENABLE;
     -- Inputs
     ora2_uxn_opcodes_h_l2765_c41_1769_phase <= VAR_ora2_uxn_opcodes_h_l2765_c41_1769_phase;
     ora2_uxn_opcodes_h_l2765_c41_1769_ins <= VAR_ora2_uxn_opcodes_h_l2765_c41_1769_ins;
     ora2_uxn_opcodes_h_l2765_c41_1769_previous_stack_read <= VAR_ora2_uxn_opcodes_h_l2765_c41_1769_previous_stack_read;
     -- Outputs
     VAR_ora2_uxn_opcodes_h_l2765_c41_1769_return_output := ora2_uxn_opcodes_h_l2765_c41_1769_return_output;

     -- Submodule level 71
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output;
     VAR_eor_uxn_opcodes_h_l2766_c41_a32b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2766_c1_6146_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_iftrue := VAR_ora2_uxn_opcodes_h_l2765_c41_1769_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2767_c1_b637] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c7_c600] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_return_output;

     -- eor[uxn_opcodes_h_l2766_c41_a32b] LATENCY=0
     -- Clock enable
     eor_uxn_opcodes_h_l2766_c41_a32b_CLOCK_ENABLE <= VAR_eor_uxn_opcodes_h_l2766_c41_a32b_CLOCK_ENABLE;
     -- Inputs
     eor_uxn_opcodes_h_l2766_c41_a32b_phase <= VAR_eor_uxn_opcodes_h_l2766_c41_a32b_phase;
     eor_uxn_opcodes_h_l2766_c41_a32b_ins <= VAR_eor_uxn_opcodes_h_l2766_c41_a32b_ins;
     eor_uxn_opcodes_h_l2766_c41_a32b_previous_stack_read <= VAR_eor_uxn_opcodes_h_l2766_c41_a32b_previous_stack_read;
     -- Outputs
     VAR_eor_uxn_opcodes_h_l2766_c41_a32b_return_output := eor_uxn_opcodes_h_l2766_c41_a32b_return_output;

     -- Submodule level 72
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c7_c600_return_output;
     VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2767_c1_b637_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_iftrue := VAR_eor_uxn_opcodes_h_l2766_c41_a32b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2768_c1_d24b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_return_output;

     -- eor2[uxn_opcodes_h_l2767_c41_d86f] LATENCY=0
     -- Clock enable
     eor2_uxn_opcodes_h_l2767_c41_d86f_CLOCK_ENABLE <= VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_CLOCK_ENABLE;
     -- Inputs
     eor2_uxn_opcodes_h_l2767_c41_d86f_phase <= VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_phase;
     eor2_uxn_opcodes_h_l2767_c41_d86f_ins <= VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_ins;
     eor2_uxn_opcodes_h_l2767_c41_d86f_previous_stack_read <= VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_previous_stack_read;
     -- Outputs
     VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_return_output := eor2_uxn_opcodes_h_l2767_c41_d86f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c7_0579] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_return_output;

     -- Submodule level 73
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c7_0579_return_output;
     VAR_sft_uxn_opcodes_h_l2768_c41_8e76_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2768_c1_d24b_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_iftrue := VAR_eor2_uxn_opcodes_h_l2767_c41_d86f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2770_c1_8598] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_return_output;

     -- sft[uxn_opcodes_h_l2768_c41_8e76] LATENCY=0
     -- Clock enable
     sft_uxn_opcodes_h_l2768_c41_8e76_CLOCK_ENABLE <= VAR_sft_uxn_opcodes_h_l2768_c41_8e76_CLOCK_ENABLE;
     -- Inputs
     sft_uxn_opcodes_h_l2768_c41_8e76_phase <= VAR_sft_uxn_opcodes_h_l2768_c41_8e76_phase;
     sft_uxn_opcodes_h_l2768_c41_8e76_ins <= VAR_sft_uxn_opcodes_h_l2768_c41_8e76_ins;
     sft_uxn_opcodes_h_l2768_c41_8e76_previous_stack_read <= VAR_sft_uxn_opcodes_h_l2768_c41_8e76_previous_stack_read;
     -- Outputs
     VAR_sft_uxn_opcodes_h_l2768_c41_8e76_return_output := sft_uxn_opcodes_h_l2768_c41_8e76_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2769_c1_fcd8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_return_output;

     -- Submodule level 74
     VAR_printf_uxn_opcodes_h_l2770_c9_0215_uxn_opcodes_h_l2770_c9_0215_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2770_c1_8598_return_output;
     VAR_sft2_uxn_opcodes_h_l2769_c41_d577_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2769_c1_fcd8_return_output;
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_iftrue := VAR_sft_uxn_opcodes_h_l2768_c41_8e76_return_output;
     -- printf_uxn_opcodes_h_l2770_c9_0215[uxn_opcodes_h_l2770_c9_0215] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2770_c9_0215_uxn_opcodes_h_l2770_c9_0215_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2770_c9_0215_uxn_opcodes_h_l2770_c9_0215_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_opcodes_h_l2770_c9_0215_uxn_opcodes_h_l2770_c9_0215_arg0 <= VAR_printf_uxn_opcodes_h_l2770_c9_0215_uxn_opcodes_h_l2770_c9_0215_arg0;
     -- Outputs

     -- sft2[uxn_opcodes_h_l2769_c41_d577] LATENCY=0
     -- Clock enable
     sft2_uxn_opcodes_h_l2769_c41_d577_CLOCK_ENABLE <= VAR_sft2_uxn_opcodes_h_l2769_c41_d577_CLOCK_ENABLE;
     -- Inputs
     sft2_uxn_opcodes_h_l2769_c41_d577_phase <= VAR_sft2_uxn_opcodes_h_l2769_c41_d577_phase;
     sft2_uxn_opcodes_h_l2769_c41_d577_ins <= VAR_sft2_uxn_opcodes_h_l2769_c41_d577_ins;
     sft2_uxn_opcodes_h_l2769_c41_d577_previous_stack_read <= VAR_sft2_uxn_opcodes_h_l2769_c41_d577_previous_stack_read;
     -- Outputs
     VAR_sft2_uxn_opcodes_h_l2769_c41_d577_return_output := sft2_uxn_opcodes_h_l2769_c41_d577_return_output;

     -- Submodule level 75
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_iftrue := VAR_sft2_uxn_opcodes_h_l2769_c41_d577_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2769_c7_0579] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_cond;
     opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_return_output := opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_return_output;

     -- Submodule level 76
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2769_c7_0579_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2768_c7_c600] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_cond;
     opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_return_output := opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_return_output;

     -- Submodule level 77
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2768_c7_c600_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2767_c7_f2cc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_cond;
     opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output := opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output;

     -- Submodule level 78
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2767_c7_f2cc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2766_c7_c424] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_cond;
     opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_return_output := opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_return_output;

     -- Submodule level 79
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2766_c7_c424_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2765_c7_edc3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_cond;
     opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output := opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output;

     -- Submodule level 80
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2765_c7_edc3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2764_c7_b901] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_cond;
     opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_return_output := opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_return_output;

     -- Submodule level 81
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2764_c7_b901_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2763_c7_653f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_cond;
     opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_return_output := opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_return_output;

     -- Submodule level 82
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2763_c7_653f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2762_c7_c6ec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_cond;
     opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output := opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output;

     -- Submodule level 83
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2762_c7_c6ec_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2761_c7_e3c7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_cond;
     opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output := opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output;

     -- Submodule level 84
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2761_c7_e3c7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2760_c7_749b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_cond;
     opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_return_output := opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_return_output;

     -- Submodule level 85
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2760_c7_749b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2759_c7_2d30] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_cond;
     opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output := opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output;

     -- Submodule level 86
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2759_c7_2d30_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2758_c7_bf4e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_cond;
     opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output := opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output;

     -- Submodule level 87
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2758_c7_bf4e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2757_c7_0ae3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_cond;
     opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output := opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output;

     -- Submodule level 88
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2757_c7_0ae3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2756_c7_4e6d] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_cond;
     opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output := opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output;

     -- Submodule level 89
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2756_c7_4e6d_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2755_c7_b309] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_cond;
     opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_return_output := opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_return_output;

     -- Submodule level 90
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2755_c7_b309_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2754_c7_67fd] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_cond;
     opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output := opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output;

     -- Submodule level 91
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2754_c7_67fd_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2753_c7_59d1] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_cond;
     opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output := opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output;

     -- Submodule level 92
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2753_c7_59d1_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2752_c7_8ae0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_cond;
     opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output := opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output;

     -- Submodule level 93
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2752_c7_8ae0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2751_c7_3918] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_cond;
     opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_return_output := opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_return_output;

     -- Submodule level 94
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2751_c7_3918_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2750_c7_594a] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_cond;
     opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_return_output := opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_return_output;

     -- Submodule level 95
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2750_c7_594a_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2749_c7_c378] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_cond;
     opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_return_output := opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_return_output;

     -- Submodule level 96
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2749_c7_c378_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2748_c7_9ffc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_cond;
     opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output := opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output;

     -- Submodule level 97
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2748_c7_9ffc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2747_c7_6ca7] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_cond;
     opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output := opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output;

     -- Submodule level 98
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2747_c7_6ca7_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2746_c7_7272] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_cond;
     opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_return_output := opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_return_output;

     -- Submodule level 99
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2746_c7_7272_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2745_c7_04c0] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_cond;
     opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output := opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output;

     -- Submodule level 100
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2745_c7_04c0_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2744_c7_4b17] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_cond;
     opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output := opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output;

     -- Submodule level 101
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2744_c7_4b17_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2743_c7_63d8] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_cond;
     opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output := opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output;

     -- Submodule level 102
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2743_c7_63d8_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2742_c7_6ebc] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_cond;
     opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output := opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output;

     -- Submodule level 103
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2742_c7_6ebc_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2741_c7_dabb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_cond;
     opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output := opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output;

     -- Submodule level 104
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2741_c7_dabb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2740_c7_8b6c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_cond;
     opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output := opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output;

     -- Submodule level 105
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2740_c7_8b6c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2739_c7_7bf4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_cond;
     opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output := opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output;

     -- Submodule level 106
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2739_c7_7bf4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2738_c7_6ed5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_cond;
     opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output := opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output;

     -- Submodule level 107
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2738_c7_6ed5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2737_c7_c7d4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_cond;
     opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output := opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output;

     -- Submodule level 108
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2737_c7_c7d4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2736_c7_fd1b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_cond;
     opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output := opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output;

     -- Submodule level 109
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2736_c7_fd1b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2735_c7_2d28] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_cond;
     opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output := opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output;

     -- Submodule level 110
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2735_c7_2d28_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2734_c7_c7e4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_cond;
     opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output := opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output;

     -- Submodule level 111
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2734_c7_c7e4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2733_c7_07ec] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_cond;
     opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output := opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output;

     -- Submodule level 112
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2733_c7_07ec_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2732_c7_9416] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_cond;
     opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_return_output := opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_return_output;

     -- Submodule level 113
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2732_c7_9416_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2731_c7_efc3] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_cond;
     opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output := opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output;

     -- Submodule level 114
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2731_c7_efc3_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2730_c7_0b76] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_cond;
     opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output := opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output;

     -- Submodule level 115
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2730_c7_0b76_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2729_c7_e883] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_cond;
     opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_return_output := opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_return_output;

     -- Submodule level 116
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2729_c7_e883_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2728_c7_ac0b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_cond;
     opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output := opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output;

     -- Submodule level 117
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2728_c7_ac0b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2727_c7_fe68] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_cond;
     opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output := opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output;

     -- Submodule level 118
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2727_c7_fe68_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2726_c7_f734] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_cond;
     opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_return_output := opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_return_output;

     -- Submodule level 119
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2726_c7_f734_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2725_c7_3d5f] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_cond;
     opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output := opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output;

     -- Submodule level 120
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2725_c7_3d5f_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2724_c7_5a41] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_cond;
     opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output := opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output;

     -- Submodule level 121
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2724_c7_5a41_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2723_c7_462e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_cond;
     opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_return_output := opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_return_output;

     -- Submodule level 122
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2723_c7_462e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2722_c7_51db] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_cond;
     opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_return_output := opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_return_output;

     -- Submodule level 123
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2722_c7_51db_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2721_c7_25f4] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_cond;
     opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output := opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output;

     -- Submodule level 124
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2721_c7_25f4_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2720_c7_cf11] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_cond;
     opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output := opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output;

     -- Submodule level 125
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2720_c7_cf11_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2719_c7_b6a5] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_cond;
     opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output := opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output;

     -- Submodule level 126
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2719_c7_b6a5_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2718_c7_750b] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_cond;
     opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_return_output := opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_return_output;

     -- Submodule level 127
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2718_c7_750b_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2717_c7_d1ca] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_cond;
     opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output := opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output;

     -- Submodule level 128
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2717_c7_d1ca_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2716_c7_2dbb] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_cond;
     opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output := opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output;

     -- Submodule level 129
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2716_c7_2dbb_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2715_c7_4b75] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_cond;
     opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output := opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output;

     -- Submodule level 130
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2715_c7_4b75_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2714_c7_081e] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_cond;
     opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_return_output := opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_return_output;

     -- Submodule level 131
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2714_c7_081e_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2713_c7_69ef] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_cond;
     opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output := opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output;

     -- Submodule level 132
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2713_c7_69ef_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2712_c7_47c2] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_cond;
     opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output := opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output;

     -- Submodule level 133
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2712_c7_47c2_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2711_c7_b119] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_cond;
     opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_return_output := opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_return_output;

     -- Submodule level 134
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2711_c7_b119_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2710_c7_a395] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_cond;
     opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_return_output := opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_return_output;

     -- Submodule level 135
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2710_c7_a395_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2709_c7_ee05] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_cond;
     opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output := opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output;

     -- Submodule level 136
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2709_c7_ee05_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2708_c7_ce98] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_cond;
     opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output := opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output;

     -- Submodule level 137
     VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2708_c7_ce98_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2707_c7_882c] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_cond;
     opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_return_output := opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_return_output;

     -- Submodule level 138
     VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2707_c7_882c_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2706_c7_c492] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_cond;
     opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_return_output := opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_return_output;

     -- Submodule level 139
     VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2706_c7_c492_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2705_c7_6821] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_cond;
     opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_return_output := opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_return_output;

     -- Submodule level 140
     VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2705_c7_6821_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2704_c7_8860] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_cond;
     opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_return_output := opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_return_output;

     -- Submodule level 141
     VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2704_c7_8860_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2703_c7_3648] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_cond;
     opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_return_output := opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_return_output;

     -- Submodule level 142
     VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2703_c7_3648_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2702_c7_d538] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_cond;
     opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_return_output := opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_return_output;

     -- Submodule level 143
     VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2702_c7_d538_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2701_c7_5c17] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_cond;
     opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output := opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output;

     -- Submodule level 144
     VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_iffalse := VAR_opc_result_MUX_uxn_opcodes_h_l2701_c7_5c17_return_output;
     -- opc_result_MUX[uxn_opcodes_h_l2700_c2_d362] LATENCY=0
     -- Inputs
     opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_cond <= VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_cond;
     opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_iftrue <= VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_iftrue;
     opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_iffalse <= VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_iffalse;
     -- Outputs
     VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output := opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output;

     -- Submodule level 145
     REG_VAR_opc_result := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output;
     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d[uxn_opcodes_h_l2793_c39_95ff] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2793_c39_95ff_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.device_ram_address;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l2796_c30_478c] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2796_c30_478c_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2789_c3_3a80] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2789_c3_3a80_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2797_c33_c282] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2797_c33_c282_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2788_l2801_DUPLICATE_acc5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2788_l2801_DUPLICATE_acc5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2777_l2779_DUPLICATE_4f46 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2777_l2779_DUPLICATE_4f46_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d[uxn_opcodes_h_l2802_c32_80df] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2802_c32_80df_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2798_c34_5fd5] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2798_c34_5fd5_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l2775_c6_6a3d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2775_c6_6a3d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2795_c34_bf3d] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2795_c34_bf3d_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.is_pc_updated;

     -- CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d[uxn_opcodes_h_l2800_c33_1e25] LATENCY=0
     VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2800_c33_1e25_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.vram_address;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2783_c70_4542] LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2783_c70_4542_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2773_c17_c5ba] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2773_c17_c5ba_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l2794_c40_cc35] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2794_c40_cc35_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d[uxn_opcodes_h_l2799_c37_e3d2] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2799_c37_e3d2_return_output := VAR_opc_result_MUX_uxn_opcodes_h_l2700_c2_d362_return_output.vram_write_layer;

     -- Submodule level 146
     VAR_sp0_MUX_uxn_opcodes_h_l2775_c2_289c_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2775_c6_6a3d_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2775_c2_289c_cond := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2775_c6_6a3d_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_right := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2773_c17_c5ba_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_write_enable := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2789_c3_3a80_return_output;
     VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_value := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2788_l2801_DUPLICATE_acc5_return_output;
     -- CAST_TO_uint12_t[uxn_opcodes_h_l2783_c59_7bd3] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2783_c59_7bd3_return_output := CAST_TO_uint12_t_uint4_t(
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2783_c70_4542_return_output);

     -- BIN_OP_XOR[uxn_opcodes_h_l2773_c2_fd9e] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_left;
     BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_return_output := BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_return_output;

     -- CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2804_l2682_DUPLICATE_be73 LATENCY=0
     VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2804_l2682_DUPLICATE_be73_return_output := CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9(
     VAR_is_wait_MUX_uxn_opcodes_h_l2700_c2_d362_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l2793_c39_95ff_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l2794_c40_cc35_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2795_c34_bf3d_return_output,
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2796_c30_478c_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2797_c33_c282_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2798_c34_5fd5_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l2799_c37_e3d2_return_output,
     VAR_CONST_REF_RD_uint24_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l2800_c33_1e25_return_output,
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2788_l2801_DUPLICATE_acc5_return_output,
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2802_c32_80df_return_output);

     -- CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2779_l2777_DUPLICATE_5091 LATENCY=0
     VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2779_l2777_DUPLICATE_5091_return_output := CAST_TO_int8_t_int4_t(
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2777_l2779_DUPLICATE_4f46_return_output);

     -- Submodule level 147
     VAR_MUX_uxn_opcodes_h_l2783_c30_f258_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_return_output;
     VAR_MUX_uxn_opcodes_h_l2784_c20_b9b7_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_cond := VAR_BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_return_output;
     REG_VAR_stack_index := VAR_BIN_OP_XOR_uxn_opcodes_h_l2773_c2_fd9e_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2779_l2777_DUPLICATE_5091_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_right := VAR_CAST_TO_int8_t_int4_t_uxn_opcodes_h_l2779_l2777_DUPLICATE_5091_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_right := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2783_c59_7bd3_return_output;
     REG_VAR_opc_eval_result := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2804_l2682_DUPLICATE_be73_return_output;
     VAR_return_output := VAR_CONST_REF_RD_eval_opcode_result_t_eval_opcode_result_t_27e9_uxn_opcodes_h_l2804_l2682_DUPLICATE_be73_return_output;
     -- MUX[uxn_opcodes_h_l2784_c20_b9b7] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2784_c20_b9b7_cond <= VAR_MUX_uxn_opcodes_h_l2784_c20_b9b7_cond;
     MUX_uxn_opcodes_h_l2784_c20_b9b7_iftrue <= VAR_MUX_uxn_opcodes_h_l2784_c20_b9b7_iftrue;
     MUX_uxn_opcodes_h_l2784_c20_b9b7_iffalse <= VAR_MUX_uxn_opcodes_h_l2784_c20_b9b7_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2784_c20_b9b7_return_output := MUX_uxn_opcodes_h_l2784_c20_b9b7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2777_c4_5c4b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2779_c4_66b5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_return_output;

     -- Submodule level 148
     VAR_sp1_uxn_opcodes_h_l2777_c4_7820 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2777_c4_5c4b_return_output)),8);
     VAR_sp0_uxn_opcodes_h_l2779_c4_dbfe := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2779_c4_66b5_return_output)),8);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_right := VAR_MUX_uxn_opcodes_h_l2784_c20_b9b7_return_output;
     VAR_sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_iffalse := VAR_sp0_uxn_opcodes_h_l2779_c4_dbfe;
     VAR_sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_iftrue := VAR_sp1_uxn_opcodes_h_l2777_c4_7820;
     -- sp0_MUX[uxn_opcodes_h_l2776_c3_abb5] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_cond;
     sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_iftrue;
     sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_return_output := sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2776_c3_abb5] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_cond;
     sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_iftrue;
     sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_return_output := sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_return_output;

     -- Submodule level 149
     VAR_sp0_MUX_uxn_opcodes_h_l2775_c2_289c_iftrue := VAR_sp0_MUX_uxn_opcodes_h_l2776_c3_abb5_return_output;
     VAR_sp1_MUX_uxn_opcodes_h_l2775_c2_289c_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2776_c3_abb5_return_output;
     -- sp0_MUX[uxn_opcodes_h_l2775_c2_289c] LATENCY=0
     -- Inputs
     sp0_MUX_uxn_opcodes_h_l2775_c2_289c_cond <= VAR_sp0_MUX_uxn_opcodes_h_l2775_c2_289c_cond;
     sp0_MUX_uxn_opcodes_h_l2775_c2_289c_iftrue <= VAR_sp0_MUX_uxn_opcodes_h_l2775_c2_289c_iftrue;
     sp0_MUX_uxn_opcodes_h_l2775_c2_289c_iffalse <= VAR_sp0_MUX_uxn_opcodes_h_l2775_c2_289c_iffalse;
     -- Outputs
     VAR_sp0_MUX_uxn_opcodes_h_l2775_c2_289c_return_output := sp0_MUX_uxn_opcodes_h_l2775_c2_289c_return_output;

     -- sp1_MUX[uxn_opcodes_h_l2775_c2_289c] LATENCY=0
     -- Inputs
     sp1_MUX_uxn_opcodes_h_l2775_c2_289c_cond <= VAR_sp1_MUX_uxn_opcodes_h_l2775_c2_289c_cond;
     sp1_MUX_uxn_opcodes_h_l2775_c2_289c_iftrue <= VAR_sp1_MUX_uxn_opcodes_h_l2775_c2_289c_iftrue;
     sp1_MUX_uxn_opcodes_h_l2775_c2_289c_iffalse <= VAR_sp1_MUX_uxn_opcodes_h_l2775_c2_289c_iffalse;
     -- Outputs
     VAR_sp1_MUX_uxn_opcodes_h_l2775_c2_289c_return_output := sp1_MUX_uxn_opcodes_h_l2775_c2_289c_return_output;

     -- Submodule level 150
     VAR_MUX_uxn_opcodes_h_l2783_c30_f258_iffalse := VAR_sp0_MUX_uxn_opcodes_h_l2775_c2_289c_return_output;
     REG_VAR_sp0 := VAR_sp0_MUX_uxn_opcodes_h_l2775_c2_289c_return_output;
     VAR_MUX_uxn_opcodes_h_l2783_c30_f258_iftrue := VAR_sp1_MUX_uxn_opcodes_h_l2775_c2_289c_return_output;
     REG_VAR_sp1 := VAR_sp1_MUX_uxn_opcodes_h_l2775_c2_289c_return_output;
     -- MUX[uxn_opcodes_h_l2783_c30_f258] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2783_c30_f258_cond <= VAR_MUX_uxn_opcodes_h_l2783_c30_f258_cond;
     MUX_uxn_opcodes_h_l2783_c30_f258_iftrue <= VAR_MUX_uxn_opcodes_h_l2783_c30_f258_iftrue;
     MUX_uxn_opcodes_h_l2783_c30_f258_iffalse <= VAR_MUX_uxn_opcodes_h_l2783_c30_f258_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2783_c30_f258_return_output := MUX_uxn_opcodes_h_l2783_c30_f258_return_output;

     -- Submodule level 151
     -- CAST_TO_uint12_t[uxn_opcodes_h_l2783_c19_7d8d] LATENCY=0
     VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2783_c19_7d8d_return_output := CAST_TO_uint12_t_uint8_t(
     VAR_MUX_uxn_opcodes_h_l2783_c30_f258_return_output);

     -- Submodule level 152
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_left := VAR_CAST_TO_uint12_t_uxn_opcodes_h_l2783_c19_7d8d_return_output;
     -- BIN_OP_MINUS[uxn_opcodes_h_l2783_c19_fc16] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_return_output;

     -- Submodule level 153
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_left := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2783_c19_fc16_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l2784_c2_ff6c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_return_output;

     -- Submodule level 154
     VAR_stack_address_uxn_opcodes_h_l2784_c2_4484 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2784_c2_ff6c_return_output, 12);
     REG_VAR_stack_address := VAR_stack_address_uxn_opcodes_h_l2784_c2_4484;
     VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_stack_address := VAR_stack_address_uxn_opcodes_h_l2784_c2_4484;
     -- stack_ram_update[uxn_opcodes_h_l2786_c21_c47b] LATENCY=0
     -- Clock enable
     stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_CLOCK_ENABLE <= VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_CLOCK_ENABLE;
     -- Inputs
     stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_stack_address <= VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_stack_address;
     stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_value <= VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_value;
     stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_write_enable <= VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_write_enable;
     -- Outputs
     VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_return_output := stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_return_output;

     -- Submodule level 155
     REG_VAR_stack_read_value := VAR_stack_ram_update_uxn_opcodes_h_l2786_c21_c47b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_sp0 <= REG_VAR_sp0;
REG_COMB_sp1 <= REG_VAR_sp1;
REG_COMB_opc <= REG_VAR_opc;
REG_COMB_stack_index <= REG_VAR_stack_index;
REG_COMB_is_wait <= REG_VAR_is_wait;
REG_COMB_stack_address <= REG_VAR_stack_address;
REG_COMB_stack_read_value <= REG_VAR_stack_read_value;
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
     is_wait <= REG_COMB_is_wait;
     stack_address <= REG_COMB_stack_address;
     stack_read_value <= REG_COMB_stack_read_value;
     opc_result <= REG_COMB_opc_result;
     opc_eval_result <= REG_COMB_opc_eval_result;
 end if;
 end if;
end process;

end arch;
